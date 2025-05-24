import 'package:flughtinfo/viewmodel/flight_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class AirlineFilterSegmented extends StatelessWidget {
  final List<String> airlineOptions = ['全部', '立榮', '華信', '德安'];

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<FlightViewModel>();
    return SegmentedButton<String>(
      segments: airlineOptions
          .map((label) => ButtonSegment(value: label, label: Text(label)))
          .toList(),
      selected: {vm.airlineFilter ?? '全部'},//強制給String一個初始值
      onSelectionChanged: (Set<String> selected) {
        if (selected.isNotEmpty) {
          context.read<FlightViewModel>().setairlineFilters(selected.first);
        }
      },
    );
  }
}
