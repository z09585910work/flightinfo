import 'package:flughtinfo/view/widgets/flight_card.dart';
import 'package:flughtinfo/viewmodel/flight_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlightView extends StatefulWidget{

  const FlightView({super.key});

  @override
  State<FlightView> createState() =>_FlightView();
}

class  _FlightView extends State<FlightView>{
  @override
  void initState() {
    super.initState();
    Future.microtask(()=>context.read<FlightViewModel>().loadFlights());
  }

  @override
  Widget build(BuildContext context) {
    final vm=context.watch<FlightViewModel>();

    return Scaffold(
      appBar:AppBar(title: const Text('高雄出境班機'),),
      body: Builder(builder: (context) {
        if(vm.isLoading){
          return const Center(child: CircularProgressIndicator(),);
        }else if(vm.errorMessage !=null){
          return Center(child: Text(vm.errorMessage!),);
        }else{

          return ListView.builder(
              itemCount: vm.flights.length,
            itemBuilder: (context,index){
                final flight=vm.flights[index];
                return FlightCard(flight: flight);
            },
          );
        }
      }),
      
      floatingActionButton: FloatingActionButton(
          onPressed: vm.loadFlights,
          child: const Icon(Icons.refresh),
      ),
      
    );
  }
}