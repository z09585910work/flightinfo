import 'package:flughtinfo/data/flight_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlightCard extends StatelessWidget {
  final FlightInfo flight;

  const FlightCard({super.key, required this.flight});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Padding(padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 第一行：航空公司 logo + 航空公司名稱與航班號碼
            Row(
              children: [
                Image.network(
                  flight.airLineLogo,
                  width: 40,
                  height: 40,
                  errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.flight),
                ),
                const SizedBox(width: 12,),
                Expanded(
                  child: Text("${flight.airLineName} - ${flight.airLineNum}",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),),
              ],
            ),
            const SizedBox(height: 12),
            // 第二行：出發地與登機門
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('出發地:${flight.upAirportName}'),
                Text('登機門:${flight.airBoardingGate}')
              ],
            ),

            const SizedBox(height: 8),
            // 第三行：預計/實際時間
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('預計:${flight.expectTime}'),
                Text('實際:${flight.realTime}')
              ],
            ),

            const SizedBox(height: 8),
            // 第四行：狀態 + 延誤原因（如果有）
            Text(
              '狀態: ${flight.airFlyStatus}',
              style: TextStyle(
                color: flight.airFlyStatus.contains('取消')||flight.airFlyStatus.contains('延誤')?
                    Colors.red : Colors.green,
                    fontWeight: FontWeight.w600
              ),
            ),
            if(flight.airFlyDelayCause.isEmpty)
              Text('原因: ${flight.airFlyDelayCause}',
                style: const TextStyle(color: Colors.deepOrange),
              )
          ],
        ),
      ),
    );
  }
}