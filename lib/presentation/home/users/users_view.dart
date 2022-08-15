import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/components/action_button.dart';
import 'package:cma_admin/presentation/components/circle_image.dart';
import 'package:cma_admin/presentation/components/custom_data_table.dart';
import 'package:cma_admin/presentation/components/data_statistique_item.dart';
import 'package:cma_admin/presentation/components/headar_text.dart';
import 'package:cma_admin/presentation/components/responsive_grid.dart';
import 'package:cma_admin/presentation/home/users/users_viewmodel.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/icon_manager.dart';
import 'package:cma_admin/presentation/resources/routes_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class UserView extends StatefulWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  UserViewModel _viewModel = instance<UserViewModel>();
  List<String> columns = [
    "N°",
    "image",
    "Name",
    "UserName",
    "CreatedAt",
    "Role",
    "Active",
    // "Actions"
  ];

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data
                  ?.getScreenWidget(context, _getcontentScreenWidget(), () {
                _bind();
              }) ??
              Container();
        });
  }

  Widget _getcontentScreenWidget() {
    return StreamBuilder<List<User>>(
        stream: _viewModel.outputUsers,
        builder: (context, snapshot) {
          List<User>? users = snapshot.data;
          if (users != null) {
            return _getDataTable(users);
          } else {
            return Container();
          }
        });
  }

  Widget _getDataTable(List<User> users) {
    return SingleChildScrollView(
      controller: ScrollController(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppSize.s20),
          _getHeaders(users),
          SizedBox(height: AppSize.s20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: _getStatiqueGrid(users),
          ),
          SizedBox(height: AppSize.s20),
          CustomDataTable(
              columns: columns.map((column) => DataColumn(label: Text(column))).toList(),
              rows: users.map((user) => DataRow(
                  cells: [
                        DataCell(Text(user.id.toString())),
                        DataCell(CircleImage(user.image)),
                        DataCell(Text(user.name)),
                        DataCell(Text(user.userName)),
                        DataCell(Text(user.createdAt)),
                        DataCell(Text(user.role)),
                        DataCell(Switch(
                            value: user.active,
                            onChanged: (value) {_viewModel.activeToggle(context,user, users);})),
                        // DataCell(PopUpMenuColumn(
                        //     update: () {},
                        //     )),
                      ])).toList())
        ],
      ),
    );
  }

  Widget _getHeaders(List<User> users) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderText(AppStrings.users),
          Row(
            children: [
              ActionButton(
                title: AppStrings.addUser,
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.addUserRoute).then((_) => _bind());
                },
                color: ColorManager.primary),
              SizedBox(width: AppSize.s10),
              ActionButton(
                title: AppStrings.exportExcel,
                onTap: () {
                  
                },
                color: ColorManager.gold),
            ],
          )
        ],
      ),
    );
  }

  Widget _getStatiqueGrid(List<User> users) {
    int isActiveCount = users.where((user) => user.active == true).toList().length;
    int isNotActiveCount = users.where((user) => user.active == false).toList().length;
    return ResponsiveGrid(
        widthPourcentage: isMobile(context) ? 0.3 : 0.25,
        children: [
          DataStatististicsItem(
              label: AppStrings.active,
              count: isActiveCount.toString(),
              color: ColorManager.green,
              icon: IconManger.active),
          DataStatististicsItem(
            label: AppStrings.notActive,
            count: isNotActiveCount.toString(),
            color: ColorManager.red,
            icon: IconManger.notActive,
          ),
          DataStatististicsItem(
              label: AppStrings.total,
              count: users.length.toString(),
              color: ColorManager.orange,
              icon: IconManger.total),
        ]);
  }
}
