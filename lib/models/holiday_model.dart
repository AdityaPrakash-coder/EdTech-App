class HolidayDetails {
  String? id;
  String? gat;
  String? deviceUniqueId;
  String? dateOfHoliday;
  String? remark;
  String? synced;
  String? dateOfSynced;

  HolidayDetails({required this.synced,required this.dateOfSynced,required this.id,required this.deviceUniqueId,required this.gat,required this.dateOfHoliday,required this.remark});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'gat': gat,
      'deviceUniqueId': deviceUniqueId,
      'dateOfHoliday': dateOfHoliday,
      'remark':remark,
      'synced':synced,
      "dateOfSynced":dateOfSynced
    };
  }

  @override
  String toString() {
    return 'Holiday : {id: $id, gat: $gat,deviceUniqueId: $deviceUniqueId,remark: $remark}';
  }


}
