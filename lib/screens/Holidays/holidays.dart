import 'package:flutter/material.dart';
import 'package:iitpal_acharya_ui/constants/integer_constants.dart';
import 'package:iitpal_acharya_ui/constants/theme_colors.dart';
import 'package:iitpal_acharya_ui/database_crud/login_signup_crud.dart';
import 'package:iitpal_acharya_ui/models/acharya_user_model.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

import '../../firebase_crud/firebase_data_auth.dart';
import '../unique_key_device.dart';

class HolidayPage extends StatefulWidget {
  @override
  HolidayPageState createState() => HolidayPageState();
}

class HolidayPageState extends State<HolidayPage> {
  // Database Instances
  // final database = AcharyaUserDetailsCRUD.instance;

  // Controllers
  final _gatController = TextEditingController();
  final _dateController = TextEditingController();
  final _remarkController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<bool> _selectedGat = [true, false, false];

  // Variables
  String _gat = "";
  String _date = "";
  String _remark = "";

  // late List<Map<String, dynamic>> _listOfAcharyas;
  late String _deviceUniqueId;

  @override
  void initState() {
    super.initState();
    _getId();
    // getAllRowsList();
  }

  @override
  Widget build(BuildContext context,) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MaterialThemeColors.primaryColor,
        centerTitle: true,
        title: Text(
          "Holidays",
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
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 1,
                    width: MediaQuery.of(context).size.width * 3 / 5,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Padding(padding: EdgeInsets.symmetric(horizontal: IntegerConstants.recommendedContainerPadding * 2)),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                    primary:
                                    (_selectedGat[0] == false) ? MaterialThemeColors.buttonColorLight : MaterialThemeColors.buttonColor,
                                    minimumSize: Size(144.0, 55.0)),
                                child: Text(
                                  "शिशु गट",
                                  style: TextStyle(fontSize: 22.0),
                                ),
                                onPressed: () async {
                                  setState(() {
                                    _gat = "शिशु गट";
                                    _selectedGat = [true, false, false];
                                  });
                                  setState(() {
                                    _gat = "शिशु गट";
                                    _selectedGat = [true, false, false];
                                  });
                                },
                              ),
                              Padding(padding: EdgeInsets.all(8.0)),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                    primary:
                                    (_selectedGat[1] == false) ? MaterialThemeColors.buttonColorLight : MaterialThemeColors.buttonColor,
                                    minimumSize: Size(144.0, 55.0)),
                                child: Text(
                                  "बाल गट-1",
                                  style: TextStyle(fontSize: 22.0),
                                ),
                                onPressed: () async {
                                  setState(() {
                                    _gat = "बाल गट-1";
                                    _selectedGat = [false, true, false];
                                  });
                                  setState(() {
                                    _gat = "बाल गट-1";
                                    _selectedGat = [false, true, false];
                                  });
                                },
                              ),
                              Padding(padding: EdgeInsets.all(8.0)),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                    primary:
                                    (_selectedGat[2] == false) ? MaterialThemeColors.buttonColorLight : MaterialThemeColors.buttonColor,
                                    minimumSize: Size(144.0, 55.0)),
                                child: Text(
                                  "बाल गट-2",
                                  style: TextStyle(fontSize: 22.0),
                                ),
                                onPressed: () async {
                                  setState(() {
                                    _gat = "बाल गट-2";
                                    _selectedGat = [false, false, true];
                                  });
                                  setState(() {
                                    _gat = "बाल गट-2";
                                    _selectedGat = [false, false, true];
                                  });
                                },
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.all(IntegerConstants.recommendedContainerPadding)),
                          TextFormField(
                            controller: _remarkController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter an Date';
                                // } else if (!RegExp(
                                //         "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                //     .hasMatch(value)) {
                                //   return 'Please enter a valid Email';
                              }
                              return null;
                            },
                            onChanged: (email) {
                              //_email = email;
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
                              labelText: 'Date',
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(IntegerConstants.recommendedContainerPadding)),

                          Padding(padding: EdgeInsets.all(IntegerConstants.recommendedContainerPadding)),
                          TextFormField(
                            controller: _dateController,
                            onChanged: (password) {
                              _date = password;
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
                              labelText: 'remark',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter a remark';
                              }

                              return null;
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
                                "Save",
                                style: TextStyle(fontSize: IntegerConstants.buttonFontSize),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  // _listOfAcharyas = await database.getAllRowsList();
                                  // if (_listOfAcharyas.length == 1) {
                                  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  //     behavior: SnackBarBehavior.floating,
                                  //     backgroundColor: Colors.black38,
                                  //     margin: EdgeInsets.only(
                                  //         bottom: MediaQuery.of(context).size.height / 12,
                                  //         left: MediaQuery.of(context).size.width / 4,
                                  //         right: MediaQuery.of(context).size.width / 4),
                                  //     content: Text(
                                  //       "Acharya already Registered",
                                  //       textAlign: TextAlign.center,
                                  //       style: TextStyle(fontSize: 20),
                                  //     ),
                                  //   ));
                                  // } else {
                                  // await database.deleteAllAcharyas();

                                  Navigator.of(context).pop();
                                }
                                // }
                              },
                            ),
                          ]),


                      ),
                    ),],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // /// Method to get list of all Acharyas
  // void getAllRowsList() async {
  // _listOfAcharyas = await database.getAllRowsList();
  // }

  /// Method to get device unique id
  void _getId() async {
    _deviceUniqueId = (await getId())!;
  }
}
