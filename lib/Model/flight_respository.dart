import 'dart:convert';

import 'package:flughtinfo/data/flight_info.dart';
import 'package:http/http.dart' as http;

class FlightRepository{

  final String api="https://www.kia.gov.tw/API/InstantSchedule.ashx?AirFlyLine=2&AirFlyIO=2";
  
  Future<List<FlightInfo>> fechFlights() async{
    
    final url= Uri.parse(api);
    final response=await http.get(url);
    
    if(response.statusCode ==200){
      final jsonMap=jsonDecode(response.body);
      final List<dynamic> data =jsonMap['InstantSchedule'];
      return data.map((item) => FlightInfo.fromJson(item)).toList();

    }else{
      throw Exception("伺服器異常: ${response.statusCode}");
    }
    
  }

}