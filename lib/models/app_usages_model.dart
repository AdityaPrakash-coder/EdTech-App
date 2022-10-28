
class AppUseDetails {
  String? deviceUniqueId;
  String? appUseTime;
  final String? synced;
  final String? dateOfSync;

  AppUseDetails({required this.synced,required this.dateOfSync,

    required this.appUseTime,required this.deviceUniqueId});

  Map<String, dynamic> toMap() {
    return {
      'deviceUniqueId': deviceUniqueId,
      'appUseTime': appUseTime,
      'synced': synced,
      'dateOfSync': dateOfSync,
    };
  }
  factory AppUseDetails.fromMap(Map<dynamic, dynamic> map) {
    return AppUseDetails(
        dateOfSync: map["dateOfSync"],
        synced: map["synced"],
        appUseTime: map["appUseTime"],
        deviceUniqueId: map["deviceUniqueId"]);
  }
  @override
  String toString() {
    return 'AppUse : {deviceUniqueId: $deviceUniqueId, synced: $synced, appUseTime: $appUseTime,dateOfSync: $dateOfSync}';
  }
}