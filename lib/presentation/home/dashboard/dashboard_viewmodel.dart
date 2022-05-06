import 'dart:async';
import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/domain/usecase/dashboard_usecase.dart';
import 'package:cma_admin/presentation/base/baseviewmodel.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_renderer.dart';
import 'package:rxdart/rxdart.dart';
import "package:collection/collection.dart";
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DashboardViewModel extends BaseViewModel
    with DashboardViewModelInput, DashboardViewModelOutput {
  StreamController _homeDataStreamController = BehaviorSubject<HomeData>();
  StreamController _dateRangeStreamController = BehaviorSubject<DateRange>();

  DashboardUseCase _useCase;
  DashboardViewModel(this._useCase);

  @override
  void start() {}

  getHomeData(PickerDateRange dateRange) async {
    String startDate = dateToStringFormat(dateRange.startDate);
    String endDate = dateToStringFormat(dateRange.endDate);
    inputDateRange.add(DateRange(startDate, endDate));
    inputState.add(LoadingState(stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));
    (await _useCase.execute(DashboardUseCaseInput(startDate, endDate))).fold(
      (failure) {
        inputState.add(ErrorState(StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
      }, 
      (homeData) {
        inputHomeData.add(homeData);
        inputState.add(ContentState());
      }
    );
  }

  @override
  Sink get inputHomeData => _homeDataStreamController.sink;

  @override
  Sink get inputDateRange => _dateRangeStreamController.sink;

  @override
  Stream<DateRange> get outpuDateRange =>
      _dateRangeStreamController.stream.map((dateRange) => dateRange);

  @override
  Stream<HomeData> get outputHomeData =>
      _homeDataStreamController.stream.map((homeData) => homeData);

  @override
  Stream<List<ChartData>> get outputChartData =>
      _homeDataStreamController.stream
          .map((homeData) => _getChartData(homeData));

  List<ChartData> _getChartData(HomeData homeData) {
    List<ChartData> chartDatas = [];
    var groupByDate = homeData.orders!.reversed.groupListsBy((obj) => obj.createdAt.substring(0, 10));
    groupByDate.forEach((date, list) {
      chartDatas.add(ChartData(DateTime.parse(date), list.length));
    });
    return chartDatas;
  }

  @override
  void dispose() {
    _homeDataStreamController.close();
    _dateRangeStreamController.close();
    super.dispose();
  }
}

abstract class DashboardViewModelInput {
  Sink get inputHomeData;
  Sink get inputDateRange;
}

abstract class DashboardViewModelOutput {
  Stream<HomeData> get outputHomeData;
  Stream<List<ChartData>> get outputChartData;
  Stream<DateRange> get outpuDateRange;
}

class ChartData {
  DateTime date;
  int count;

  ChartData(this.date, this.count);
}

class DateRange {
  String startDate;
  String endDate;

  DateRange(this.startDate, this.endDate);
}
