import 'package:flughtinfo/viewmodel/flight_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key});

  @override
  State<StatefulWidget> createState() => _FilterDialog();
}

class _FilterDialog extends State<FilterDialog> {
  late TextEditingController airlineController;
  late TextEditingController airflystatusController;

  @override
  void initState() {
    super.initState();

    final vm = Provider.of<FlightViewModel>(context, listen: false);
    // airlineController = TextEditingController(text: vm.airlineFilter ?? '全部');
    airlineController = TextEditingController(text: vm.airlineFilter );
    airflystatusController = TextEditingController(text: vm.airflystatusFilter ,);
  }

  @override
  void dispose() {
    super.dispose();
    airlineController.dispose();
    airflystatusController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<FlightViewModel>(context, listen: false);

    return AlertDialog(
      title: const Text('篩選航班'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: airlineController,
            decoration: const InputDecoration(labelText: '航空公司',
              hintText: '全部',
                hintStyle: TextStyle(color: Colors.grey)

            ),
          ),

          const SizedBox(height: 10,),

          TextField(
            controller: airflystatusController,
            decoration: const InputDecoration(labelText: '航行狀態',
              hintText: '全部',
              hintStyle: TextStyle(color: Colors.grey)
            ),
          )
        ],
      ),

      actions: [
        TextButton(onPressed: (){
          vm.setFilters(
            airline: airlineController.text.isEmpty ? null : airlineController.text,
            airflystatus: airflystatusController.text.isEmpty ? null : airflystatusController.text
          );
          Navigator.of(context).pop();
        },child: Text('套用')),

        TextButton(onPressed: (){
          vm.clearFilters();
          Navigator.of(context).pop();
        },
            child: const Text('清除'))
      ],
    );
  }
}
