import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/add_product/add_product_viewmodel.dart';
import 'package:cma_admin/presentation/components/color_picker_label.dart';
import 'package:cma_admin/presentation/components/custom_appbar.dart';
import 'package:cma_admin/presentation/components/field_label.dart';
import 'package:cma_admin/presentation/components/image_picker_widget.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class AddProductView extends StatefulWidget {
  final Category? category;
  const AddProductView(this.category, {Key? key}) : super(key: key);

  @override
  _AddProductViewViewState createState() => _AddProductViewViewState();
}

class _AddProductViewViewState extends State<AddProductView> {
  AddProductViewModel _viewModel = instance<AddProductViewModel>();
  final _formKey = GlobalKey<FormState>();

  TextEditingController _titleTextEditingController = TextEditingController();

  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind() {
    _viewModel.start();
    if (widget.category!=null) {
      _viewModel.setCategoryId(widget.category!.id.toString());      
    }
    _viewModel.loadCategory();
    _titleTextEditingController.addListener(() {
      _viewModel.setTitle(_titleTextEditingController.text);
    });

    _viewModel.isUserLoggedInSuccessfullyStreamController.stream
        .listen((isSuccessAddProduct) {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return Center(
            child: snapshot.data?.getScreenWidget(context, _getContentWidget(),
                    () {
                  _viewModel.addProduct(context);
                }) ??
                _getContentWidget(),
          );
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical:AppPadding.p40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //title
                Text(
                  AppStrings.createProduct,
                  style: getSemiBoldStyle(
                  color: ColorManager.black,
                  fontSize: FontSize.s24),
                ),
                SizedBox(height: AppSize.s30),
                // form
                _getForm()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getForm() {
    return Card(
      shadowColor: ColorManager.grey2,
      elevation: AppSize.s2,
      child: Container(
      padding: EdgeInsets.symmetric(horizontal:AppPadding.p20,vertical: AppPadding.p30),
      width: isMobile(context)?AppSize.s400:AppSize.s600,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image field
            ImagePickerWidget(
              setImage: (image)=>_viewModel.setProfilePicture(image), 
              imageStream: _viewModel.outputProfilePicture),
            SizedBox(height: AppSize.s30),
            // title field
            FieldLabel(AppStrings.title,isRequired: true),
            StreamBuilder<String?>(
              stream: _viewModel.outputErrorTitle,
              builder: (context, snapshot) {
                return TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _titleTextEditingController,
                    decoration: InputDecoration(
                        hintText: AppStrings.label,
                        errorText: snapshot.data));
              },
            ),
            SizedBox(height: AppSize.s30),
            // price field
            FieldLabel(AppStrings.price,isRequired: true),
            StreamBuilder<String?>(
              stream: _viewModel.outputErrorPrice,
              builder: (context, snapshot) {
                return TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      _viewModel.setPrice(value);
                    },
                    decoration: InputDecoration(
                        hintText: AppStrings.price,
                        errorText: snapshot.data));
              },
            ),
            SizedBox(height: AppSize.s30),
            // category field
            FieldLabel(AppStrings.category,isRequired: true),
            StreamBuilder<List<Category>?>(
              stream: _viewModel.outputCategories,
              builder: (context, snapshot) {
                List<Category>? categories = snapshot.data;
                return DropdownSearch<Category>(
                  mode: Mode.MENU,
                  items: categories,
                  selectedItem: widget.category,
                  itemAsString: (Category? category) => category!.label,
                  dropdownSearchDecoration:InputDecoration(
                    hintText:  AppStrings.addCategory,
                  ),
                  onChanged: (category) {
                    _viewModel.setCategoryId(category!.id.toString());
                  },
                );
              },
            ),
            SizedBox(height: AppSize.s30),
            // color field
            FieldLabel(AppStrings.color),
            StreamBuilder<Color?>(
              stream: _viewModel.outputPickerColor,
              builder: (context, snapshot) {
                Color color = snapshot.data ?? ColorManager.grey;
                return ColorPickerForm(
                  color: color,
                  setColor: (color)=>_viewModel.setColor(color),
                );
              },
            ),
            SizedBox(height: AppSize.s40),
            // Button
            StreamBuilder<bool>(
              stream: _viewModel.outputIsAllInputsValid,
              builder: (context, snapshot) {
                return SizedBox(
                  width: double.infinity,
                  height: AppSize.s40,
                  child: ElevatedButton(
                      onPressed: (snapshot.data ?? false)
                          ? () {
                              _viewModel.addProduct(context);
                            }
                          : null,
                      child: Text(AppStrings.create)),
                );
              },
            ),
          ],
        ),
      ),
    ));
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

}
