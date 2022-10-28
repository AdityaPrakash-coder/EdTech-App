import 'dart:math';

import '../../i18n/strings.g.dart';

final english = AppLocale.en.build();
final hindi = AppLocale.hi.build();
final tamil = AppLocale.tm.build();
final gujarati = AppLocale.gu.build();
final kannada = AppLocale.kn.build();
final telugu = AppLocale.tl.build();
final bengali = AppLocale.bn.build();
final punjabi = AppLocale.pn.build();
final assamese = AppLocale.as.build();
final malayalam = AppLocale.ma.build();
final marathi = AppLocale.mr.build();
final odia = AppLocale.od.build();
final urdu = AppLocale.ur.build();

String LangSelect(String lang, String value1, String value2) {
  //
  switch (lang) {

    //Hindi
    case "hindi":
      switch (value1) {
        //Home Page
        case "homepage":
          switch (value2) {
            case "studentmode":
              return hindi.homepage.studentmode;
            case "takeattendance":
              return hindi.homepage.takeattendance;
            case "review":
              return hindi.homepage.review;
            case "managestudent":
              return hindi.homepage.managestudent;
            case "logout":
              return hindi.homepage.logout;
            case "assessment":
              return hindi.homepage.assessment;
            case "loadsampledata":
              return hindi.homepage.loadsampledata;
            case "allocatecontent":
              return hindi.homepage.allocatecontent;
            case "ekal":
              return hindi.homepage.ekal;
            case "synced":
              return hindi.homepage.synced;
            case "notsynced":
              return hindi.homepage.notsynced;
            case "loadeddata":
              return hindi.homepage.loadeddata;
            case "logoutwarning":
              return hindi.homepage.logoutwarning;
            case "yes":
              return hindi.homepage.yes;
            case "no":
              return hindi.homepage.no;
            case "attention":
              return hindi.homepage.attention;
            case "syncdata":
              return hindi.homepage.syncdata;
            default:
              return "Null";
          }
        //Student Mode
        case "studentmode":
          switch (value2) {
            case "studentmode":
              return hindi.studentmode.studentmode;
            case "selectdate":
              return hindi.studentmode.selectdate;
            case "nocontent":
              return hindi.studentmode.nocontent;
            case "selectgat":
              return hindi.studentmode.selectgat;
            case "videoname":
              return hindi.studentmode.videoname;
            case "gat":
              return hindi.studentmode.gat;
            case "subject":
              return hindi.studentmode.subject;
            case "topic":
              return hindi.studentmode.topic;
            case "watch":
              return hindi.studentmode.watch;
            case "nocontentforgat":
              return hindi.studentmode.nocontentforgat;
            case "deletecontent":
              return hindi.studentmode.deletecontent;
            case "deletewarning":
              return hindi.studentmode.deletewarning;
            case "no":
              return hindi.studentmode.no;
            case "yes":
              return hindi.studentmode.yes;
            default:
              return "Null";
          }
        //Manage Students
        case "managestudents":
          switch (value2) {
            case "managestudents":
              return hindi.managestudents.managestudents;
            case "search":
              return hindi.managestudents.search;
            case "notfound":
              return hindi.managestudents.notfound;
            case "addnew":
              return hindi.managestudents.addnew;
            case "age":
              return hindi.managestudents.age;
            case "cancel":
              return hindi.managestudents.cancel;
            case "submit":
              return hindi.managestudents.submit;
            case "name":
              return hindi.managestudents.name;
            case "editstudent":
              return hindi.managestudents.editstudent;
            case "deletestudent":
              return hindi.managestudents.deletestudent;
            case "deletestudentwarning":
              return hindi.managestudents.deletestudentwarning;
            case "delete":
              return hindi.managestudents.delete;
            case "gat":
              return hindi.managestudents.gat;
            case "studentadded":
              return hindi.managestudents.studentadded;
            default:
              return "Null";
          }
        //Allocate Content
        case "allocatecontent":
          switch (value2) {
            case "allocatecontent":
              return hindi.allocatecontent.allocatecontent;
            case "selectgat":
              return hindi.allocatecontent.selectgat;
            case "selecttopic":
              return hindi.allocatecontent.selecttopic;
            case "selectvideos":
              return hindi.allocatecontent.selectvideos;
            case "selectedvideos":
              return hindi.allocatecontent.selectedvideos;
            case "dateofcontent":
              return hindi.allocatecontent.dateofcontent;
            case "selectdate":
              return hindi.allocatecontent.selectdate;
            default:
              return "Null";
          }
        //Take Attendance
        case "takeattendance":
          switch (value2) {
            case "takeattendance":
              return hindi.takeattendance.takeattendance;
            case "date":
              return hindi.takeattendance.date;
            case "dashboard":
              return hindi.takeattendance.dashboard;
            case "selectgat":
              return hindi.takeattendance.selectgat;
            case "save":
              return hindi.takeattendance.save;
            case "attendancenottaken":
              return hindi.takeattendance.attendancenottaken;
            case "selectdate":
              return hindi.takeattendance.selectdate;
            case "nostudent":
              return hindi.takeattendance.nostudent;
            case "holiday":
              return hindi.takeattendance.holiday;
            case "ok":
              return hindi.takeattendance.ok;
            case "cancel":
              return hindi.takeattendance.cancel;
            case "attendancetaken":
              return hindi.takeattendance.attendancetaken;
            case "takenwarning":
              return hindi.takeattendance.takenwarning;
            case "confirmattendance":
              return hindi.takeattendance.confirmattendance;
            case "confirmwarning":
              return hindi.takeattendance.confirmwarning;
            default:
              return "Null";
          }
        //Review
        case "review":
          switch (value2) {
            case "review":
              return hindi.review.review;
            case "selectmonth":
              return hindi.review.selectmonth;
            case "selectgat":
              return hindi.review.selectgat;
            case "attendancereview":
              return hindi.review.attendancereview;
            case "quizreview":
              return hindi.review.quizreview;
            case "videoprog":
              return hindi.review.videoprog;
            case "selectstudent":
              return hindi.review.selectstudent;
            case "nodata":
              return hindi.review.nodata;
            case "noquizgiven":
              return hindi.review.noquizgiven;
            case "videono":
              return hindi.review.videono;
            case "topic":
              return hindi.review.topic;
            case "duration":
              return hindi.review.duration;
            case "progress":
              return hindi.review.progress;
            case "noattendance":
              return hindi.review.noattendance;
            default:
              return "Null";
          }
        //assessment
        case "assessment":
          switch (value2) {
            case "createquiz":
              return hindi.assessment.createquiz;
            case "createqs":
              return hindi.assessment.createqs;
            case "createqzs":
              return hindi.assessment.createqzs;
            case "allqzs":
              return hindi.assessment.allqzs;
            case "giveqz":
              return hindi.assessment.giveqz;
            case "selectgat":
              return hindi.assessment.selectgat;
            case "selecttopic":
              return hindi.assessment.selecttopic;
            case "enterq":
              return hindi.assessment.enterq;
            case "enteroptiona":
              return hindi.assessment.enteroptiona;
            case "enteroptionb":
              return hindi.assessment.enteroptionb;
            case "enteroptionc":
              return hindi.assessment.enteroptionc;
            case "enteroptiond":
              return hindi.assessment.enteroptiond;
            case "choosea":
              return hindi.assessment.choosea;
            case "optiona":
              return hindi.assessment.optiona;
            case "optionb":
              return hindi.assessment.optionb;
            case "optionc":
              return hindi.assessment.optionc;
            case "optiond":
              return hindi.assessment.optiond;
            case "selectqs":
              return hindi.assessment.selectqs;
            case "selectatleastoneq":
              return hindi.assessment.selectatleastoneq;
            case "noqs":
              return hindi.assessment.noqs;
            case "makequizwarning":
              return hindi.assessment.makequizwarning;
            case "selectdate":
              return hindi.assessment.selectdate;
            case "qztime":
              return hindi.assessment.qztime;
            case "cancel":
              return hindi.assessment.cancel;
            case "qzcreated":
              return hindi.assessment.qzcreated;
            case "noqzs":
              return hindi.assessment.noqzs;
            case "selectqz":
              return hindi.assessment.selectqz;
            case "listogqzs":
              return hindi.assessment.listogqzs;
            case "noqzsmade":
              return hindi.assessment.noqzsmade;
            case "gat":
              return hindi.assessment.gat;
            case "date":
              return hindi.assessment.date;
            case "deleteqzs":
              return hindi.assessment.deleteqzs;
            case "deleteqzwarning":
              return hindi.assessment.deleteqzwarning;
            default:
              return "Null";
          }
        default:
          return "Null";
      }

//English
    case "english":
      switch (value1) {
        //Home Page
        case "homepage":
          switch (value2) {
            case "studentmode":
              return english.homepage.studentmode;
            case "takeattendance":
              return english.homepage.takeattendance;
            case "review":
              return english.homepage.review;
            case "managestudent":
              return english.homepage.managestudent;
            case "logout":
              return english.homepage.logout;
            case "assessment":
              return english.homepage.assessment;
            case "loadsampledata":
              return english.homepage.loadsampledata;
            case "allocatecontent":
              return english.homepage.allocatecontent;
            case "ekal":
              return english.homepage.ekal;
            case "synced":
              return english.homepage.synced;
            case "notsynced":
              return english.homepage.notsynced;
            case "loadeddata":
              return english.homepage.loadeddata;
            case "logoutwarning":
              return english.homepage.logoutwarning;
            case "yes":
              return english.homepage.yes;
            case "no":
              return english.homepage.no;
            case "attention":
              return english.homepage.attention;
            case "syncdata":
              return english.homepage.syncdata;
            default:
              return "Null";
          }
        //Student Mode
        case "studentmode":
          switch (value2) {
            case "studentmode":
              return english.homepage.studentmode;
            case "selectdate":
              return english.studentmode.selectdate;
            case "nocontent":
              return english.studentmode.nocontent;
            case "selectgat":
              return english.studentmode.selectgat;
            case "videoname":
              return english.studentmode.videoname;
            case "gat":
              return english.studentmode.gat;
            case "subject":
              return english.studentmode.subject;
            case "topic":
              return english.studentmode.topic;
            case "watch":
              return english.studentmode.watch;
            case "nocontentforgat":
              return english.studentmode.nocontentforgat;
            case "deletecontent":
              return english.studentmode.deletecontent;
            case "deletewarning":
              return english.studentmode.deletewarning;
            case "no":
              return english.studentmode.no;
            case "yes":
              return english.studentmode.yes;
            default:
              return "Null";
          }

        //Manage Students
        case "managestudents":
          switch (value2) {
            case "managestudents":
              return english.managestudents.managestudents;
            case "search":
              return english.managestudents.search;
            case "notfound":
              return english.managestudents.notfound;
            case "addnew":
              return english.managestudents.addnew;
            case "age":
              return english.managestudents.age;
            case "cancel":
              return english.managestudents.cancel;
            case "submit":
              return english.managestudents.submit;
            case "name":
              return english.managestudents.name;
            case "editstudent":
              return english.managestudents.editstudent;
            case "deletestudent":
              return english.managestudents.deletestudent;
            case "deletestudentwarning":
              return english.managestudents.deletestudentwarning;
            case "delete":
              return english.managestudents.delete;
            case "gat":
              return english.managestudents.gat;
            case "studentadded":
              return english.managestudents.studentadded;
            default:
              return "Null";
          }
        //Allocate Content
        case "allocatecontent":
          switch (value2) {
            case "allocatecontent":
              return english.allocatecontent.allocatecontent;
            case "selectgat":
              return english.allocatecontent.selectgat;
            case "selecttopic":
              return english.allocatecontent.selecttopic;
            case "selectvideos":
              return english.allocatecontent.selectvideos;
            case "selectedvideos":
              return english.allocatecontent.selectedvideos;
            case "dateofcontent":
              return english.allocatecontent.dateofcontent;
            case "selectdate":
              return english.allocatecontent.selectdate;
            default:
              return "Null";
          }
        //Take Attendance
        case "takeattendance":
          switch (value2) {
            case "takeattendance":
              return english.takeattendance.takeattendance;
            case "date":
              return english.takeattendance.date;
            case "dashboard":
              return english.takeattendance.dashboard;
            case "selectgat":
              return english.takeattendance.selectgat;
            case "save":
              return english.takeattendance.save;
            case "attendancenottaken":
              return english.takeattendance.attendancenottaken;
            case "selectdate":
              return english.takeattendance.selectdate;
            case "nostudent":
              return english.takeattendance.nostudent;
            case "holiday":
              return english.takeattendance.holiday;
            case "ok":
              return english.takeattendance.ok;
            case "cancel":
              return english.takeattendance.cancel;
            case "attendancetaken":
              return english.takeattendance.attendancetaken;
            case "takenwarning":
              return english.takeattendance.takenwarning;
            case "confirmattendance":
              return english.takeattendance.confirmattendance;
            case "confirmwarning":
              return english.takeattendance.confirmwarning;
            default:
              return "Null";
          }
        //Review
        case "review":
          switch (value2) {
            case "review":
              return english.review.review;
            case "selectmonth":
              return english.review.selectmonth;
            case "selectgat":
              return english.review.selectgat;
            case "attendancereview":
              return english.review.attendancereview;
            case "quizreview":
              return english.review.quizreview;
            case "videoprog":
              return english.review.videoprog;
            case "selectstudent":
              return english.review.selectstudent;
            case "nodata":
              return english.review.nodata;
            case "noquizgiven":
              return english.review.noquizgiven;
            case "videono":
              return english.review.videono;
            case "topic":
              return english.review.topic;
            case "duration":
              return english.review.duration;
            case "progress":
              return english.review.progress;
            case "noattendance":
              return english.review.noattendance;
            default:
              return "Null";
          }
        //Assessment
        case "assessment":
          switch (value2) {
            case "createquiz":
              return english.assessment.createquiz;
            case "createqs":
              return english.assessment.createqs;
            case "createqzs":
              return english.assessment.createqzs;
            case "allqzs":
              return english.assessment.allqzs;
            case "giveqz":
              return english.assessment.giveqz;
            case "selectgat":
              return english.assessment.selectgat;
            case "selecttopic":
              return english.assessment.selecttopic;
            case "enterq":
              return english.assessment.enterq;
            case "enteroptiona":
              return english.assessment.enteroptiona;
            case "enteroptionb":
              return english.assessment.enteroptionb;
            case "enteroptionc":
              return english.assessment.enteroptionc;
            case "enteroptiond":
              return english.assessment.enteroptiond;
            case "choosea":
              return english.assessment.choosea;
            case "optiona":
              return english.assessment.optiona;
            case "optionb":
              return english.assessment.optionb;
            case "optionc":
              return english.assessment.optionc;
            case "optiond":
              return english.assessment.optiond;
            case "selectqs":
              return english.assessment.selectqs;
            case "selectatleastoneq":
              return english.assessment.selectatleastoneq;
            case "noqs":
              return english.assessment.noqs;
            case "makequizwarning":
              return english.assessment.makequizwarning;
            case "selectdate":
              return english.assessment.selectdate;
            case "qztime":
              return english.assessment.qztime;
            case "cancel":
              return english.assessment.cancel;
            case "qzcreated":
              return english.assessment.qzcreated;
            case "noqzs":
              return english.assessment.noqzs;
            case "selectqz":
              return english.assessment.selectqz;
            case "listogqzs":
              return english.assessment.listogqzs;
            case "noqzsmade":
              return english.assessment.noqzsmade;
            case "gat":
              return english.assessment.gat;
            case "date":
              return english.assessment.date;
            case "deleteqzs":
              return english.assessment.deleteqzs;
            case "deleteqzwarning":
              return english.assessment.deleteqzwarning;
            default:
              return "Null";
          }
        default:
          return "Null";
      }

    //tamil
    case "tamil":
      switch (value1) {
        //Home Page
        case "homepage":
          switch (value2) {
            case "studentmode":
              return tamil.homepage.studentmode;
            case "takeattendance":
              return tamil.homepage.takeattendance;
            case "review":
              return tamil.homepage.review;
            case "managestudent":
              return tamil.homepage.managestudent;
            case "logout":
              return tamil.homepage.logout;
            case "assessment":
              return tamil.homepage.assessment;
            case "loadsampledata":
              return tamil.homepage.loadsampledata;
            case "allocatecontent":
              return tamil.homepage.allocatecontent;
            case "ekal":
              return tamil.homepage.ekal;
            case "synced":
              return tamil.homepage.synced;
            case "notsynced":
              return tamil.homepage.notsynced;
            case "loadeddata":
              return tamil.homepage.loadeddata;
            case "logoutwarning":
              return tamil.homepage.logoutwarning;
            case "yes":
              return tamil.homepage.yes;
            case "no":
              return tamil.homepage.no;
            case "attention":
              return tamil.homepage.attention;
            case "syncdata":
              return tamil.homepage.syncdata;
            default:
              return "Null";
          }
        //Student Mode
        case "studentmode":
          switch (value2) {
            case "studentmode":
              return tamil.studentmode.studentmode;
            case "selectdate":
              return tamil.studentmode.selectdate;
            case "nocontent":
              return tamil.studentmode.nocontent;
            case "selectgat":
              return tamil.studentmode.selectgat;
            case "videoname":
              return tamil.studentmode.videoname;
            case "gat":
              return tamil.studentmode.gat;
            case "subject":
              return tamil.studentmode.subject;
            case "topic":
              return tamil.studentmode.topic;
            case "watch":
              return tamil.studentmode.watch;
            case "nocontentforgat":
              return tamil.studentmode.nocontentforgat;
            case "deletecontent":
              return tamil.studentmode.deletecontent;
            case "deletewarning":
              return tamil.studentmode.deletewarning;
            case "no":
              return tamil.studentmode.no;
            case "yes":
              return tamil.studentmode.yes;
            default:
              return "Null";
          }
        //Manage Students
        case "managestudents":
          switch (value2) {
            case "managestudents":
              return tamil.managestudents.managestudents;
            case "search":
              return tamil.managestudents.search;
            case "notfound":
              return tamil.managestudents.notfound;
            case "addnew":
              return tamil.managestudents.addnew;
            case "age":
              return tamil.managestudents.age;
            case "cancel":
              return tamil.managestudents.cancel;
            case "submit":
              return tamil.managestudents.submit;
            case "name":
              return tamil.managestudents.name;
            case "editstudent":
              return tamil.managestudents.editstudent;
            case "deletestudent":
              return tamil.managestudents.deletestudent;
            case "deletestudentwarning":
              return tamil.managestudents.deletestudentwarning;
            case "delete":
              return tamil.managestudents.delete;
            case "gat":
              return tamil.managestudents.gat;
            case "studentadded":
              return tamil.managestudents.studentadded;
            default:
              return "Null";
          }
        //Allocate Content
        case "allocatecontent":
          switch (value2) {
            case "allocatecontent":
              return tamil.allocatecontent.allocatecontent;
            case "selectgat":
              return tamil.allocatecontent.selectgat;
            case "selecttopic":
              return tamil.allocatecontent.selecttopic;
            case "selectvideos":
              return tamil.allocatecontent.selectvideos;
            case "selectedvideos":
              return tamil.allocatecontent.selectedvideos;
            case "dateofcontent":
              return tamil.allocatecontent.dateofcontent;
            case "selectdate":
              return tamil.allocatecontent.selectdate;
            default:
              return "Null";
          }
        //Take Attendance
        case "takeattendance":
          switch (value2) {
            case "takeattendance":
              return tamil.takeattendance.takeattendance;
            case "date":
              return tamil.takeattendance.date;
            case "dashboard":
              return tamil.takeattendance.dashboard;
            case "selectgat":
              return tamil.takeattendance.selectgat;
            case "save":
              return tamil.takeattendance.save;
            case "attendancenottaken":
              return tamil.takeattendance.attendancenottaken;
            case "selectdate":
              return tamil.takeattendance.selectdate;
            case "nostudent":
              return tamil.takeattendance.nostudent;
            case "holiday":
              return tamil.takeattendance.holiday;
            case "ok":
              return tamil.takeattendance.ok;
            case "cancel":
              return tamil.takeattendance.cancel;
            case "attendancetaken":
              return tamil.takeattendance.attendancetaken;
            case "takenwarning":
              return tamil.takeattendance.takenwarning;
            case "confirmattendance":
              return tamil.takeattendance.confirmattendance;
            case "confirmwarning":
              return tamil.takeattendance.confirmwarning;
            default:
              return "Null";
          }
        //Review
        case "review":
          switch (value2) {
            case "review":
              return tamil.review.review;
            case "selectmonth":
              return tamil.review.selectmonth;
            case "selectgat":
              return tamil.review.selectgat;
            case "attendancereview":
              return tamil.review.attendancereview;
            case "quizreview":
              return tamil.review.quizreview;
            case "videoprog":
              return tamil.review.videoprog;
            case "selectstudent":
              return tamil.review.selectstudent;
            case "nodata":
              return tamil.review.nodata;
            case "noquizgiven":
              return tamil.review.noquizgiven;
            case "videono":
              return tamil.review.videono;
            case "topic":
              return tamil.review.topic;
            case "duration":
              return tamil.review.duration;
            case "progress":
              return tamil.review.progress;
            case "noattendance":
              return tamil.review.noattendance;
            default:
              return "Null";
          }
        //assessment
        case "assessment":
          switch (value2) {
            case "createquiz":
              return tamil.assessment.createquiz;
            case "createqs":
              return tamil.assessment.createqs;
            case "createqzs":
              return tamil.assessment.createqzs;
            case "allqzs":
              return tamil.assessment.allqzs;
            case "giveqz":
              return tamil.assessment.giveqz;
            case "selectgat":
              return tamil.assessment.selectgat;
            case "selecttopic":
              return tamil.assessment.selecttopic;
            case "enterq":
              return tamil.assessment.enterq;
            case "enteroptiona":
              return tamil.assessment.enteroptiona;
            case "enteroptionb":
              return tamil.assessment.enteroptionb;
            case "enteroptionc":
              return tamil.assessment.enteroptionc;
            case "enteroptiond":
              return tamil.assessment.enteroptiond;
            case "choosea":
              return tamil.assessment.choosea;
            case "optiona":
              return tamil.assessment.optiona;
            case "optionb":
              return tamil.assessment.optionb;
            case "optionc":
              return tamil.assessment.optionc;
            case "optiond":
              return tamil.assessment.optiond;
            case "selectqs":
              return tamil.assessment.selectqs;
            case "selectatleastoneq":
              return tamil.assessment.selectatleastoneq;
            case "noqs":
              return tamil.assessment.noqs;
            case "makequizwarning":
              return tamil.assessment.makequizwarning;
            case "selectdate":
              return tamil.assessment.selectdate;
            case "qztime":
              return tamil.assessment.qztime;
            case "cancel":
              return tamil.assessment.cancel;
            case "qzcreated":
              return tamil.assessment.qzcreated;
            case "noqzs":
              return tamil.assessment.noqzs;
            case "selectqz":
              return tamil.assessment.selectqz;
            case "listogqzs":
              return tamil.assessment.listogqzs;
            case "noqzsmade":
              return tamil.assessment.noqzsmade;
            case "gat":
              return tamil.assessment.gat;
            case "date":
              return tamil.assessment.date;
            case "deleteqzs":
              return tamil.assessment.deleteqzs;
            case "deleteqzwarning":
              return tamil.assessment.deleteqzwarning;
            case "ok":
              return tamil.assessment.ok;
            default:
              return "Null";
          }
        default:
          return "Null";
      }
    //Gujarati
    case "gujarati":
      switch (value1) {
        //Home Page
        case "homepage":
          switch (value2) {
            case "studentmode":
              return gujarati.homepage.studentmode;
            case "takeattendance":
              return gujarati.homepage.takeattendance;
            case "review":
              return gujarati.homepage.review;
            case "managestudent":
              return gujarati.homepage.managestudent;
            case "logout":
              return gujarati.homepage.logout;
            case "assessment":
              return gujarati.homepage.assessment;
            case "loadsampledata":
              return gujarati.homepage.loadsampledata;
            case "allocatecontent":
              return gujarati.homepage.allocatecontent;
            case "ekal":
              return gujarati.homepage.ekal;
            case "synced":
              return gujarati.homepage.synced;
            case "notsynced":
              return gujarati.homepage.notsynced;
            case "loadeddata":
              return gujarati.homepage.loadeddata;
            case "logoutwarning":
              return gujarati.homepage.logoutwarning;
            case "yes":
              return gujarati.homepage.yes;
            case "no":
              return gujarati.homepage.no;
            case "attention":
              return gujarati.homepage.attention;
            case "syncdata":
              return gujarati.homepage.syncdata;
            default:
              return "Null";
          }
        //Student Mode
        case "studentmode":
          switch (value2) {
            case "studentmode":
              return gujarati.studentmode.studentmode;
            case "selectdate":
              return gujarati.studentmode.selectdate;
            case "nocontent":
              return gujarati.studentmode.nocontent;
            case "selectgat":
              return gujarati.studentmode.selectgat;
            case "videoname":
              return gujarati.studentmode.videoname;
            case "gat":
              return gujarati.studentmode.gat;
            case "subject":
              return gujarati.studentmode.subject;
            case "topic":
              return gujarati.studentmode.topic;
            case "watch":
              return gujarati.studentmode.watch;
            case "nocontentforgat":
              return gujarati.studentmode.nocontentforgat;
            case "deletecontent":
              return gujarati.studentmode.deletecontent;
            case "deletewarning":
              return gujarati.studentmode.deletewarning;
            case "no":
              return gujarati.studentmode.no;
            case "yes":
              return gujarati.studentmode.yes;
            default:
              return "Null";
          }
        //Manage Students
        case "managestudents":
          switch (value2) {
            case "managestudents":
              return gujarati.managestudents.managestudents;
            case "search":
              return gujarati.managestudents.search;
            case "notfound":
              return gujarati.managestudents.notfound;
            case "addnew":
              return gujarati.managestudents.addnew;
            case "age":
              return gujarati.managestudents.age;
            case "cancel":
              return gujarati.managestudents.cancel;
            case "submit":
              return gujarati.managestudents.submit;
            case "name":
              return gujarati.managestudents.name;
            case "editstudent":
              return gujarati.managestudents.editstudent;
            case "deletestudent":
              return gujarati.managestudents.deletestudent;
            case "deletestudentwarning":
              return gujarati.managestudents.deletestudentwarning;
            case "delete":
              return gujarati.managestudents.delete;
            case "gat":
              return gujarati.managestudents.gat;
            case "studentadded":
              return gujarati.managestudents.studentadded;
            default:
              return "Null";
          }
        //Allocate Content
        case "allocatecontent":
          switch (value2) {
            case "allocatecontent":
              return gujarati.allocatecontent.allocatecontent;
            case "selectgat":
              return gujarati.allocatecontent.selectgat;
            case "selecttopic":
              return gujarati.allocatecontent.selecttopic;
            case "selectvideos":
              return gujarati.allocatecontent.selectvideos;
            case "selectedvideos":
              return gujarati.allocatecontent.selectedvideos;
            case "dateofcontent":
              return gujarati.allocatecontent.dateofcontent;
            case "selectdate":
              return gujarati.allocatecontent.selectdate;
            default:
              return "Null";
          }
        //Take Attendance
        case "takeattendance":
          switch (value2) {
            case "takeattendance":
              return gujarati.takeattendance.takeattendance;
            case "date":
              return gujarati.takeattendance.date;
            case "dashboard":
              return gujarati.takeattendance.dashboard;
            case "selectgat":
              return gujarati.takeattendance.selectgat;
            case "save":
              return gujarati.takeattendance.save;
            case "attendancenottaken":
              return gujarati.takeattendance.attendancenottaken;
            case "selectdate":
              return gujarati.takeattendance.selectdate;
            case "nostudent":
              return gujarati.takeattendance.nostudent;
            case "holiday":
              return gujarati.takeattendance.holiday;
            case "ok":
              return gujarati.takeattendance.ok;
            case "cancel":
              return gujarati.takeattendance.cancel;
            case "attendancetaken":
              return gujarati.takeattendance.attendancetaken;
            case "takenwarning":
              return gujarati.takeattendance.takenwarning;
            case "confirmattendance":
              return gujarati.takeattendance.confirmattendance;
            case "confirmwarning":
              return gujarati.takeattendance.confirmwarning;

            default:
              return "Null";
          }
        //Review
        case "review":
          switch (value2) {
            case "review":
              return gujarati.review.review;
            case "selectmonth":
              return gujarati.review.selectmonth;
            case "selectgat":
              return gujarati.review.selectgat;
            case "attendancereview":
              return gujarati.review.attendancereview;
            case "quizreview":
              return gujarati.review.quizreview;
            case "videoprog":
              return gujarati.review.videoprog;
            case "selectstudent":
              return gujarati.review.selectstudent;
            case "nodata":
              return gujarati.review.nodata;
            case "noquizgiven":
              return gujarati.review.noquizgiven;
            case "videono":
              return gujarati.review.videono;
            case "topic":
              return gujarati.review.topic;
            case "duration":
              return gujarati.review.duration;
            case "progress":
              return gujarati.review.progress;
            case "noattendance":
              return gujarati.review.noattendance;
            default:
              return "Null";
          }
        //assessment
        case "assessment":
          switch (value2) {
            case "createquiz":
              return gujarati.assessment.createquiz;
            case "createqs":
              return gujarati.assessment.createqs;
            case "createqzs":
              return gujarati.assessment.createqzs;
            case "allqzs":
              return gujarati.assessment.allqzs;
            case "giveqz":
              return gujarati.assessment.giveqz;
            case "selectgat":
              return gujarati.assessment.selectgat;
            case "selecttopic":
              return gujarati.assessment.selecttopic;
            case "enterq":
              return gujarati.assessment.enterq;
            case "enteroptiona":
              return gujarati.assessment.enteroptiona;
            case "enteroptionb":
              return gujarati.assessment.enteroptionb;
            case "enteroptionc":
              return gujarati.assessment.enteroptionc;
            case "enteroptiond":
              return gujarati.assessment.enteroptiond;
            case "choosea":
              return gujarati.assessment.choosea;
            case "optiona":
              return gujarati.assessment.optiona;
            case "optionb":
              return gujarati.assessment.optionb;
            case "optionc":
              return gujarati.assessment.optionc;
            case "optiond":
              return gujarati.assessment.optiond;
            case "selectqs":
              return gujarati.assessment.selectqs;
            case "selectatleastoneq":
              return gujarati.assessment.selectatleastoneq;
            case "noqs":
              return gujarati.assessment.noqs;
            case "makequizwarning":
              return gujarati.assessment.makequizwarning;
            case "selectdate":
              return gujarati.assessment.selectdate;
            case "qztime":
              return gujarati.assessment.qztime;
            case "cancel":
              return gujarati.assessment.cancel;
            case "qzcreated":
              return gujarati.assessment.qzcreated;
            case "noqzs":
              return gujarati.assessment.noqzs;
            case "selectqz":
              return gujarati.assessment.selectqz;
            case "listogqzs":
              return gujarati.assessment.listogqzs;
            case "noqzsmade":
              return gujarati.assessment.noqzsmade;
            case "gat":
              return gujarati.assessment.gat;
            case "date":
              return gujarati.assessment.date;
            case "deleteqzs":
              return gujarati.assessment.deleteqzs;
            case "deleteqzwarning":
              return gujarati.assessment.deleteqzwarning;
            case "ok":
              return gujarati.assessment.ok;
            default:
              return "Null";
          }
        default:
          return "Null";
      }
    //Kannada
    case "kannada":
      switch (value1) {
        //Home Page
        case "homepage":
          switch (value2) {
            case "studentmode":
              return kannada.homepage.studentmode;
            case "takeattendance":
              return kannada.homepage.takeattendance;
            case "review":
              return kannada.homepage.review;
            case "managestudent":
              return kannada.homepage.managestudent;
            case "logout":
              return kannada.homepage.logout;
            case "assessment":
              return kannada.homepage.assessment;
            case "loadsampledata":
              return kannada.homepage.loadsampledata;
            case "allocatecontent":
              return kannada.homepage.allocatecontent;
            case "ekal":
              return kannada.homepage.ekal;
            case "synced":
              return kannada.homepage.synced;
            case "notsynced":
              return kannada.homepage.notsynced;
            case "loadeddata":
              return kannada.homepage.loadeddata;
            case "logoutwarning":
              return kannada.homepage.logoutwarning;
            case "yes":
              return kannada.homepage.yes;
            case "no":
              return kannada.homepage.no;
            case "attention":
              return kannada.homepage.attention;
            case "syncdata":
              return kannada.homepage.syncdata;
            default:
              return "Null";
          }
        //Student Mode
        case "studentmode":
          switch (value2) {
            case "studentmode":
              return kannada.studentmode.studentmode;
            case "selectdate":
              return kannada.studentmode.selectdate;
            case "nocontent":
              return kannada.studentmode.nocontent;
            case "selectgat":
              return kannada.studentmode.selectgat;
            case "videoname":
              return kannada.studentmode.videoname;
            case "gat":
              return kannada.studentmode.gat;
            case "subject":
              return kannada.studentmode.subject;
            case "topic":
              return kannada.studentmode.topic;
            case "watch":
              return kannada.studentmode.watch;
            case "nocontentforgat":
              return kannada.studentmode.nocontentforgat;
            case "deletecontent":
              return kannada.studentmode.deletecontent;
            case "deletewarning":
              return kannada.studentmode.deletewarning;
            case "no":
              return kannada.studentmode.no;
            case "yes":
              return kannada.studentmode.yes;
            default:
              return "Null";
          }
        //Manage Students
        case "managestudents":
          switch (value2) {
            case "managestudents":
              return kannada.managestudents.managestudents;
            case "search":
              return kannada.managestudents.search;
            case "notfound":
              return kannada.managestudents.notfound;
            case "addnew":
              return kannada.managestudents.addnew;
            case "age":
              return kannada.managestudents.age;
            case "cancel":
              return kannada.managestudents.cancel;
            case "submit":
              return kannada.managestudents.submit;
            case "name":
              return kannada.managestudents.name;
            case "editstudent":
              return kannada.managestudents.editstudent;
            case "deletestudent":
              return kannada.managestudents.deletestudent;
            case "deletestudentwarning":
              return kannada.managestudents.deletestudentwarning;
            case "delete":
              return kannada.managestudents.delete;
            case "gat":
              return kannada.managestudents.gat;
            case "studentadded":
              return kannada.managestudents.studentadded;
            default:
              return "Null";
          }
        //Allocate Content
        case "allocatecontent":
          switch (value2) {
            case "allocatecontent":
              return kannada.allocatecontent.allocatecontent;
            case "selectgat":
              return kannada.allocatecontent.selectgat;
            case "selecttopic":
              return kannada.allocatecontent.selecttopic;
            case "selectvideos":
              return kannada.allocatecontent.selectvideos;
            case "selectedvideos":
              return kannada.allocatecontent.selectedvideos;
            case "dateofcontent":
              return kannada.allocatecontent.dateofcontent;
            case "selectdate":
              return kannada.allocatecontent.selectdate;
            default:
              return "Null";
          }
        //Take Attendance
        case "takeattendance":
          switch (value2) {
            case "takeattendance":
              return kannada.takeattendance.takeattendance;
            case "date":
              return kannada.takeattendance.date;
            case "dashboard":
              return kannada.takeattendance.dashboard;
            case "selectgat":
              return kannada.takeattendance.selectgat;
            case "save":
              return kannada.takeattendance.save;
            case "attendancenottaken":
              return kannada.takeattendance.attendancenottaken;
            case "selectdate":
              return kannada.takeattendance.selectdate;
            case "nostudent":
              return kannada.takeattendance.nostudent;
            case "holiday":
              return kannada.takeattendance.holiday;
            case "ok":
              return kannada.takeattendance.ok;
            case "cancel":
              return kannada.takeattendance.cancel;
            case "attendancetaken":
              return kannada.takeattendance.attendancetaken;
            case "takenwarning":
              return kannada.takeattendance.takenwarning;
            case "confirmattendance":
              return kannada.takeattendance.confirmattendance;
            case "confirmwarning":
              return kannada.takeattendance.confirmwarning;

            default:
              return "Null";
          }
        //Review
        case "review":
          switch (value2) {
            case "review":
              return kannada.review.review;
            case "selectmonth":
              return kannada.review.selectmonth;
            case "selectgat":
              return kannada.review.selectgat;
            case "attendancereview":
              return kannada.review.attendancereview;
            case "quizreview":
              return kannada.review.quizreview;
            case "videoprog":
              return kannada.review.videoprog;
            case "selectstudent":
              return kannada.review.selectstudent;
            case "nodata":
              return kannada.review.nodata;
            case "noquizgiven":
              return kannada.review.noquizgiven;
            case "videono":
              return kannada.review.videono;
            case "topic":
              return kannada.review.topic;
            case "duration":
              return kannada.review.duration;
            case "progress":
              return kannada.review.progress;
            case "noattendance":
              return kannada.review.noattendance;
            default:
              return "Null";
          }
        //assessment
        case "assessment":
          switch (value2) {
            case "createquiz":
              return kannada.assessment.createquiz;
            case "createqs":
              return kannada.assessment.createqs;
            case "createqzs":
              return kannada.assessment.createqzs;
            case "allqzs":
              return kannada.assessment.allqzs;
            case "giveqz":
              return kannada.assessment.giveqz;
            case "selectgat":
              return kannada.assessment.selectgat;
            case "selecttopic":
              return kannada.assessment.selecttopic;
            case "enterq":
              return kannada.assessment.enterq;
            case "enteroptiona":
              return kannada.assessment.enteroptiona;
            case "enteroptionb":
              return kannada.assessment.enteroptionb;
            case "enteroptionc":
              return kannada.assessment.enteroptionc;
            case "enteroptiond":
              return kannada.assessment.enteroptiond;
            case "choosea":
              return kannada.assessment.choosea;
            case "optiona":
              return kannada.assessment.optiona;
            case "optionb":
              return kannada.assessment.optionb;
            case "optionc":
              return kannada.assessment.optionc;
            case "optiond":
              return kannada.assessment.optiond;
            case "selectqs":
              return kannada.assessment.selectqs;
            case "selectatleastoneq":
              return kannada.assessment.selectatleastoneq;
            case "noqs":
              return kannada.assessment.noqs;
            case "makequizwarning":
              return kannada.assessment.makequizwarning;
            case "selectdate":
              return kannada.assessment.selectdate;
            case "qztime":
              return kannada.assessment.qztime;
            case "cancel":
              return kannada.assessment.cancel;
            case "qzcreated":
              return kannada.assessment.qzcreated;
            case "noqzs":
              return kannada.assessment.noqzs;
            case "selectqz":
              return kannada.assessment.selectqz;
            case "listogqzs":
              return kannada.assessment.listogqzs;
            case "noqzsmade":
              return kannada.assessment.noqzsmade;
            case "gat":
              return kannada.assessment.gat;
            case "date":
              return kannada.assessment.date;
            case "deleteqzs":
              return kannada.assessment.deleteqzs;
            case "deleteqzwarning":
              return kannada.assessment.deleteqzwarning;
            case "ok":
              return kannada.assessment.ok;
            default:
              return "Null";
          }
        default:
          return "Null";
      }
    //Telugu
    case "telugu":
      switch (value1) {
        //Home Page
        case "homepage":
          switch (value2) {
            case "studentmode":
              return telugu.homepage.studentmode;
            case "takeattendance":
              return telugu.homepage.takeattendance;
            case "review":
              return telugu.homepage.review;
            case "managestudent":
              return telugu.homepage.managestudent;
            case "logout":
              return telugu.homepage.logout;
            case "assessment":
              return telugu.homepage.assessment;
            case "loadsampledata":
              return telugu.homepage.loadsampledata;
            case "allocatecontent":
              return telugu.homepage.allocatecontent;
            case "ekal":
              return telugu.homepage.ekal;
            case "synced":
              return telugu.homepage.synced;
            case "notsynced":
              return telugu.homepage.notsynced;
            case "loadeddata":
              return telugu.homepage.loadeddata;
            case "logoutwarning":
              return telugu.homepage.logoutwarning;
            case "yes":
              return telugu.homepage.yes;
            case "no":
              return telugu.homepage.no;
            case "attention":
              return telugu.homepage.attention;
            case "syncdata":
              return telugu.homepage.syncdata;
            default:
              return "Null";
          }
        //Student Mode
        case "studentmode":
          switch (value2) {
            case "studentmode":
              return telugu.studentmode.studentmode;
            case "selectdate":
              return telugu.studentmode.selectdate;
            case "nocontent":
              return telugu.studentmode.nocontent;
            case "selectgat":
              return telugu.studentmode.selectgat;
            case "videoname":
              return telugu.studentmode.videoname;
            case "gat":
              return telugu.studentmode.gat;
            case "subject":
              return telugu.studentmode.subject;
            case "topic":
              return telugu.studentmode.topic;
            case "watch":
              return telugu.studentmode.watch;
            case "nocontentforgat":
              return telugu.studentmode.nocontentforgat;
            case "deletecontent":
              return telugu.studentmode.deletecontent;
            case "deletewarning":
              return telugu.studentmode.deletewarning;
            case "no":
              return telugu.studentmode.no;
            case "yes":
              return telugu.studentmode.yes;
            default:
              return "Null";
          }
        //Manage Students
        case "managestudents":
          switch (value2) {
            case "managestudents":
              return telugu.managestudents.managestudents;
            case "search":
              return telugu.managestudents.search;
            case "notfound":
              return telugu.managestudents.notfound;
            case "addnew":
              return telugu.managestudents.addnew;
            case "age":
              return telugu.managestudents.age;
            case "cancel":
              return telugu.managestudents.cancel;
            case "submit":
              return telugu.managestudents.submit;
            case "name":
              return telugu.managestudents.name;
            case "editstudent":
              return telugu.managestudents.editstudent;
            case "deletestudent":
              return telugu.managestudents.deletestudent;
            case "deletestudentwarning":
              return telugu.managestudents.deletestudentwarning;
            case "delete":
              return telugu.managestudents.delete;
            case "gat":
              return telugu.managestudents.gat;
            case "studentadded":
              return telugu.managestudents.studentadded;
            default:
              return "Null";
          }
        //Allocate Content
        case "allocatecontent":
          switch (value2) {
            case "allocatecontent":
              return telugu.allocatecontent.allocatecontent;
            case "selectgat":
              return telugu.allocatecontent.selectgat;
            case "selecttopic":
              return telugu.allocatecontent.selecttopic;
            case "selectvideos":
              return telugu.allocatecontent.selectvideos;
            case "selectedvideos":
              return telugu.allocatecontent.selectedvideos;
            case "dateofcontent":
              return telugu.allocatecontent.dateofcontent;
            case "selectdate":
              return telugu.allocatecontent.selectdate;
            default:
              return "Null";
          }
        //Take Attendance
        case "takeattendance":
          switch (value2) {
            case "takeattendance":
              return telugu.takeattendance.takeattendance;
            case "date":
              return telugu.takeattendance.date;
            case "dashboard":
              return telugu.takeattendance.dashboard;
            case "selectgat":
              return telugu.takeattendance.selectgat;
            case "save":
              return telugu.takeattendance.save;
            case "attendancenottaken":
              return telugu.takeattendance.attendancenottaken;
            case "selectdate":
              return telugu.takeattendance.selectdate;
            case "nostudent":
              return telugu.takeattendance.nostudent;
            case "holiday":
              return telugu.takeattendance.holiday;
            case "ok":
              return telugu.takeattendance.ok;
            case "cancel":
              return telugu.takeattendance.cancel;
            case "attendancetaken":
              return telugu.takeattendance.attendancetaken;
            case "takenwarning":
              return telugu.takeattendance.takenwarning;
            case "confirmattendance":
              return telugu.takeattendance.confirmattendance;
            case "confirmwarning":
              return telugu.takeattendance.confirmwarning;

            default:
              return "Null";
          }
        //Review
        case "review":
          switch (value2) {
            case "review":
              return telugu.review.review;
            case "selectmonth":
              return telugu.review.selectmonth;
            case "selectgat":
              return telugu.review.selectgat;
            case "attendancereview":
              return telugu.review.attendancereview;
            case "quizreview":
              return telugu.review.quizreview;
            case "videoprog":
              return telugu.review.videoprog;
            case "selectstudent":
              return telugu.review.selectstudent;
            case "nodata":
              return telugu.review.nodata;
            case "noquizgiven":
              return telugu.review.noquizgiven;
            case "videono":
              return telugu.review.videono;
            case "topic":
              return telugu.review.topic;
            case "duration":
              return telugu.review.duration;
            case "progress":
              return telugu.review.progress;
            case "noattendance":
              return telugu.review.noattendance;
            default:
              return "Null";
          }
        //assessment
        case "assessment":
          switch (value2) {
            case "createquiz":
              return telugu.assessment.createquiz;
            case "createqs":
              return telugu.assessment.createqs;
            case "createqzs":
              return telugu.assessment.createqzs;
            case "allqzs":
              return telugu.assessment.allqzs;
            case "giveqz":
              return telugu.assessment.giveqz;
            case "selectgat":
              return telugu.assessment.selectgat;
            case "selecttopic":
              return telugu.assessment.selecttopic;
            case "enterq":
              return telugu.assessment.enterq;
            case "enteroptiona":
              return telugu.assessment.enteroptiona;
            case "enteroptionb":
              return telugu.assessment.enteroptionb;
            case "enteroptionc":
              return telugu.assessment.enteroptionc;
            case "enteroptiond":
              return telugu.assessment.enteroptiond;
            case "choosea":
              return telugu.assessment.choosea;
            case "optiona":
              return telugu.assessment.optiona;
            case "optionb":
              return telugu.assessment.optionb;
            case "optionc":
              return telugu.assessment.optionc;
            case "optiond":
              return telugu.assessment.optiond;
            case "selectqs":
              return telugu.assessment.selectqs;
            case "selectatleastoneq":
              return telugu.assessment.selectatleastoneq;
            case "noqs":
              return telugu.assessment.noqs;
            case "makequizwarning":
              return telugu.assessment.makequizwarning;
            case "selectdate":
              return telugu.assessment.selectdate;
            case "qztime":
              return telugu.assessment.qztime;
            case "cancel":
              return telugu.assessment.cancel;
            case "qzcreated":
              return telugu.assessment.qzcreated;
            case "noqzs":
              return telugu.assessment.noqzs;
            case "selectqz":
              return telugu.assessment.selectqz;
            case "listogqzs":
              return telugu.assessment.listogqzs;
            case "noqzsmade":
              return telugu.assessment.noqzsmade;
            case "gat":
              return telugu.assessment.gat;
            case "date":
              return telugu.assessment.date;
            case "deleteqzs":
              return telugu.assessment.deleteqzs;
            case "deleteqzwarning":
              return telugu.assessment.deleteqzwarning;
            case "ok":
              return telugu.assessment.ok;
            default:
              return "Null";
          }
        default:
          return "Null";
      }
    //Bengali
    case "bengali":
      switch (value1) {
        //Home Page
        case "homepage":
          switch (value2) {
            case "studentmode":
              return bengali.homepage.studentmode;
            case "takeattendance":
              return bengali.homepage.takeattendance;
            case "review":
              return bengali.homepage.review;
            case "managestudent":
              return bengali.homepage.managestudent;
            case "logout":
              return bengali.homepage.logout;
            case "assessment":
              return bengali.homepage.assessment;
            case "loadsampledata":
              return bengali.homepage.loadsampledata;
            case "allocatecontent":
              return bengali.homepage.allocatecontent;
            case "ekal":
              return bengali.homepage.ekal;
            case "synced":
              return bengali.homepage.synced;
            case "notsynced":
              return bengali.homepage.notsynced;
            case "loadeddata":
              return bengali.homepage.loadeddata;
            case "logoutwarning":
              return bengali.homepage.logoutwarning;
            case "yes":
              return bengali.homepage.yes;
            case "no":
              return bengali.homepage.no;
            case "attention":
              return bengali.homepage.attention;
            case "syncdata":
              return bengali.homepage.syncdata;
            default:
              return "Null";
          }
        //Student Mode
        case "studentmode":
          switch (value2) {
            case "studentmode":
              return bengali.studentmode.studentmode;
            case "selectdate":
              return bengali.studentmode.selectdate;
            case "nocontent":
              return bengali.studentmode.nocontent;
            case "selectgat":
              return bengali.studentmode.selectgat;
            case "videoname":
              return bengali.studentmode.videoname;
            case "gat":
              return bengali.studentmode.gat;
            case "subject":
              return bengali.studentmode.subject;
            case "topic":
              return bengali.studentmode.topic;
            case "watch":
              return bengali.studentmode.watch;
            case "nocontentforgat":
              return bengali.studentmode.nocontentforgat;
            case "deletecontent":
              return bengali.studentmode.deletecontent;
            case "deletewarning":
              return bengali.studentmode.deletewarning;
            case "no":
              return bengali.studentmode.no;
            case "yes":
              return bengali.studentmode.yes;
            default:
              return "Null";
          }
        //Manage Students
        case "managestudents":
          switch (value2) {
            case "managestudents":
              return bengali.managestudents.managestudents;
            case "search":
              return bengali.managestudents.search;
            case "notfound":
              return bengali.managestudents.notfound;
            case "addnew":
              return bengali.managestudents.addnew;
            case "age":
              return bengali.managestudents.age;
            case "cancel":
              return bengali.managestudents.cancel;
            case "submit":
              return bengali.managestudents.submit;
            case "name":
              return bengali.managestudents.name;
            case "editstudent":
              return bengali.managestudents.editstudent;
            case "deletestudent":
              return bengali.managestudents.deletestudent;
            case "deletestudentwarning":
              return bengali.managestudents.deletestudentwarning;
            case "delete":
              return bengali.managestudents.delete;
            case "gat":
              return bengali.managestudents.gat;
            case "studentadded":
              return bengali.managestudents.studentadded;
            default:
              return "Null";
          }
        //Allocate Content
        case "allocatecontent":
          switch (value2) {
            case "allocatecontent":
              return bengali.allocatecontent.allocatecontent;
            case "selectgat":
              return bengali.allocatecontent.selectgat;
            case "selecttopic":
              return bengali.allocatecontent.selecttopic;
            case "selectvideos":
              return bengali.allocatecontent.selectvideos;
            case "selectedvideos":
              return bengali.allocatecontent.selectedvideos;
            case "dateofcontent":
              return bengali.allocatecontent.dateofcontent;
            case "selectdate":
              return bengali.allocatecontent.selectdate;
            default:
              return "Null";
          }
        //Take Attendance
        case "takeattendance":
          switch (value2) {
            case "takeattendance":
              return bengali.takeattendance.takeattendance;
            case "date":
              return bengali.takeattendance.date;
            case "dashboard":
              return bengali.takeattendance.dashboard;
            case "selectgat":
              return bengali.takeattendance.selectgat;
            case "save":
              return bengali.takeattendance.save;
            case "attendancenottaken":
              return bengali.takeattendance.attendancenottaken;
            case "selectdate":
              return bengali.takeattendance.selectdate;
            case "nostudent":
              return bengali.takeattendance.nostudent;
            case "holiday":
              return bengali.takeattendance.holiday;
            case "ok":
              return bengali.takeattendance.ok;
            case "cancel":
              return bengali.takeattendance.cancel;
            case "attendancetaken":
              return bengali.takeattendance.attendancetaken;
            case "takenwarning":
              return bengali.takeattendance.takenwarning;
            case "confirmattendance":
              return bengali.takeattendance.confirmattendance;
            case "confirmwarning":
              return bengali.takeattendance.confirmwarning;

            default:
              return "Null";
          }
        //Review
        case "review":
          switch (value2) {
            case "review":
              return bengali.review.review;
            case "selectmonth":
              return bengali.review.selectmonth;
            case "selectgat":
              return bengali.review.selectgat;
            case "attendancereview":
              return bengali.review.attendancereview;
            case "quizreview":
              return bengali.review.quizreview;
            case "videoprog":
              return bengali.review.videoprog;
            case "selectstudent":
              return bengali.review.selectstudent;
            case "nodata":
              return bengali.review.nodata;
            case "noquizgiven":
              return bengali.review.noquizgiven;
            case "videono":
              return bengali.review.videono;
            case "topic":
              return bengali.review.topic;
            case "duration":
              return bengali.review.duration;
            case "progress":
              return bengali.review.progress;
            case "noattendance":
              return bengali.review.noattendance;
            default:
              return "Null";
          }
        //assessment
        case "assessment":
          switch (value2) {
            case "createquiz":
              return bengali.assessment.createquiz;
            case "createqs":
              return bengali.assessment.createqs;
            case "createqzs":
              return bengali.assessment.createqzs;
            case "allqzs":
              return bengali.assessment.allqzs;
            case "giveqz":
              return bengali.assessment.giveqz;
            case "selectgat":
              return bengali.assessment.selectgat;
            case "selecttopic":
              return bengali.assessment.selecttopic;
            case "enterq":
              return bengali.assessment.enterq;
            case "enteroptiona":
              return bengali.assessment.enteroptiona;
            case "enteroptionb":
              return bengali.assessment.enteroptionb;
            case "enteroptionc":
              return bengali.assessment.enteroptionc;
            case "enteroptiond":
              return bengali.assessment.enteroptiond;
            case "choosea":
              return bengali.assessment.choosea;
            case "optiona":
              return bengali.assessment.optiona;
            case "optionb":
              return bengali.assessment.optionb;
            case "optionc":
              return bengali.assessment.optionc;
            case "optiond":
              return bengali.assessment.optiond;
            case "selectqs":
              return bengali.assessment.selectqs;
            case "selectatleastoneq":
              return bengali.assessment.selectatleastoneq;
            case "noqs":
              return bengali.assessment.noqs;
            case "makequizwarning":
              return bengali.assessment.makequizwarning;
            case "selectdate":
              return bengali.assessment.selectdate;
            case "qztime":
              return bengali.assessment.qztime;
            case "cancel":
              return bengali.assessment.cancel;
            case "qzcreated":
              return bengali.assessment.qzcreated;
            case "noqzs":
              return bengali.assessment.noqzs;
            case "selectqz":
              return bengali.assessment.selectqz;
            case "listogqzs":
              return bengali.assessment.listogqzs;
            case "noqzsmade":
              return bengali.assessment.noqzsmade;
            case "gat":
              return bengali.assessment.gat;
            case "date":
              return bengali.assessment.date;
            case "deleteqzs":
              return bengali.assessment.deleteqzs;
            case "deleteqzwarning":
              return bengali.assessment.deleteqzwarning;
            case "ok":
              return bengali.assessment.ok;
            default:
              return "Null";
          }
        default:
          return "Null";
      }
    //Punjabi
    case "punjabi":
      switch (value1) {
        //Home Page
        case "homepage":
          switch (value2) {
            case "studentmode":
              return punjabi.homepage.studentmode;
            case "takeattendance":
              return punjabi.homepage.takeattendance;
            case "review":
              return punjabi.homepage.review;
            case "managestudent":
              return punjabi.homepage.managestudent;
            case "logout":
              return punjabi.homepage.logout;
            case "assessment":
              return punjabi.homepage.assessment;
            case "loadsampledata":
              return punjabi.homepage.loadsampledata;
            case "allocatecontent":
              return punjabi.homepage.allocatecontent;
            case "ekal":
              return punjabi.homepage.ekal;
            case "synced":
              return punjabi.homepage.synced;
            case "notsynced":
              return punjabi.homepage.notsynced;
            case "loadeddata":
              return punjabi.homepage.loadeddata;
            case "logoutwarning":
              return punjabi.homepage.logoutwarning;
            case "yes":
              return punjabi.homepage.yes;
            case "no":
              return punjabi.homepage.no;
            case "attention":
              return punjabi.homepage.attention;
            case "syncdata":
              return punjabi.homepage.syncdata;
            default:
              return "Null";
          }
        //Student Mode
        case "studentmode":
          switch (value2) {
            case "studentmode":
              return punjabi.studentmode.studentmode;
            case "selectdate":
              return punjabi.studentmode.selectdate;
            case "nocontent":
              return punjabi.studentmode.nocontent;
            case "selectgat":
              return punjabi.studentmode.selectgat;
            case "videoname":
              return punjabi.studentmode.videoname;
            case "gat":
              return punjabi.studentmode.gat;
            case "subject":
              return punjabi.studentmode.subject;
            case "topic":
              return punjabi.studentmode.topic;
            case "watch":
              return punjabi.studentmode.watch;
            case "nocontentforgat":
              return punjabi.studentmode.nocontentforgat;
            case "deletecontent":
              return punjabi.studentmode.deletecontent;
            case "deletewarning":
              return punjabi.studentmode.deletewarning;
            case "no":
              return punjabi.studentmode.no;
            case "yes":
              return punjabi.studentmode.yes;
            default:
              return "Null";
          }
        //Manage Students
        case "managestudents":
          switch (value2) {
            case "managestudents":
              return punjabi.managestudents.managestudents;
            case "search":
              return punjabi.managestudents.search;
            case "notfound":
              return punjabi.managestudents.notfound;
            case "addnew":
              return punjabi.managestudents.addnew;
            case "age":
              return punjabi.managestudents.age;
            case "cancel":
              return punjabi.managestudents.cancel;
            case "submit":
              return punjabi.managestudents.submit;
            case "name":
              return punjabi.managestudents.name;
            case "editstudent":
              return punjabi.managestudents.editstudent;
            case "deletestudent":
              return punjabi.managestudents.deletestudent;
            case "deletestudentwarning":
              return punjabi.managestudents.deletestudentwarning;
            case "delete":
              return punjabi.managestudents.delete;
            case "gat":
              return punjabi.managestudents.gat;
            case "studentadded":
              return punjabi.managestudents.studentadded;
            default:
              return "Null";
          }
        //Allocate Content
        case "allocatecontent":
          switch (value2) {
            case "allocatecontent":
              return punjabi.allocatecontent.allocatecontent;
            case "selectgat":
              return punjabi.allocatecontent.selectgat;
            case "selecttopic":
              return punjabi.allocatecontent.selecttopic;
            case "selectvideos":
              return punjabi.allocatecontent.selectvideos;
            case "selectedvideos":
              return punjabi.allocatecontent.selectedvideos;
            case "dateofcontent":
              return punjabi.allocatecontent.dateofcontent;
            case "selectdate":
              return punjabi.allocatecontent.selectdate;
            default:
              return "Null";
          }
        //Take Attendance
        case "takeattendance":
          switch (value2) {
            case "takeattendance":
              return punjabi.takeattendance.takeattendance;
            case "date":
              return punjabi.takeattendance.date;
            case "dashboard":
              return punjabi.takeattendance.dashboard;
            case "selectgat":
              return punjabi.takeattendance.selectgat;
            case "save":
              return punjabi.takeattendance.save;
            case "attendancenottaken":
              return punjabi.takeattendance.attendancenottaken;
            case "selectdate":
              return punjabi.takeattendance.selectdate;
            case "nostudent":
              return punjabi.takeattendance.nostudent;
            case "holiday":
              return punjabi.takeattendance.holiday;
            case "ok":
              return punjabi.takeattendance.ok;
            case "cancel":
              return punjabi.takeattendance.cancel;
            case "attendancetaken":
              return punjabi.takeattendance.attendancetaken;
            case "takenwarning":
              return punjabi.takeattendance.takenwarning;
            case "confirmattendance":
              return punjabi.takeattendance.confirmattendance;
            case "confirmwarning":
              return punjabi.takeattendance.confirmwarning;

            default:
              return "Null";
          }
        //Review
        case "review":
          switch (value2) {
            case "review":
              return punjabi.review.review;
            case "selectmonth":
              return punjabi.review.selectmonth;
            case "selectgat":
              return punjabi.review.selectgat;
            case "attendancereview":
              return punjabi.review.attendancereview;
            case "quizreview":
              return punjabi.review.quizreview;
            case "videoprog":
              return punjabi.review.videoprog;
            case "selectstudent":
              return punjabi.review.selectstudent;
            case "nodata":
              return punjabi.review.nodata;
            case "noquizgiven":
              return punjabi.review.noquizgiven;
            case "videono":
              return punjabi.review.videono;
            case "topic":
              return punjabi.review.topic;
            case "duration":
              return punjabi.review.duration;
            case "progress":
              return punjabi.review.progress;
            case "noattendance":
              return punjabi.review.noattendance;
            default:
              return "Null";
          }
        //assessment
        case "assessment":
          switch (value2) {
            case "createquiz":
              return punjabi.assessment.createquiz;
            case "createqs":
              return punjabi.assessment.createqs;
            case "createqzs":
              return punjabi.assessment.createqzs;
            case "allqzs":
              return punjabi.assessment.allqzs;
            case "giveqz":
              return punjabi.assessment.giveqz;
            case "selectgat":
              return punjabi.assessment.selectgat;
            case "selecttopic":
              return punjabi.assessment.selecttopic;
            case "enterq":
              return punjabi.assessment.enterq;
            case "enteroptiona":
              return punjabi.assessment.enteroptiona;
            case "enteroptionb":
              return punjabi.assessment.enteroptionb;
            case "enteroptionc":
              return punjabi.assessment.enteroptionc;
            case "enteroptiond":
              return punjabi.assessment.enteroptiond;
            case "choosea":
              return punjabi.assessment.choosea;
            case "optiona":
              return punjabi.assessment.optiona;
            case "optionb":
              return punjabi.assessment.optionb;
            case "optionc":
              return punjabi.assessment.optionc;
            case "optiond":
              return punjabi.assessment.optiond;
            case "selectqs":
              return punjabi.assessment.selectqs;
            case "selectatleastoneq":
              return punjabi.assessment.selectatleastoneq;
            case "noqs":
              return punjabi.assessment.noqs;
            case "makequizwarning":
              return punjabi.assessment.makequizwarning;
            case "selectdate":
              return punjabi.assessment.selectdate;
            case "qztime":
              return punjabi.assessment.qztime;
            case "cancel":
              return punjabi.assessment.cancel;
            case "qzcreated":
              return punjabi.assessment.qzcreated;
            case "noqzs":
              return punjabi.assessment.noqzs;
            case "selectqz":
              return punjabi.assessment.selectqz;
            case "listogqzs":
              return punjabi.assessment.listogqzs;
            case "noqzsmade":
              return punjabi.assessment.noqzsmade;
            case "gat":
              return punjabi.assessment.gat;
            case "date":
              return punjabi.assessment.date;
            case "deleteqzs":
              return punjabi.assessment.deleteqzs;
            case "deleteqzwarning":
              return punjabi.assessment.deleteqzwarning;
            case "ok":
              return punjabi.assessment.ok;
            default:
              return "Null";
          }
        default:
          return "Null";
      }
    //Assamese
    case "assamese":
      switch (value1) {
        //Home Page
        case "homepage":
          switch (value2) {
            case "studentmode":
              return assamese.homepage.studentmode;
            case "takeattendance":
              return assamese.homepage.takeattendance;
            case "review":
              return assamese.homepage.review;
            case "managestudent":
              return assamese.homepage.managestudent;
            case "logout":
              return assamese.homepage.logout;
            case "assessment":
              return assamese.homepage.assessment;
            case "loadsampledata":
              return assamese.homepage.loadsampledata;
            case "allocatecontent":
              return assamese.homepage.allocatecontent;
            case "ekal":
              return assamese.homepage.ekal;
            case "synced":
              return assamese.homepage.synced;
            case "notsynced":
              return assamese.homepage.notsynced;
            case "loadeddata":
              return assamese.homepage.loadeddata;
            case "logoutwarning":
              return assamese.homepage.logoutwarning;
            case "yes":
              return assamese.homepage.yes;
            case "no":
              return assamese.homepage.no;
            case "attention":
              return assamese.homepage.attention;
            case "syncdata":
              return assamese.homepage.syncdata;
            default:
              return "Null";
          }
        //Student Mode
        case "studentmode":
          switch (value2) {
            case "studentmode":
              return assamese.studentmode.studentmode;
            case "selectdate":
              return assamese.studentmode.selectdate;
            case "nocontent":
              return assamese.studentmode.nocontent;
            case "selectgat":
              return assamese.studentmode.selectgat;
            case "videoname":
              return assamese.studentmode.videoname;
            case "gat":
              return assamese.studentmode.gat;
            case "subject":
              return assamese.studentmode.subject;
            case "topic":
              return assamese.studentmode.topic;
            case "watch":
              return assamese.studentmode.watch;
            case "nocontentforgat":
              return assamese.studentmode.nocontentforgat;
            case "deletecontent":
              return assamese.studentmode.deletecontent;
            case "deletewarning":
              return assamese.studentmode.deletewarning;
            case "no":
              return assamese.studentmode.no;
            case "yes":
              return assamese.studentmode.yes;
            default:
              return "Null";
          }
        //Manage Students
        case "managestudents":
          switch (value2) {
            case "managestudents":
              return assamese.managestudents.managestudents;
            case "search":
              return assamese.managestudents.search;
            case "notfound":
              return assamese.managestudents.notfound;
            case "addnew":
              return assamese.managestudents.addnew;
            case "age":
              return assamese.managestudents.age;
            case "cancel":
              return assamese.managestudents.cancel;
            case "submit":
              return assamese.managestudents.submit;
            case "name":
              return assamese.managestudents.name;
            case "editstudent":
              return assamese.managestudents.editstudent;
            case "deletestudent":
              return assamese.managestudents.deletestudent;
            case "deletestudentwarning":
              return assamese.managestudents.deletestudentwarning;
            case "delete":
              return assamese.managestudents.delete;
            case "gat":
              return assamese.managestudents.gat;
            case "studentadded":
              return assamese.managestudents.studentadded;
            default:
              return "Null";
          }
        //Allocate Content
        case "allocatecontent":
          switch (value2) {
            case "allocatecontent":
              return assamese.allocatecontent.allocatecontent;
            case "selectgat":
              return assamese.allocatecontent.selectgat;
            case "selecttopic":
              return assamese.allocatecontent.selecttopic;
            case "selectvideos":
              return assamese.allocatecontent.selectvideos;
            case "selectedvideos":
              return assamese.allocatecontent.selectedvideos;
            case "dateofcontent":
              return assamese.allocatecontent.dateofcontent;
            case "selectdate":
              return assamese.allocatecontent.selectdate;
            default:
              return "Null";
          }
        //Take Attendance
        case "takeattendance":
          switch (value2) {
            case "takeattendance":
              return assamese.takeattendance.takeattendance;
            case "date":
              return assamese.takeattendance.date;
            case "dashboard":
              return assamese.takeattendance.dashboard;
            case "selectgat":
              return assamese.takeattendance.selectgat;
            case "save":
              return assamese.takeattendance.save;
            case "attendancenottaken":
              return assamese.takeattendance.attendancenottaken;
            case "selectdate":
              return assamese.takeattendance.selectdate;
            case "nostudent":
              return assamese.takeattendance.nostudent;
            case "holiday":
              return assamese.takeattendance.holiday;
            case "ok":
              return assamese.takeattendance.ok;
            case "cancel":
              return assamese.takeattendance.cancel;
            case "attendancetaken":
              return assamese.takeattendance.attendancetaken;
            case "takenwarning":
              return assamese.takeattendance.takenwarning;
            case "confirmattendance":
              return assamese.takeattendance.confirmattendance;
            case "confirmwarning":
              return assamese.takeattendance.confirmwarning;

            default:
              return "Null";
          }
        //Review
        case "review":
          switch (value2) {
            case "review":
              return assamese.review.review;
            case "selectmonth":
              return assamese.review.selectmonth;
            case "selectgat":
              return assamese.review.selectgat;
            case "attendancereview":
              return assamese.review.attendancereview;
            case "quizreview":
              return assamese.review.quizreview;
            case "videoprog":
              return assamese.review.videoprog;
            case "selectstudent":
              return assamese.review.selectstudent;
            case "nodata":
              return assamese.review.nodata;
            case "noquizgiven":
              return assamese.review.noquizgiven;
            case "videono":
              return assamese.review.videono;
            case "topic":
              return assamese.review.topic;
            case "duration":
              return assamese.review.duration;
            case "progress":
              return assamese.review.progress;
            case "noattendance":
              return assamese.review.noattendance;
            default:
              return "Null";
          }
        //assessment
        case "assessment":
          switch (value2) {
            case "createquiz":
              return assamese.assessment.createquiz;
            case "createqs":
              return assamese.assessment.createqs;
            case "createqzs":
              return assamese.assessment.createqzs;
            case "allqzs":
              return assamese.assessment.allqzs;
            case "giveqz":
              return assamese.assessment.giveqz;
            case "selectgat":
              return assamese.assessment.selectgat;
            case "selecttopic":
              return assamese.assessment.selecttopic;
            case "enterq":
              return assamese.assessment.enterq;
            case "enteroptiona":
              return assamese.assessment.enteroptiona;
            case "enteroptionb":
              return assamese.assessment.enteroptionb;
            case "enteroptionc":
              return assamese.assessment.enteroptionc;
            case "enteroptiond":
              return assamese.assessment.enteroptiond;
            case "choosea":
              return assamese.assessment.choosea;
            case "optiona":
              return assamese.assessment.optiona;
            case "optionb":
              return assamese.assessment.optionb;
            case "optionc":
              return assamese.assessment.optionc;
            case "optiond":
              return assamese.assessment.optiond;
            case "selectqs":
              return assamese.assessment.selectqs;
            case "selectatleastoneq":
              return assamese.assessment.selectatleastoneq;
            case "noqs":
              return assamese.assessment.noqs;
            case "makequizwarning":
              return assamese.assessment.makequizwarning;
            case "selectdate":
              return assamese.assessment.selectdate;
            case "qztime":
              return assamese.assessment.qztime;
            case "cancel":
              return assamese.assessment.cancel;
            case "qzcreated":
              return assamese.assessment.qzcreated;
            case "noqzs":
              return assamese.assessment.noqzs;
            case "selectqz":
              return assamese.assessment.selectqz;
            case "listogqzs":
              return assamese.assessment.listogqzs;
            case "noqzsmade":
              return assamese.assessment.noqzsmade;
            case "gat":
              return assamese.assessment.gat;
            case "date":
              return assamese.assessment.date;
            case "deleteqzs":
              return assamese.assessment.deleteqzs;
            case "deleteqzwarning":
              return assamese.assessment.deleteqzwarning;
            case "ok":
              return assamese.assessment.ok;
            default:
              return "Null";
          }
        default:
          return "Null";
      }
    //Malayalam
    case "malayalam":
      switch (value1) {
        //Home Page
        case "homepage":
          switch (value2) {
            case "studentmode":
              return malayalam.homepage.studentmode;
            case "takeattendance":
              return malayalam.homepage.takeattendance;
            case "review":
              return malayalam.homepage.review;
            case "managestudent":
              return malayalam.homepage.managestudent;
            case "logout":
              return malayalam.homepage.logout;
            case "assessment":
              return malayalam.homepage.assessment;
            case "loadsampledata":
              return malayalam.homepage.loadsampledata;
            case "allocatecontent":
              return malayalam.homepage.allocatecontent;
            case "ekal":
              return malayalam.homepage.ekal;
            case "synced":
              return malayalam.homepage.synced;
            case "notsynced":
              return malayalam.homepage.notsynced;
            case "loadeddata":
              return malayalam.homepage.loadeddata;
            case "logoutwarning":
              return malayalam.homepage.logoutwarning;
            case "yes":
              return malayalam.homepage.yes;
            case "no":
              return malayalam.homepage.no;
            case "attention":
              return malayalam.homepage.attention;
            case "syncdata":
              return malayalam.homepage.syncdata;
            default:
              return "Null";
          }
        //Student Mode
        case "studentmode":
          switch (value2) {
            case "studentmode":
              return malayalam.studentmode.studentmode;
            case "selectdate":
              return malayalam.studentmode.selectdate;
            case "nocontent":
              return malayalam.studentmode.nocontent;
            case "selectgat":
              return malayalam.studentmode.selectgat;
            case "videoname":
              return malayalam.studentmode.videoname;
            case "gat":
              return malayalam.studentmode.gat;
            case "subject":
              return malayalam.studentmode.subject;
            case "topic":
              return malayalam.studentmode.topic;
            case "watch":
              return malayalam.studentmode.watch;
            case "nocontentforgat":
              return malayalam.studentmode.nocontentforgat;
            case "deletecontent":
              return malayalam.studentmode.deletecontent;
            case "deletewarning":
              return malayalam.studentmode.deletewarning;
            case "no":
              return malayalam.studentmode.no;
            case "yes":
              return malayalam.studentmode.yes;
            default:
              return "Null";
          }
        //Manage Students
        case "managestudents":
          switch (value2) {
            case "managestudents":
              return malayalam.managestudents.managestudents;
            case "search":
              return malayalam.managestudents.search;
            case "notfound":
              return malayalam.managestudents.notfound;
            case "addnew":
              return malayalam.managestudents.addnew;
            case "age":
              return malayalam.managestudents.age;
            case "cancel":
              return malayalam.managestudents.cancel;
            case "submit":
              return malayalam.managestudents.submit;
            case "name":
              return malayalam.managestudents.name;
            case "editstudent":
              return malayalam.managestudents.editstudent;
            case "deletestudent":
              return malayalam.managestudents.deletestudent;
            case "deletestudentwarning":
              return malayalam.managestudents.deletestudentwarning;
            case "delete":
              return malayalam.managestudents.delete;
            case "gat":
              return malayalam.managestudents.gat;
            case "studentadded":
              return malayalam.managestudents.studentadded;
            default:
              return "Null";
          }
        //Allocate Content
        case "allocatecontent":
          switch (value2) {
            case "allocatecontent":
              return malayalam.allocatecontent.allocatecontent;
            case "selectgat":
              return malayalam.allocatecontent.selectgat;
            case "selecttopic":
              return malayalam.allocatecontent.selecttopic;
            case "selectvideos":
              return malayalam.allocatecontent.selectvideos;
            case "selectedvideos":
              return malayalam.allocatecontent.selectedvideos;
            case "dateofcontent":
              return malayalam.allocatecontent.dateofcontent;
            case "selectdate":
              return malayalam.allocatecontent.selectdate;
            default:
              return "Null";
          }
        //Take Attendance
        case "takeattendance":
          switch (value2) {
            case "takeattendance":
              return malayalam.takeattendance.takeattendance;
            case "date":
              return malayalam.takeattendance.date;
            case "dashboard":
              return malayalam.takeattendance.dashboard;
            case "selectgat":
              return malayalam.takeattendance.selectgat;
            case "save":
              return malayalam.takeattendance.save;
            case "attendancenottaken":
              return malayalam.takeattendance.attendancenottaken;
            case "selectdate":
              return malayalam.takeattendance.selectdate;
            case "nostudent":
              return malayalam.takeattendance.nostudent;
            case "holiday":
              return malayalam.takeattendance.holiday;
            case "ok":
              return malayalam.takeattendance.ok;
            case "cancel":
              return malayalam.takeattendance.cancel;
            case "attendancetaken":
              return malayalam.takeattendance.attendancetaken;
            case "takenwarning":
              return malayalam.takeattendance.takenwarning;
            case "confirmattendance":
              return malayalam.takeattendance.confirmattendance;
            case "confirmwarning":
              return malayalam.takeattendance.confirmwarning;

            default:
              return "Null";
          }
        //Review
        case "review":
          switch (value2) {
            case "review":
              return malayalam.review.review;
            case "selectmonth":
              return malayalam.review.selectmonth;
            case "selectgat":
              return malayalam.review.selectgat;
            case "attendancereview":
              return malayalam.review.attendancereview;
            case "quizreview":
              return malayalam.review.quizreview;
            case "videoprog":
              return malayalam.review.videoprog;
            case "selectstudent":
              return malayalam.review.selectstudent;
            case "nodata":
              return malayalam.review.nodata;
            case "noquizgiven":
              return malayalam.review.noquizgiven;
            case "videono":
              return malayalam.review.videono;
            case "topic":
              return malayalam.review.topic;
            case "duration":
              return malayalam.review.duration;
            case "progress":
              return malayalam.review.progress;
            case "noattendance":
              return malayalam.review.noattendance;
            default:
              return "Null";
          }
        //assessment
        case "assessment":
          switch (value2) {
            case "createquiz":
              return malayalam.assessment.createquiz;
            case "createqs":
              return malayalam.assessment.createqs;
            case "createqzs":
              return malayalam.assessment.createqzs;
            case "allqzs":
              return malayalam.assessment.allqzs;
            case "giveqz":
              return malayalam.assessment.giveqz;
            case "selectgat":
              return malayalam.assessment.selectgat;
            case "selecttopic":
              return malayalam.assessment.selecttopic;
            case "enterq":
              return malayalam.assessment.enterq;
            case "enteroptiona":
              return malayalam.assessment.enteroptiona;
            case "enteroptionb":
              return malayalam.assessment.enteroptionb;
            case "enteroptionc":
              return malayalam.assessment.enteroptionc;
            case "enteroptiond":
              return malayalam.assessment.enteroptiond;
            case "choosea":
              return malayalam.assessment.choosea;
            case "optiona":
              return malayalam.assessment.optiona;
            case "optionb":
              return malayalam.assessment.optionb;
            case "optionc":
              return malayalam.assessment.optionc;
            case "optiond":
              return malayalam.assessment.optiond;
            case "selectqs":
              return malayalam.assessment.selectqs;
            case "selectatleastoneq":
              return malayalam.assessment.selectatleastoneq;
            case "noqs":
              return malayalam.assessment.noqs;
            case "makequizwarning":
              return malayalam.assessment.makequizwarning;
            case "selectdate":
              return malayalam.assessment.selectdate;
            case "qztime":
              return malayalam.assessment.qztime;
            case "cancel":
              return malayalam.assessment.cancel;
            case "qzcreated":
              return malayalam.assessment.qzcreated;
            case "noqzs":
              return malayalam.assessment.noqzs;
            case "selectqz":
              return malayalam.assessment.selectqz;
            case "listogqzs":
              return malayalam.assessment.listogqzs;
            case "noqzsmade":
              return malayalam.assessment.noqzsmade;
            case "gat":
              return malayalam.assessment.gat;
            case "date":
              return malayalam.assessment.date;
            case "deleteqzs":
              return malayalam.assessment.deleteqzs;
            case "deleteqzwarning":
              return malayalam.assessment.deleteqzwarning;
            case "ok":
              return malayalam.assessment.ok;
            default:
              return "Null";
          }
        default:
          return "Null";
      }
    //Odia
    case "odia":
      switch (value1) {
        //Home Page
        case "homepage":
          switch (value2) {
            case "studentmode":
              return odia.homepage.studentmode;
            case "takeattendance":
              return odia.homepage.takeattendance;
            case "review":
              return odia.homepage.review;
            case "managestudent":
              return odia.homepage.managestudent;
            case "logout":
              return odia.homepage.logout;
            case "assessment":
              return odia.homepage.assessment;
            case "loadsampledata":
              return odia.homepage.loadsampledata;
            case "allocatecontent":
              return odia.homepage.allocatecontent;
            case "ekal":
              return odia.homepage.ekal;
            case "synced":
              return odia.homepage.synced;
            case "notsynced":
              return odia.homepage.notsynced;
            case "loadeddata":
              return odia.homepage.loadeddata;
            case "logoutwarning":
              return odia.homepage.logoutwarning;
            case "yes":
              return odia.homepage.yes;
            case "no":
              return odia.homepage.no;
            case "attention":
              return odia.homepage.attention;
            case "syncdata":
              return odia.homepage.syncdata;
            default:
              return "Null";
          }
        //Student Mode
        case "studentmode":
          switch (value2) {
            case "studentmode":
              return odia.studentmode.studentmode;
            case "selectdate":
              return odia.studentmode.selectdate;
            case "nocontent":
              return odia.studentmode.nocontent;
            case "selectgat":
              return odia.studentmode.selectgat;
            case "videoname":
              return odia.studentmode.videoname;
            case "gat":
              return odia.studentmode.gat;
            case "subject":
              return odia.studentmode.subject;
            case "topic":
              return odia.studentmode.topic;
            case "watch":
              return odia.studentmode.watch;
            case "nocontentforgat":
              return odia.studentmode.nocontentforgat;
            case "deletecontent":
              return odia.studentmode.deletecontent;
            case "deletewarning":
              return odia.studentmode.deletewarning;
            case "no":
              return odia.studentmode.no;
            case "yes":
              return odia.studentmode.yes;
            default:
              return "Null";
          }
        //Manage Students
        case "managestudents":
          switch (value2) {
            case "managestudents":
              return odia.managestudents.managestudents;
            case "search":
              return odia.managestudents.search;
            case "notfound":
              return odia.managestudents.notfound;
            case "addnew":
              return odia.managestudents.addnew;
            case "age":
              return odia.managestudents.age;
            case "cancel":
              return odia.managestudents.cancel;
            case "submit":
              return odia.managestudents.submit;
            case "name":
              return odia.managestudents.name;
            case "editstudent":
              return odia.managestudents.editstudent;
            case "deletestudent":
              return odia.managestudents.deletestudent;
            case "deletestudentwarning":
              return odia.managestudents.deletestudentwarning;
            case "delete":
              return odia.managestudents.delete;
            case "gat":
              return odia.managestudents.gat;
            case "studentadded":
              return odia.managestudents.studentadded;
            default:
              return "Null";
          }
        //Allocate Content
        case "allocatecontent":
          switch (value2) {
            case "allocatecontent":
              return odia.allocatecontent.allocatecontent;
            case "selectgat":
              return odia.allocatecontent.selectgat;
            case "selecttopic":
              return odia.allocatecontent.selecttopic;
            case "selectvideos":
              return odia.allocatecontent.selectvideos;
            case "selectedvideos":
              return odia.allocatecontent.selectedvideos;
            case "dateofcontent":
              return odia.allocatecontent.dateofcontent;
            case "selectdate":
              return odia.allocatecontent.selectdate;
            default:
              return "Null";
          }
        //Take Attendance
        case "takeattendance":
          switch (value2) {
            case "takeattendance":
              return odia.takeattendance.takeattendance;
            case "date":
              return odia.takeattendance.date;
            case "dashboard":
              return odia.takeattendance.dashboard;
            case "selectgat":
              return odia.takeattendance.selectgat;
            case "save":
              return odia.takeattendance.save;
            case "attendancenottaken":
              return odia.takeattendance.attendancenottaken;
            case "selectdate":
              return odia.takeattendance.selectdate;
            case "nostudent":
              return odia.takeattendance.nostudent;
            case "holiday":
              return odia.takeattendance.holiday;
            case "ok":
              return odia.takeattendance.ok;
            case "cancel":
              return odia.takeattendance.cancel;
            case "attendancetaken":
              return odia.takeattendance.attendancetaken;
            case "takenwarning":
              return odia.takeattendance.takenwarning;
            case "confirmattendance":
              return odia.takeattendance.confirmattendance;
            case "confirmwarning":
              return odia.takeattendance.confirmwarning;

            default:
              return "Null";
          }
        //Review
        case "review":
          switch (value2) {
            case "review":
              return odia.review.review;
            case "selectmonth":
              return odia.review.selectmonth;
            case "selectgat":
              return odia.review.selectgat;
            case "attendancereview":
              return odia.review.attendancereview;
            case "quizreview":
              return odia.review.quizreview;
            case "videoprog":
              return odia.review.videoprog;
            case "selectstudent":
              return odia.review.selectstudent;
            case "nodata":
              return odia.review.nodata;
            case "noquizgiven":
              return odia.review.noquizgiven;
            case "videono":
              return odia.review.videono;
            case "topic":
              return odia.review.topic;
            case "duration":
              return odia.review.duration;
            case "progress":
              return odia.review.progress;
            case "noattendance":
              return odia.review.noattendance;
            default:
              return "Null";
          }
        //assessment
        case "assessment":
          switch (value2) {
            case "createquiz":
              return odia.assessment.createquiz;
            case "createqs":
              return odia.assessment.createqs;
            case "createqzs":
              return odia.assessment.createqzs;
            case "allqzs":
              return odia.assessment.allqzs;
            case "giveqz":
              return odia.assessment.giveqz;
            case "selectgat":
              return odia.assessment.selectgat;
            case "selecttopic":
              return odia.assessment.selecttopic;
            case "enterq":
              return odia.assessment.enterq;
            case "enteroptiona":
              return odia.assessment.enteroptiona;
            case "enteroptionb":
              return odia.assessment.enteroptionb;
            case "enteroptionc":
              return odia.assessment.enteroptionc;
            case "enteroptiond":
              return odia.assessment.enteroptiond;
            case "choosea":
              return odia.assessment.choosea;
            case "optiona":
              return odia.assessment.optiona;
            case "optionb":
              return odia.assessment.optionb;
            case "optionc":
              return odia.assessment.optionc;
            case "optiond":
              return odia.assessment.optiond;
            case "selectqs":
              return odia.assessment.selectqs;
            case "selectatleastoneq":
              return odia.assessment.selectatleastoneq;
            case "noqs":
              return odia.assessment.noqs;
            case "makequizwarning":
              return odia.assessment.makequizwarning;
            case "selectdate":
              return odia.assessment.selectdate;
            case "qztime":
              return odia.assessment.qztime;
            case "cancel":
              return odia.assessment.cancel;
            case "qzcreated":
              return odia.assessment.qzcreated;
            case "noqzs":
              return odia.assessment.noqzs;
            case "selectqz":
              return odia.assessment.selectqz;
            case "listogqzs":
              return odia.assessment.listogqzs;
            case "noqzsmade":
              return odia.assessment.noqzsmade;
            case "gat":
              return odia.assessment.gat;
            case "date":
              return odia.assessment.date;
            case "deleteqzs":
              return odia.assessment.deleteqzs;
            case "deleteqzwarning":
              return odia.assessment.deleteqzwarning;
            case "ok":
              return odia.assessment.ok;
            default:
              return "Null";
          }
        default:
          return "Null";
      }
    //Urdu
    case "urdu":
      switch (value1) {
        //Home Page
        case "homepage":
          switch (value2) {
            case "studentmode":
              return urdu.homepage.studentmode;
            case "takeattendance":
              return urdu.homepage.takeattendance;
            case "review":
              return urdu.homepage.review;
            case "managestudent":
              return urdu.homepage.managestudent;
            case "logout":
              return urdu.homepage.logout;
            case "assessment":
              return urdu.homepage.assessment;
            case "loadsampledata":
              return urdu.homepage.loadsampledata;
            case "allocatecontent":
              return urdu.homepage.allocatecontent;
            case "ekal":
              return urdu.homepage.ekal;
            case "synced":
              return urdu.homepage.synced;
            case "notsynced":
              return urdu.homepage.notsynced;
            case "loadeddata":
              return urdu.homepage.loadeddata;
            case "logoutwarning":
              return urdu.homepage.logoutwarning;
            case "yes":
              return urdu.homepage.yes;
            case "no":
              return urdu.homepage.no;
            case "attention":
              return urdu.homepage.attention;
            case "syncdata":
              return urdu.homepage.syncdata;
            default:
              return "Null";
          }
        //Student Mode
        case "studentmode":
          switch (value2) {
            case "studentmode":
              return urdu.studentmode.studentmode;
            case "selectdate":
              return urdu.studentmode.selectdate;
            case "nocontent":
              return urdu.studentmode.nocontent;
            case "selectgat":
              return urdu.studentmode.selectgat;
            case "videoname":
              return urdu.studentmode.videoname;
            case "gat":
              return urdu.studentmode.gat;
            case "subject":
              return urdu.studentmode.subject;
            case "topic":
              return urdu.studentmode.topic;
            case "watch":
              return urdu.studentmode.watch;
            case "nocontentforgat":
              return urdu.studentmode.nocontentforgat;
            case "deletecontent":
              return urdu.studentmode.deletecontent;
            case "deletewarning":
              return urdu.studentmode.deletewarning;
            case "no":
              return urdu.studentmode.no;
            case "yes":
              return urdu.studentmode.yes;
            default:
              return "Null";
          }
        //Manage Students
        case "managestudents":
          switch (value2) {
            case "managestudents":
              return urdu.managestudents.managestudents;
            case "search":
              return urdu.managestudents.search;
            case "notfound":
              return urdu.managestudents.notfound;
            case "addnew":
              return urdu.managestudents.addnew;
            case "age":
              return urdu.managestudents.age;
            case "cancel":
              return urdu.managestudents.cancel;
            case "submit":
              return urdu.managestudents.submit;
            case "name":
              return urdu.managestudents.name;
            case "editstudent":
              return urdu.managestudents.editstudent;
            case "deletestudent":
              return urdu.managestudents.deletestudent;
            case "deletestudentwarning":
              return urdu.managestudents.deletestudentwarning;
            case "delete":
              return urdu.managestudents.delete;
            case "gat":
              return urdu.managestudents.gat;
            case "studentadded":
              return urdu.managestudents.studentadded;
            default:
              return "Null";
          }
        //Allocate Content
        case "allocatecontent":
          switch (value2) {
            case "allocatecontent":
              return urdu.allocatecontent.allocatecontent;
            case "selectgat":
              return urdu.allocatecontent.selectgat;
            case "selecttopic":
              return urdu.allocatecontent.selecttopic;
            case "selectvideos":
              return urdu.allocatecontent.selectvideos;
            case "selectedvideos":
              return urdu.allocatecontent.selectedvideos;
            case "dateofcontent":
              return urdu.allocatecontent.dateofcontent;
            case "selectdate":
              return urdu.allocatecontent.selectdate;
            default:
              return "Null";
          }
        //Take Attendance
        case "takeattendance":
          switch (value2) {
            case "takeattendance":
              return urdu.takeattendance.takeattendance;
            case "date":
              return urdu.takeattendance.date;
            case "dashboard":
              return urdu.takeattendance.dashboard;
            case "selectgat":
              return urdu.takeattendance.selectgat;
            case "save":
              return urdu.takeattendance.save;
            case "attendancenottaken":
              return urdu.takeattendance.attendancenottaken;
            case "selectdate":
              return urdu.takeattendance.selectdate;
            case "nostudent":
              return urdu.takeattendance.nostudent;
            case "holiday":
              return urdu.takeattendance.holiday;
            case "ok":
              return urdu.takeattendance.ok;
            case "cancel":
              return urdu.takeattendance.cancel;
            case "attendancetaken":
              return urdu.takeattendance.attendancetaken;
            case "takenwarning":
              return urdu.takeattendance.takenwarning;
            case "confirmattendance":
              return urdu.takeattendance.confirmattendance;
            case "confirmwarning":
              return urdu.takeattendance.confirmwarning;

            default:
              return "Null";
          }
        //Review
        case "review":
          switch (value2) {
            case "review":
              return urdu.review.review;
            case "selectmonth":
              return urdu.review.selectmonth;
            case "selectgat":
              return urdu.review.selectgat;
            case "attendancereview":
              return urdu.review.attendancereview;
            case "quizreview":
              return urdu.review.quizreview;
            case "videoprog":
              return urdu.review.videoprog;
            case "selectstudent":
              return urdu.review.selectstudent;
            case "nodata":
              return urdu.review.nodata;
            case "noquizgiven":
              return urdu.review.noquizgiven;
            case "videono":
              return urdu.review.videono;
            case "topic":
              return urdu.review.topic;
            case "duration":
              return urdu.review.duration;
            case "progress":
              return urdu.review.progress;
            case "noattendance":
              return urdu.review.noattendance;
            default:
              return "Null";
          }
        //assessment
        case "assessment":
          switch (value2) {
            case "createquiz":
              return urdu.assessment.createquiz;
            case "createqs":
              return urdu.assessment.createqs;
            case "createqzs":
              return urdu.assessment.createqzs;
            case "allqzs":
              return urdu.assessment.allqzs;
            case "giveqz":
              return urdu.assessment.giveqz;
            case "selectgat":
              return urdu.assessment.selectgat;
            case "selecttopic":
              return urdu.assessment.selecttopic;
            case "enterq":
              return urdu.assessment.enterq;
            case "enteroptiona":
              return urdu.assessment.enteroptiona;
            case "enteroptionb":
              return urdu.assessment.enteroptionb;
            case "enteroptionc":
              return urdu.assessment.enteroptionc;
            case "enteroptiond":
              return urdu.assessment.enteroptiond;
            case "choosea":
              return urdu.assessment.choosea;
            case "optiona":
              return urdu.assessment.optiona;
            case "optionb":
              return urdu.assessment.optionb;
            case "optionc":
              return urdu.assessment.optionc;
            case "optiond":
              return urdu.assessment.optiond;
            case "selectqs":
              return urdu.assessment.selectqs;
            case "selectatleastoneq":
              return urdu.assessment.selectatleastoneq;
            case "noqs":
              return urdu.assessment.noqs;
            case "makequizwarning":
              return urdu.assessment.makequizwarning;
            case "selectdate":
              return urdu.assessment.selectdate;
            case "qztime":
              return urdu.assessment.qztime;
            case "cancel":
              return urdu.assessment.cancel;
            case "qzcreated":
              return urdu.assessment.qzcreated;
            case "noqzs":
              return urdu.assessment.noqzs;
            case "selectqz":
              return urdu.assessment.selectqz;
            case "listogqzs":
              return urdu.assessment.listogqzs;
            case "noqzsmade":
              return urdu.assessment.noqzsmade;
            case "gat":
              return urdu.assessment.gat;
            case "date":
              return urdu.assessment.date;
            case "deleteqzs":
              return urdu.assessment.deleteqzs;
            case "deleteqzwarning":
              return urdu.assessment.deleteqzwarning;
            case "ok":
              return urdu.assessment.ok;
            default:
              return "Null";
          }
        default:
          return "Null";
      }
    //Marathi
    case "marathi":
      switch (value1) {
        //Home Page
        case "homepage":
          switch (value2) {
            case "studentmode":
              return marathi.homepage.studentmode;
            case "takeattendance":
              return marathi.homepage.takeattendance;
            case "review":
              return marathi.homepage.review;
            case "managestudent":
              return marathi.homepage.managestudent;
            case "logout":
              return marathi.homepage.logout;
            case "assessment":
              return marathi.homepage.assessment;
            case "loadsampledata":
              return marathi.homepage.loadsampledata;
            case "allocatecontent":
              return marathi.homepage.allocatecontent;
            case "ekal":
              return marathi.homepage.ekal;
            case "synced":
              return marathi.homepage.synced;
            case "notsynced":
              return marathi.homepage.notsynced;
            case "loadeddata":
              return marathi.homepage.loadeddata;
            case "logoutwarning":
              return marathi.homepage.logoutwarning;
            case "yes":
              return marathi.homepage.yes;
            case "no":
              return marathi.homepage.no;
            case "attention":
              return marathi.homepage.attention;
            case "syncdata":
              return marathi.homepage.syncdata;
            default:
              return "Null";
          }
        //Student Mode
        case "studentmode":
          switch (value2) {
            case "studentmode":
              return marathi.studentmode.studentmode;
            case "selectdate":
              return marathi.studentmode.selectdate;
            case "nocontent":
              return marathi.studentmode.nocontent;
            case "selectgat":
              return marathi.studentmode.selectgat;
            case "videoname":
              return marathi.studentmode.videoname;
            case "gat":
              return marathi.studentmode.gat;
            case "subject":
              return marathi.studentmode.subject;
            case "topic":
              return marathi.studentmode.topic;
            case "watch":
              return marathi.studentmode.watch;
            case "nocontentforgat":
              return marathi.studentmode.nocontentforgat;
            case "deletecontent":
              return marathi.studentmode.deletecontent;
            case "deletewarning":
              return marathi.studentmode.deletewarning;
            case "no":
              return marathi.studentmode.no;
            case "yes":
              return marathi.studentmode.yes;
            default:
              return "Null";
          }
        //Manage Students
        case "managestudents":
          switch (value2) {
            case "managestudents":
              return marathi.managestudents.managestudents;
            case "search":
              return marathi.managestudents.search;
            case "notfound":
              return marathi.managestudents.notfound;
            case "addnew":
              return marathi.managestudents.addnew;
            case "age":
              return marathi.managestudents.age;
            case "cancel":
              return marathi.managestudents.cancel;
            case "submit":
              return marathi.managestudents.submit;
            case "name":
              return marathi.managestudents.name;
            case "editstudent":
              return marathi.managestudents.editstudent;
            case "deletestudent":
              return marathi.managestudents.deletestudent;
            case "deletestudentwarning":
              return marathi.managestudents.deletestudentwarning;
            case "delete":
              return marathi.managestudents.delete;
            case "gat":
              return marathi.managestudents.gat;
            case "studentadded":
              return marathi.managestudents.studentadded;
            default:
              return "Null";
          }
        //Allocate Content
        case "allocatecontent":
          switch (value2) {
            case "allocatecontent":
              return marathi.allocatecontent.allocatecontent;
            case "selectgat":
              return marathi.allocatecontent.selectgat;
            case "selecttopic":
              return marathi.allocatecontent.selecttopic;
            case "selectvideos":
              return marathi.allocatecontent.selectvideos;
            case "selectedvideos":
              return marathi.allocatecontent.selectedvideos;
            case "dateofcontent":
              return marathi.allocatecontent.dateofcontent;
            case "selectdate":
              return marathi.allocatecontent.selectdate;
            default:
              return "Null";
          }
        //Take Attendance
        case "takeattendance":
          switch (value2) {
            case "takeattendance":
              return marathi.takeattendance.takeattendance;
            case "date":
              return marathi.takeattendance.date;
            case "dashboard":
              return marathi.takeattendance.dashboard;
            case "selectgat":
              return marathi.takeattendance.selectgat;
            case "save":
              return marathi.takeattendance.save;
            case "attendancenottaken":
              return marathi.takeattendance.attendancenottaken;
            case "selectdate":
              return marathi.takeattendance.selectdate;
            case "nostudent":
              return marathi.takeattendance.nostudent;
            case "holiday":
              return marathi.takeattendance.holiday;
            case "ok":
              return marathi.takeattendance.ok;
            case "cancel":
              return marathi.takeattendance.cancel;
            case "attendancetaken":
              return marathi.takeattendance.attendancetaken;
            case "takenwarning":
              return marathi.takeattendance.takenwarning;
            case "confirmattendance":
              return marathi.takeattendance.confirmattendance;
            case "confirmwarning":
              return marathi.takeattendance.confirmwarning;

            default:
              return "Null";
          }
        //Review
        case "review":
          switch (value2) {
            case "review":
              return marathi.review.review;
            case "selectmonth":
              return marathi.review.selectmonth;
            case "selectgat":
              return marathi.review.selectgat;
            case "attendancereview":
              return marathi.review.attendancereview;
            case "quizreview":
              return marathi.review.quizreview;
            case "videoprog":
              return marathi.review.videoprog;
            case "selectstudent":
              return marathi.review.selectstudent;
            case "nodata":
              return marathi.review.nodata;
            case "noquizgiven":
              return marathi.review.noquizgiven;
            case "videono":
              return marathi.review.videono;
            case "topic":
              return marathi.review.topic;
            case "duration":
              return marathi.review.duration;
            case "progress":
              return marathi.review.progress;
            case "noattendance":
              return marathi.review.noattendance;
            default:
              return "Null";
          }
        //assessment
        case "assessment":
          switch (value2) {
            case "createquiz":
              return marathi.assessment.createquiz;
            case "createqs":
              return marathi.assessment.createqs;
            case "createqzs":
              return marathi.assessment.createqzs;
            case "allqzs":
              return marathi.assessment.allqzs;
            case "giveqz":
              return marathi.assessment.giveqz;
            case "selectgat":
              return marathi.assessment.selectgat;
            case "selecttopic":
              return marathi.assessment.selecttopic;
            case "enterq":
              return marathi.assessment.enterq;
            case "enteroptiona":
              return marathi.assessment.enteroptiona;
            case "enteroptionb":
              return marathi.assessment.enteroptionb;
            case "enteroptionc":
              return marathi.assessment.enteroptionc;
            case "enteroptiond":
              return marathi.assessment.enteroptiond;
            case "choosea":
              return marathi.assessment.choosea;
            case "optiona":
              return marathi.assessment.optiona;
            case "optionb":
              return marathi.assessment.optionb;
            case "optionc":
              return marathi.assessment.optionc;
            case "optiond":
              return marathi.assessment.optiond;
            case "selectqs":
              return marathi.assessment.selectqs;
            case "selectatleastoneq":
              return marathi.assessment.selectatleastoneq;
            case "noqs":
              return marathi.assessment.noqs;
            case "makequizwarning":
              return marathi.assessment.makequizwarning;
            case "selectdate":
              return marathi.assessment.selectdate;
            case "qztime":
              return marathi.assessment.qztime;
            case "cancel":
              return marathi.assessment.cancel;
            case "qzcreated":
              return marathi.assessment.qzcreated;
            case "noqzs":
              return marathi.assessment.noqzs;
            case "selectqz":
              return marathi.assessment.selectqz;
            case "listogqzs":
              return marathi.assessment.listogqzs;
            case "noqzsmade":
              return marathi.assessment.noqzsmade;
            case "gat":
              return marathi.assessment.gat;
            case "date":
              return marathi.assessment.date;
            case "deleteqzs":
              return marathi.assessment.deleteqzs;
            case "deleteqzwarning":
              return marathi.assessment.deleteqzwarning;
            case "ok":
              return marathi.assessment.ok;
            default:
              return "Null";
          }
        default:
          return "Null";
      }
    default:
      return "Null";
  }
}
