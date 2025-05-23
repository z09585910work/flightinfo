class FlightInfo {
  final String expectTime;       // 預計時間
  final String realTime;         // 實際時間
  final String airLineName;      // 航空公司名稱
  final String airLineCode;      // 航空公司代碼
  final String airLineLogo;      // 航空公司 Logo URL
  final String airLineUrl;       // 航空公司官網 URL
  final String airLineNum;       // 航班號碼
  final String upAirportCode;    // 起飛機場代碼
  final String upAirportName;    // 起飛機場名稱
  final String airPlaneType;     // 機型
  final String airBoardingGate;  // 登機門
  final String airFlyStatus;     // 飛行狀態（抵達、延誤等）
  final String airFlyDelayCause; // 延誤原因（如有）

  FlightInfo({
    required this.expectTime,
    required this.realTime,
    required this.airLineName,
    required this.airLineCode,
    required this.airLineLogo,
    required this.airLineUrl,
    required this.airLineNum,
    required this.upAirportCode,
    required this.upAirportName,
    required this.airPlaneType,
    required this.airBoardingGate,
    required this.airFlyStatus,
    required this.airFlyDelayCause,
  });

  factory FlightInfo.fromJson(Map<String, dynamic> json) {
    return FlightInfo(
      expectTime: json['expectTime'] ?? '',
      realTime: json['realTime'] ?? '',
      airLineName: json['airLineName'] ?? '',
      airLineCode: json['airLineCode'] ?? '',
      airLineLogo: json['airLineLogo'] ?? '',
      airLineUrl: json['airLineUrl'] ?? '',
      airLineNum: json['airLineNum'] ?? '',
      upAirportCode: json['upAirportCode'] ?? '',
      upAirportName: json['upAirportName'] ?? '',
      airPlaneType: json['airPlaneType'] ?? '',
      airBoardingGate: json['airBoardingGate'] ?? '',
      airFlyStatus: json['airFlyStatus'] ?? '',
      airFlyDelayCause: json['airFlyDelayCause'] ?? '',
    );
  }
}