import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flughtinfo/data/flight_info.dart';
import 'package:http/http.dart' as http;

class FlightRepository{

  final String api="https://www.kia.gov.tw/API/InstantSchedule.ashx?AirFlyLine=2&AirFlyIO=2";
  final Dio _dio=Dio();

  Future<List<FlightInfo>> fetchFlights() async{

    try{
      final response= await _dio.get(api);

      if(response.statusCode == 200){

        final jsonMap=response.data is String
            ? jsonDecode(response.data)
            :response.data;

        final List<dynamic> data=jsonMap['InstantSchedule'];
        return data.map((item) => FlightInfo.fromJson(item)).toList();
      }else{
        throw Exception("伺服器異常: ${response.statusCode}");
      }

    }catch(e){
        throw Exception("網路錯誤或解析錯誤: $e");
    }

  }

}