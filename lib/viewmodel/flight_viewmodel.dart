import 'package:flughtinfo/Model/flight_respository.dart';
import 'package:flughtinfo/data/flight_info.dart';
import 'package:flutter/cupertino.dart';

class FlightViewModel extends ChangeNotifier{

  final FlightRepository repository=FlightRepository();
  List<FlightInfo> flights=[];
  bool isLoading=false;
  String? errorMessage;

  Future<void> loadFlights() async{

    isLoading =true;
    errorMessage=null;
    notifyListeners();

    try{

      flights= await repository.fechFlights();
    }catch(e){
      errorMessage=e.toString();
    }

    isLoading= false;
    notifyListeners();
  }

}