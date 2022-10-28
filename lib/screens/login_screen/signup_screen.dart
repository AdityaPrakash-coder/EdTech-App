import 'package:flutter/material.dart';
import 'package:iitpal_acharya_ui/constants/integer_constants.dart';
import 'package:iitpal_acharya_ui/constants/theme_colors.dart';
import 'package:iitpal_acharya_ui/database_crud/login_signup_crud.dart';
import 'package:iitpal_acharya_ui/models/acharya_user_model.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

import '../../firebase_crud/firebase_data_auth.dart';
import '../unique_key_device.dart';

class SignupPage extends StatefulWidget {
  @override
  SignupPageState createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  // Database Instances
  final database = AcharyaUserDetailsCRUD.instance;

  // Controllers
  final _userNameController = TextEditingController();
  final _cityNameController = TextEditingController();
  final _sanchcontroller=TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Variables
  String _userName = "";
  String _sanch_name="";
  String _password = "";
  String _mobileNumber = "";
  String _email = "";
  String _confirmPassword = "";
  String _city="";
  late List<AcharyaUserDetails> users;


  late List<Map<String, dynamic>> _listOfAcharyas;
  late String _deviceUniqueId;

  @override
  void initState() {
    super.initState();
    _getId();
    getAllRowsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MaterialThemeColors.primaryColor,
        centerTitle: true,
        title: Text(
          "Register",
          style: TextStyle(fontSize: IntegerConstants.appNameFontSize),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              TextEditingController().clear();
            },
            child: Center(
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4,
                        height: MediaQuery.of(context).size.height / 4.5,
                        child: Image.asset('assets/images/ekal.png'),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*1.5,
                      width: MediaQuery.of(context).size.width * 3 / 5,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextFormField(
                              controller: _userNameController,
                              validator: (value) => value!.isEmpty ? "Enter a name" : null,
                              onChanged: (userName) {
                                _userName = userName;
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: MaterialThemeColors.backgroundColor,
                                      width: 10.0,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                fillColor: Colors.white,
                                filled: true,
                                labelText: 'UserName',
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(IntegerConstants.recommendedContainerPadding)),
                            TextFormField(
                              controller: _emailController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter an E-mail';
                                  // } else if (!RegExp(
                                  //         "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  //     .hasMatch(value)) {
                                  //   return 'Please enter a valid Email';
                                }
                                return null;
                              },
                              onChanged: (email) {
                                _email = email;
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: MaterialThemeColors.backgroundColor,
                                      width: 10.0,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                fillColor: Colors.white,
                                filled: true,
                                labelText: 'E-Mail',
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(IntegerConstants.recommendedContainerPadding)),
                            TextFormField(
                              controller: _mobileNumberController,
                              // validator: (value) {
                              //   String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                              //   RegExp regExp = new RegExp(patttern);
                              //   if (value!.length == 0) {
                              //     return 'Enter Mobile Number';
                              //   } else if (!regExp.hasMatch(value)) {
                              //     return 'Please enter valid mobile number';
                              //   }
                              //   return null;
                              // },
                              onChanged: (number) {
                                _mobileNumber = number;
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: MaterialThemeColors.backgroundColor,
                                      width: 10.0,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                fillColor: Colors.white,
                                filled: true,
                                labelText: 'Mobile Number',
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(IntegerConstants.recommendedContainerPadding)),
                            TextFormField(
                              controller: _passwordController,
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
                                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                fillColor: Colors.white,
                                filled: true,
                                labelText: 'Password',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter a password';
                                }
                                // if (value.length < 8) {
                                //   return "Must contain at least 8 characters";
                                // }
                                // if (value.contains(RegExp(r'[a-z]')) &&
                                //     !value.contains(RegExp(r'[0-9]'))) {
                                //   return "Include a number";
                                // }
                                // if (!value.contains(RegExp(r'[a-z]')) &&
                                //     value.contains(RegExp(r'[0-9]'))) {
                                //   return "Include a letter";
                                // }
                                return null;
                              },
                            ),
                            Padding(padding: EdgeInsets.all(IntegerConstants.recommendedContainerPadding)),
                            TextFormField(
                              controller: _confirmPasswordController,
                              onChanged: (password) {
                                _confirmPassword = password;
                              },
                              obscureText: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: MaterialThemeColors.backgroundColor,
                                      width: 10.0,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                fillColor: Colors.white,
                                filled: true,
                                labelText: 'Confirm your Password',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Re-enter the Password';
                                }
                                if (_confirmPassword != _password) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                            ),
                            Padding(padding: EdgeInsets.all(IntegerConstants.recommendedContainerPadding)),
                            TextFormField(
                              controller: _cityNameController,
                              validator: (value) => value!.isEmpty ? "Enter a School Identifier" : null,
                              onChanged: (userName) {
                                _city = userName;
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: MaterialThemeColors.backgroundColor,
                                      width: 10.0,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                fillColor: Colors.white,
                                filled: true,
                                labelText: 'School Identifier',
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(IntegerConstants.recommendedContainerPadding)),
                            TextFormField(
                              controller: _sanchcontroller,
                              validator: (value) => value!.isEmpty ? "Enter your Sanch name" : null,
                              onChanged: (userName) {
                                _sanch_name = userName;
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: MaterialThemeColors.backgroundColor,
                                      width: 10.0,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                fillColor: Colors.white,
                                filled: true,
                                labelText: 'Sanch Name',
                              ),
                            ),

                            Padding(padding: EdgeInsets.all(IntegerConstants.recommendedContainerPadding)),
                            Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                    primary: MaterialThemeColors.buttonColor,
                                    minimumSize: Size(120.0, 60.0)),
                                child: Text(
                                  "Reset",
                                  style: TextStyle(fontSize: IntegerConstants.buttonFontSize),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _userName = "";
                                    _userNameController.clear();
                                    _password = "";
                                    _passwordController.clear();
                                    _email = "";
                                    _emailController.clear();
                                    _confirmPassword = "";
                                    _confirmPasswordController.clear();
                                    _city="";
                                    _cityNameController.clear();
                                  });
                                },
                              ),
                              Padding(padding: EdgeInsets.symmetric(horizontal: IntegerConstants.recommendedContainerPadding * 10)),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                  primary: MaterialThemeColors.buttonColor,
                                  minimumSize: Size(120.0, 60.0),
                                ),
                                child: Text(
                                  "SignUp",
                                  style: TextStyle(fontSize: IntegerConstants.buttonFontSize),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                     _listOfAcharyas = await database.getAllRowsList();
                                     if (_listOfAcharyas.length == 3) {
                                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                         behavior: SnackBarBehavior.floating,
                                         backgroundColor: Colors.black38,
                                         margin: EdgeInsets.only(
                                             bottom: MediaQuery.of(context).size.height / 12,
                                             left: MediaQuery.of(context).size.width / 4,
                                             right: MediaQuery.of(context).size.width / 4),
                                         content: Text(
                                           "Acharya already Registered",
                                           textAlign: TextAlign.center,
                                         style: TextStyle(fontSize: 20),
                                        ),
                                      ));
                                    } else {
                                    await database.deleteAllAcharyas();
                                    AcharyaUserDetails acharyaUserDetails = AcharyaUserDetails(
                                      id: UniqueKey().toString().substring(2, 7) + _deviceUniqueId,
                                      acharyaName: _userName,
                                      acharyaEmail: _email,
                                      acharyaPassword: sha256.convert(utf8.encode(_password)).toString(),
                                      acharyaMobileNumber: _mobileNumber,
                                      synced: 'false',
                                      dateOfSync: DateTime.now().toString().substring(0, 10),
                                      deviceUniqueId: _deviceUniqueId,schoolId: _city, sanch_name: _sanch_name,
                                    );
                                    await database.insertNewAcharya(acharyaUserDetails);
                                   // await AuthService().update_user(acharyaUserDetails);
                                   // users = await AuthService().fetch_all_acharya();
                                   // print(users);
                                    setState(() {});
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.black38,
                                      margin: EdgeInsets.only(
                                          bottom: MediaQuery.of(context).size.height / 12,
                                          left: MediaQuery.of(context).size.width / 4,
                                          right: MediaQuery.of(context).size.width / 4),
                                      content: Text(
                                        "Acharya Registered Successfully",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ));
                                    Navigator.of(context).pop();
                                  }
                                   }
                                },
                              ),
                            ]),
                            Spacer(),
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
      ),
    );
  }

  // /// Method to get list of all Acharyas
  void getAllRowsList() async {
  _listOfAcharyas = await database.getAllRowsList();
   }

  /// Method to get device unique id
  void _getId() async {
    _deviceUniqueId = (await getId())!;
  }
}
