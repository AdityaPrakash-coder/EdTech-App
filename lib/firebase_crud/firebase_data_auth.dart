import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iitpal_acharya_ui/models/acharya_user_model.dart';
import 'package:iitpal_acharya_ui/screens/unique_key_device.dart';

class AuthService {
  /// Method for updating Acharya details in the device
  Future<void> update_user(AcharyaUserDetails acharya) async {
    print("Updating user to the database");
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    FirebaseFirestore.instance.settings.persistenceEnabled;
    try{
      DocumentReference ref = _firestore.collection('Acharya_data').doc(acharya.id);
      await ref.set({
        'id': acharya.id,
        'name': acharya.acharyaName,
        'email': acharya.acharyaEmail,
        'password': acharya.acharyaPassword,
        'mobileNumber': acharya.acharyaMobileNumber,
        'synced': acharya.dateOfSync,
        'dateOfSync': acharya.dateOfSync,
        'deviceUniqueId': acharya.deviceUniqueId,
      });
      print("Updated");
    }catch(e){
      print(e.toString());
    }
  }

  /// Method to fetch all Acharya details in the device
  Future<List<AcharyaUserDetails>> fetch_all_acharya() async {
    String deviceid = (await getId())!;
    try {
      Query acharya = await FirebaseFirestore.instance
          .collection('Acharya_data')
          .where("deviceUniqueId", isEqualTo: deviceid);
      List<DocumentSnapshot> acharya_docs = (await acharya.get()).docs;
      List<AcharyaUserDetails> acharya_data_list =
      acharya_docs.map((e) => AcharyaUserDetails.fromMap(e.data() as Map)).toList();
      return acharya_data_list;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
/* Future<List<Admin>> fetch_all_admin() async {
      try {
        CollectionReference admins =
        await FirebaseFirestore.instance.collection('Admin_data');
        List<DocumentSnapshot> admin_docs = (await admins.get()).docs;
        List<Admin> graph_data_list =
        admin_docs.map((e) => Admin.fromMap(e.data() as Map)).toList();
        return graph_data_list;
      } catch (e) {
        print(e.toString());
        return [];
      }
    }

Future<Admin?> fetch_current_admin() async {
    Admin? user;
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    FirebaseFirestore.instance.settings.persistenceEnabled;
    String? uid = await getId();
    String? id=UniqueKey().toString().substring(2, 7) + uid!;
    DocumentSnapshot documentSnapshot =
    await _firestore.collection('Admin_data').doc(id).get();
    if(!documentSnapshot.exists)
      return null;
    var data = documentSnapshot.data() as Map;
    print("hello world");
    user = Admin(
      data['name'],data['email'],data['password']
    );
    return user;
  }*/
}
