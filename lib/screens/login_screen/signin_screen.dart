import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iitpal_acharya_ui/constants/integer_constants.dart';
import 'package:iitpal_acharya_ui/constants/theme_colors.dart';
import 'package:iitpal_acharya_ui/database_crud/appuse_crud.dart';
import 'package:iitpal_acharya_ui/firebase_crud/app_use_crud.dart';
import 'package:iitpal_acharya_ui/firebase_crud/firebase_data_auth.dart';
import 'package:iitpal_acharya_ui/models/acharya_user_model.dart';
import 'package:iitpal_acharya_ui/models/app_usages_model.dart';
import 'package:iitpal_acharya_ui/screens/home_screen/home_page.dart';
import 'package:iitpal_acharya_ui/screens/login_screen/signup_screen.dart';
import '../../database_crud/login_signup_crud.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import '../unique_key_device.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> with WidgetsBindingObserver {
  // Databases
  final database = AcharyaUserDetailsCRUD.instance;
  final database1 = AppUseCrudCRUD.instance;

  // Controllers
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLogin = false;

  // Variables
  String _userName = "";
  String _password = "";
  late String _deviceUniqueId;
  String startTime = "0";
  late List<AcharyaUserDetails> users;
  AppUseDetails? appUse_currentUser;

  List<Map<String, dynamic>> appUseList = [];
  late Timer appUsageTimer;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    _getId();
    //fetch_all_acharya();
    //fetch_appUse_currentUser();
    insertSampleAcharya();
    appUsageTimer = Timer.periodic(Duration(seconds: 10),
        (Timer t) => _updateAppUse()); // update timer periodically
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      appUsageTimer.cancel();
    }
    if (state == AppLifecycleState.resumed) {
      appUsageTimer =
          Timer.periodic(Duration(seconds: 10), (Timer t) => _updateAppUse());
    }
    if (state == AppLifecycleState.inactive) {
      appUsageTimer.cancel();
    }
    print('state = $state');
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MaterialThemeColors.primaryColor,
        centerTitle: true,
        title: Text(
          "Login",
          style: TextStyle(fontSize: IntegerConstants.appNameFontSize),
        ),
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            TextEditingController().clear();
          },
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 70, 20, 0),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3.5,
                      width: MediaQuery.of(context).size.width / 3,
                      child: Image.asset('assets/images/ekal.png'),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width * 3 / 5,
                    padding: EdgeInsets.symmetric(
                      vertical: IntegerConstants.recommendedContainerPadding,
                      horizontal:
                          IntegerConstants.recommendedContainerPadding * 6,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(padding: EdgeInsets.all(7.0)),
                          TextFormField(
                            controller: _userNameController,
                            validator: (value) =>
                                value!.isEmpty ? "Enter a name" : null,
                            onChanged: (userName) {
                              _userName = userName;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: MaterialThemeColors.backgroundColor,
                                    width: 10.0,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              fillColor: Colors.white,
                              filled: true,
                              labelText: 'UserName',
                              hintText: "abcd",
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.all(
                                  IntegerConstants.recommendedContainerPadding *
                                      2)),
                          TextFormField(
                            controller: _passwordController,
                            validator: (value) =>
                                value!.isEmpty ? 'Enter a Password' : null,
                            onChanged: (password) {
                              _password = password;
                            },
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: MaterialThemeColors.backgroundColor,
                                    width: 10.0,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              fillColor: Colors.white,
                              filled: true,
                              labelText: 'Password',
                              hintText: "1234",
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.all(
                                  IntegerConstants.recommendedContainerPadding *
                                      2)),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: IntegerConstants
                                                .recommendedContainerPadding *
                                            2)),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0))),
                                      primary: MaterialThemeColors.buttonColor,
                                      minimumSize: Size(120.0, 60.0)),
                                  child: Text(
                                    "Reset",
                                    style: TextStyle(
                                        fontSize:
                                            IntegerConstants.buttonFontSize),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _userName = "";
                                      _userNameController.clear();
                                      _password = "";
                                      _passwordController.clear();
                                    });
                                  },
                                ),
                                Spacer(),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0))),
                                        primary:
                                            MaterialThemeColors.buttonColor,
                                        minimumSize: Size(120.0, 60.0)),
                                    child: Text(
                                      "SignIn",
                                      style: TextStyle(
                                          fontSize:
                                              IntegerConstants.buttonFontSize),
                                    ),
                                    /*onPressed: () async {
                                var list = await database.getAllRowsList();
                                users = await AuthService().fetch_all_acharya();
                                print(users);
                                if (users.length == 0) {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Colors.black38,
                                    margin: EdgeInsets.only(
                                        bottom: MediaQuery.of(context).size.height / 12,
                                        left: MediaQuery.of(context).size.width / 4,
                                        right: MediaQuery.of(context).size.width / 4),
                                    content: Text(
                                      "No User Registered",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ));
                                } else {

                                  for (var x in users) {
                                    if (x.acharyaName == _userName &&
                                        x.acharyaPassword == sha256.convert(utf8.encode(_password)).toString()) {
                                      setState(()=>isLogin = true);
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                                      _userName = "";
                                      _userNameController.clear();
                                      _password = "";
                                      _passwordController.clear();
                                    }
                                  }
                                  if (!isLogin) {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.black38,
                                      margin: EdgeInsets.only(
                                          bottom: MediaQuery.of(context).size.height / 12,
                                          left: MediaQuery.of(context).size.width / 4,
                                          right: MediaQuery.of(context).size.width / 4),
                                      content: Text(
                                        "Wrong UserName or Password",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ));
                                  }
                                }
                              },
                            ),*/
                                    onPressed: () async {
                                      var list =
                                          await database.getAllRowsList();
                                      if (list.length == 0) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(new SnackBar(
                                                content: Text(
                                          "User not Registered",
                                          textAlign: TextAlign.justify,
                                        )));
                                      } else {
                                        bool isLogin = false;
                                        for (var x in list) {
                                          if (x["name"] == _userName &&
                                              x["password"] ==
                                                  sha256
                                                      .convert(utf8
                                                          .encode(_password))
                                                      .toString()) {
                                            isLogin = true;
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomePage()));
                                            _userName = "";
                                            _userNameController.clear();
                                            _password = "";
                                            _passwordController.clear();
                                          }
                                        }
                                        if (!isLogin) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            behavior: SnackBarBehavior.floating,
                                            backgroundColor: Colors.black38,
                                            margin: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    12,
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4,
                                                right: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4),
                                            content: Text(
                                              "Wrong UserName or Password",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ));
                                        }
                                      }
                                    }),
                                Spacer(),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                    primary: MaterialThemeColors.buttonColor,
                                    minimumSize: Size(120.0, 60.0),
                                  ),
                                  child: Text(
                                    "SignUp",
                                    style: TextStyle(
                                        fontSize:
                                            IntegerConstants.buttonFontSize),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _userName = "";
                                      _userNameController.clear();
                                      _password = "";
                                      _passwordController.clear();
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => SignupPage()),
                                      );
                                    });
                                  },
                                ),
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: IntegerConstants
                                                .recommendedContainerPadding *
                                            2)),
                              ]),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Method to get device unique id
  void _getId() async {
    _deviceUniqueId = (await getId())!;
  }

  /// Method to get list of all acharyas
  /* void fetch_all_acharya() async {
    users = await AuthService().fetch_all_acharya();
    print(users);
  }

  void fetch_appUse_currentUser() async {
    appUse_currentUser = await AppUseFireStore().fetch_current_AppUSe();
    print(appUse_currentUser);
  }*/

  /// Method to track App Usage Time
  /*Future<void> _updateAppUse() async {
    appUse_currentUser = await AppUseFireStore().fetch_current_AppUSe();
    if (appUse_currentUser != null) {
      setState(() {
        startTime = appUse_currentUser?.appUseTime;
      });
    }
    final appUseTime = int.parse(startTime!) + 10;
    AppUseDetails appUseDetails = AppUseDetails(
      synced: "false",
      dateOfSync: DateTime.now().toString().substring(0, 10),
      appUseTime: appUseTime.toString(),
      deviceUniqueId: _deviceUniqueId,
    );
    if (appUse_currentUser == null) {
      await AppUseFireStore().AddAppUse(appUseDetails);
    } else {
      //await database1.updateRowById(appUseDetails);
      await AppUseFireStore().UpdateAppUse(appUseDetails);
    }
  }*/
  Future<void> _updateAppUse() async {
    appUseList = await database1.getAllRowsList();
    if (appUseList.length == 1) {
      setState(() {
        startTime = appUseList[0]["appUseTime"].toString();
      });
    }
    final appUseTime = int.parse(startTime) + 5;
    AppUseDetails appUseDetails = AppUseDetails(
      synced: "false",
      dateOfSync: DateTime.now().toString().substring(0, 10),
      appUseTime: appUseTime.toString(),
      deviceUniqueId: _deviceUniqueId,
    );
    if (appUseList.length == 0) {
      await database1.insertNewRaw(appUseDetails);
    } else {
      await database1.updateRowById(appUseDetails);
    }
  }

  /// Method to insert sample Acharya
  void insertSampleAcharya() async {
    _deviceUniqueId = (await getId())!;
    await database.insertNewAcharya(AcharyaUserDetails(
        synced: "false",
        dateOfSync: DateTime.now().toString().substring(0, 10),
        id: UniqueKey().toString().substring(2, 7) + _deviceUniqueId,
        acharyaName: "abcd",
        acharyaEmail: "example@domain.com",
        acharyaPassword: sha256.convert(utf8.encode("1234")).toString(),
        acharyaMobileNumber: "1234567890",
        deviceUniqueId: _deviceUniqueId,
        schoolId: '',
        sanch_name: ''));
  }
}
