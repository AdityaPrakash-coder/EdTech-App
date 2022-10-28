import 'package:flutter/material.dart';
import 'package:iitpal_acharya_ui/database_crud/quiz_outcome_crud.dart';
import 'package:iitpal_acharya_ui/database_crud/student_details_crud.dart';
// import '../../database_crud/student_details_crud.dart';
import '../../constants/theme_colors.dart';
import '../../firebase_crud/student_data_crud.dart';
// import '../../database_crud/quiz_outcome_crud.dart';
import 'give_quiz_page.dart';

class SelectStudent extends StatefulWidget {
  final String passedID, passedGat;
  final int passedTime;
  final String deviceId;
  SelectStudent({required this.passedID, required this.passedGat, required this.passedTime,required this.deviceId});
  @override
  SelectStudentState createState() => SelectStudentState(passedID: passedID, passedGat: passedGat, passedTime: passedTime);
}

class SelectStudentState extends State<SelectStudent> {
  // Database
 // final studentDetailsCRUD = StudentDataService();
  final database = StudentDetailsCRUD.instance;

  // Variables
  final String passedID, passedGat;
  final int passedTime;
  SelectStudentState({required this.passedID, required this.passedGat, required this.passedTime});

  late List<Map<String, dynamic>> _listOfStudents;

  @override
  void initState() {
    super.initState();
    print(passedID);
    _getAllRowsList(passedGat);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: MaterialThemeColors.primaryColor,
        centerTitle: true,
        title: Text(
          "EKAL ACHARYA",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: FutureBuilder(
          //future: studentDetailsCRUD.getAllStudents(),
          future: database.getAllRowsList(),
          builder: (context, AsyncSnapshot snapshot) {
            while (snapshot.connectionState == ConnectionState.waiting)
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 5 / 10,
                  padding: EdgeInsets.all(30.0),
                  child: _listOfStudents.length==0?Container(
                    child: Center(
                      child: Text("No Results Found", style: TextStyle(fontSize: 25.0),),
                    ),
                  ):Column(
                    children: [
                      Container(
                        child: Text(
                          "Select a Student",
                          style: TextStyle(fontSize: 30.0),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width / 2,
                        padding: EdgeInsets.all(20.0),
                        child: ListView.builder(
                            itemCount: _listOfStudents.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: ListTile(
                                  onTap: () async {
                                    //start
                                    //final quizOutcomeCRUD=QuizOutcomeCRUD();
                                    final db=await QuizOutcomeCRUD.instance.database;
                                    //var check = await quizOutcomeCRUD.checkQuizGivenByStudent(_listOfStudents[index]["id"], passedID);
                                    var checkList = await db.rawQuery('SELECT COUNT(*) FROM table_quiz_outcome WHERE studentID="${_listOfStudents[index]["id"]}" and quizID="$passedID"');
                                    if(checkList[0]["COUNT(*)"]!=0){
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.black38,
                                        margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height/5, left: MediaQuery.of(context).size.width/4, right: MediaQuery.of(context).size.width/4),
                                        content: Text("This student has already given the quiz", textAlign: TextAlign.center, style: TextStyle(fontSize: 20),),
                                      ));
                                    }
                                    else {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => GetQuestionID(passedID, _listOfStudents[index]["id"], passedTime,widget.deviceId)
                                      ));
                                    }
                                  },
                                  leading: Text("${index+1}",style: TextStyle(fontSize: 22.0,),),
                                  title: Text(_listOfStudents[index]["name"],style: TextStyle(fontSize: 22.0,),),
                                  trailing: Container(
                                      width: MediaQuery.of(context).size.width / 6,
                                      child: Row(
                                        children: [
                                          Text("Gat :  " +
                                              _listOfStudents[index]["gat"],style: TextStyle(fontSize: 15.0,),),
                                          Spacer(),
                                          Text("Age :  " +
                                              _listOfStudents[index]["age"]
                                                  .toString(),style: TextStyle(fontSize: 15.0,),),
                                        ],
                                      )),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  /// Method to get students by gat
  Future<void> _getAllRowsList(String passedGat) async {
    //_listOfStudents = await studentDetailsCRUD.getStudentByGat(passedGat);
    _listOfStudents = await database.getStudentByGat(passedGat);
  }
}