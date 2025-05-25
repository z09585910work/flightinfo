import 'package:flughtinfo/view/widgets/filter_dialog.dart';
import 'package:flughtinfo/view/widgets/filter_segmentedbutton.dart';
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
      appBar:AppBar(title: const Text('高雄出境班機'),

      actions: [
        IconButton(onPressed: (){
          showDialog(context: context, builder: (context)=>FilterDialog());
        },
            icon: const Icon(Icons.filter_list))
      ],),
      body: Column(children: [
        const SizedBox(height: 10,),

        Align(
          alignment: Alignment.centerLeft,
          child:  AirlineFilterSegmented(),
        ),

        const Divider(),
        Expanded(child: Builder(builder: (context) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator(),);
          } else if (vm.errorMessage != null) {
            return Center(child: Text(vm.errorMessage!),);
          } else if (vm.filteredFlights.isEmpty) {
            return const Center(child: Text('找不到符合條件的班機'));
          } else {
            return ListView.builder(
              itemCount: vm.filteredFlights.length,
              itemBuilder: (context, index) {
                final flight = vm.filteredFlights[index];
                return FlightCard(flight: flight);
              },
            );
          }
        }),),
      ],),
      
      floatingActionButton: FloatingActionButton(
          onPressed: vm.loadFlights,
          child: const Icon(Icons.refresh),
      ),
      
    );
  }
}