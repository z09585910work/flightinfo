import 'package:flughtinfo/Model/flight_respository.dart';
import 'package:flughtinfo/data/flight_info.dart';
import 'package:flutter/cupertino.dart';

class FlightViewModel extends ChangeNotifier{

  final FlightRepository repository=FlightRepository();
  List<FlightInfo> flights=[]; //所有航班資料
  List<FlightInfo> filteredFlights=[]; //過濾資料
  bool isLoading=false;
  String? errorMessage;

  //過濾條件
  String? airlineFilter;//航班名稱
  String? airflystatusFilter;//出航狀態

  Future<void> loadFlights() async{

    isLoading =true;
    errorMessage=null;
    notifyListeners();

    try{

      flights= await repository.fetchFlights();
      airlineFilter=null;

      applyFilters();
    }catch(e){
      errorMessage=e.toString();
    }

    isLoading= false;
    notifyListeners();
  }

  //過濾資料
  void applyFilters() {

    final airlineKey=airlineFilter?.toLowerCase() ?? '';
    final airflystatusKey=airflystatusFilter?.toLowerCase() ?? '';

    // 根據 airline 名稱模糊搜尋篩選
    // filteredFlights=flights.where((_flight){
    //   return (airlineFilter == '全部')||_flight.airLineName.toLowerCase().contains(airlineKey);
    // }).toList();

    filteredFlights = flights.where((flight) {
      final matchAirline = airlineFilter == '全部' ||
          flight.airLineName.toLowerCase().contains(airlineKey);
      final matchStatus = airflystatusFilter == '全部' ||
          flight.airFlyStatus.toLowerCase().contains(airflystatusKey);
      return matchAirline && matchStatus;
    }).toList();

    notifyListeners();
  }

  void setFilters({String? airline,String? airflystatus}){
    airlineFilter=airline;
    airflystatusFilter=airflystatus;
    applyFilters();
  }

  void setairlineFilters(String airline_){

    airlineFilter=airline_;
    applyFilters();

  }

  void clearFilters(){

    airlineFilter=null;
    airflystatusFilter=null;
    applyFilters();
  }

}