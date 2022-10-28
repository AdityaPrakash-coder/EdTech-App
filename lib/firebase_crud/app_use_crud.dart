import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iitpal_acharya_ui/models/app_usages_model.dart';
import 'package:iitpal_acharya_ui/screens/unique_key_device.dart';

class AppUseFireStore {
  /// Method to add AppUse Details in the device
  Future<void> AddAppUse(AppUseDetails appUseDetails) async {
    print("adding appUse to the database");
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    FirebaseFirestore.instance.settings.persistenceEnabled;
    String? id=await getId();
    try{
      DocumentReference ref = _firestore.collection('AppUse').doc(id);
      await ref.set({
        'synced': appUseDetails.dateOfSync,
        'dateOfSync': appUseDetails.dateOfSync,
        'deviceUniqueId': appUseDetails.deviceUniqueId,
        'appUseTime': appUseDetails.appUseTime,
      });
      print("Added");
    }catch(e){
      print(e.toString());
    }
  }

  /// Method to update AppUse Details in the device
  Future<void> UpdateAppUse(AppUseDetails appUseDetails) async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    FirebaseFirestore.instance.settings.persistenceEnabled;
    String? id=await getId();
    try{
      DocumentReference ref = _firestore.collection('AppUse').doc(id);
      await ref.update({
        'synced': appUseDetails.dateOfSync,
        'dateOfSync': appUseDetails.dateOfSync,
        'deviceUniqueId': appUseDetails.deviceUniqueId,
        'appUseTime': appUseDetails.appUseTime,
      });
    }catch(e){
      print(e.toString());
    }
  }

  /// Method to get AppUse Details in the device
  Future<AppUseDetails?> fetch_current_AppUSe() async {
    FirebaseFirestore.instance.settings.persistenceEnabled;
    AppUseDetails appUse_currentUser;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    String? uid = await getId();
    DocumentSnapshot documentSnapshot =
    await _firestore.collection('AppUse').doc(uid).get();
    if(!documentSnapshot.exists)
      return null;
    var data = documentSnapshot.data() as Map;
    appUse_currentUser = AppUseDetails(
        deviceUniqueId: data["deviceUniqueId"],
        synced: data["synced"],
        dateOfSync: data["dateOfSync"],
        appUseTime: data["appUseTime"]

    );
   print(appUse_currentUser);
    return appUse_currentUser;
  }

  /*Future get_appUse_field(var key)async{
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    String? id = await getId();
    DocumentSnapshot sp =await _firestore.collection('user_data').doc(id).get();
    var app = sp.get(key);
  }
*/
}
