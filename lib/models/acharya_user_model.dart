class AcharyaUserDetails {
  final String? id;
  final String? acharyaName;
  final String? acharyaEmail;
  final String? acharyaPassword;
  final String? acharyaMobileNumber;
  final String? synced;
  final String? dateOfSync;
  final String? deviceUniqueId;
  final String? schoolId;
  final String? sanch_name;

  AcharyaUserDetails(
      {required this.schoolId,required this.synced,
      required this.dateOfSync,
      required this.id,
      required this.acharyaName,
      required this.acharyaEmail,
      required this.acharyaPassword,
      required this.acharyaMobileNumber,
      required this.deviceUniqueId,required this.sanch_name
        });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': acharyaName,
      'email': acharyaEmail,
      'password': acharyaPassword,
      'mobileNumber': acharyaMobileNumber,
      'synced': synced,
      'dateOfSync': dateOfSync,
      'deviceUniqueId': deviceUniqueId,
      'schoolid':schoolId,
      'sanch_name':sanch_name,
    };
  }

  @override
  String toString() {
    return 'Acharya : {id: $id, name: $acharyaName, email: $acharyaEmail, password: $acharyaPassword, mobile number: $acharyaMobileNumber,}';
  }

  factory AcharyaUserDetails.fromMap(Map<dynamic, dynamic> map) {
    return AcharyaUserDetails(
        id: map["id"],
        acharyaName: map["name"],
        dateOfSync: map["dateOfSync"],
        synced: map["synced"],
        acharyaPassword: map["password"],
        acharyaEmail: map["email"],
        acharyaMobileNumber: map["mobileNumber"],
        deviceUniqueId: map["deviceUniqueId"],schoolId:map["schoolid"], sanch_name: map["sanch_name"]
    );
  }
}
