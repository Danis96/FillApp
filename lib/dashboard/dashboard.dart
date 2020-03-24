/// Dashboard class
///
/// This class contains methods and layout for dashboard page.
///
/// Imports:
///   MyColor constant class with all colors
///   Cloud_firestore for connection to the firebase
///   ScreenUtil class for respnsive desing
///   QuestionSkelet model class for questions.
///   All cards
///   Routes
///   Database connections
///
/// Authors: Sena Cikic, Danis Preldzic, Adi Cengic, Jusuf Elfarahati
/// Tech387 - T2
/// Feb, 2020
import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillproject/components/constants/myText.dart';
import 'package:fillproject/components/customScroll.dart';
import 'package:fillproject/components/emptyCont.dart';
import 'package:fillproject/components/myAlertDialog.dart';
import 'package:fillproject/components/myCardMCQ.dart';
import 'package:fillproject/components/myCardYesNo.dart';
import 'package:fillproject/components/myCashBalance.dart';
import 'package:fillproject/components/mySAR.dart';
import 'package:fillproject/firebaseMethods/firebaseCheck.dart';
import 'package:fillproject/globals.dart';
import 'package:fillproject/models/FlashQuestion/questionModel.dart';
import 'package:fillproject/routes/routeArguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardPage extends StatefulWidget {
  final PasswordArguments arguments;
  DashboardPage({
    Key key,
    this.arguments,
  }) : super(key: key);

  @override
  _DashboardPageState createState() =>
      _DashboardPageState(arguments: arguments);
}

class _DashboardPageState extends State<DashboardPage>
    with TickerProviderStateMixin {
  final PasswordArguments arguments;
  _DashboardPageState({this.arguments});

  /// Animation Controller for Flash Questionss
  AnimationController animationController;

  bool visible = false, isEmptyCard = false, isLoggedIn = false, isSar = false;
  DocumentSnapshot snap, doc;
  int counter = 0, userSar = 0, sar, target, userLevel;
  String question, type, username, id, usernameSecond;
  List<dynamic> choices;
  List<dynamic> snapi = [];
  List<dynamic> usernameThatAnswers;
  ValueKey key;

  /// Scroll physics
  ///
  /// custom physics and controller specified for out needs
  /// listview controller & physics that behaves like pageview
  ScrollController _controller = new ScrollController();
  ScrollPhysics _physics;
  var dimension = 361.7809523809524;

  @override
  void initState() {
    super.initState();
    addPhysicsListenerController();
    visible = false;
    Timer(Duration(milliseconds: 500), () {
      setState(() {});
    });
    /// Animation controller instance 
    /// 
    /// vsync - frame ticking & duration
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
      onWillPop: _onWillPop,
      child: Center(
        child: ListView(
          children: <Widget>[
            /// [getUserUsername]
            ///
            /// future function that executes first and get all User's info
            FutureBuilder(
              future: FirebaseCheck().getUserUsername(arguments.username),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        snap = snapshot.data[index];
                        userSar = snap.data['sar'];
                        if (counter == 0) {
                          saroviOffline = userSar;
                          counter = 1;
                        }
                        id = snap.data['user_id'];
                        userLevel = snap.data['level'];
                        username = snap.data['username'];
                        usernameSecond = snap.data['username_second'];
                        return EmptyContainer();
                      });
                }
                return EmptyContainer();
              },
            ),
            MyCashBalance(text: MyText().sarText),

            /// [MySar] widget
            ///
            /// shows you your cash balance
            MySAR(
                text: isSar
                    ? saroviOffline.toString() + '\nSAR'
                    : '$userSar\nSAR'),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    height: ScreenUtil.instance.setHeight(430.0),
                    child: FutureBuilder(
                      /// [getQuestions]
                      ///
                      /// future function that executes 500 miliseconds after
                      /// [getUserUsername] function, & recieve [userLevel] ,
                      /// variable that we get from future function above
                      future: Future.delayed(Duration(milliseconds: 500)).then(
                          (value) => FirebaseCheck().getQuestions(userLevel)),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          /// punjenje lokalnog niza
                          ///
                          /// nakon sto se jednom napuni nepuni se vise
                          /// visible se seta na true
                          if (!visible) {
                            snapi = snapshot.data
                                .map((doc) => Question.fromDocument(doc))
                                .toList();
                            visible = !visible;
                          }

                          return AnimatedList(
                            key: listKey,
                            controller: _controller,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: _physics,
                            initialItemCount: snapi.length,
                            itemBuilder: (BuildContext context, int index,
                                Animation animation) {
                              doc = snapshot.data[index];
                              choices = snapi[index].choices;
                              key = snapi[index].key;
                              sar = snapi[index].sar;
                              question = snapi[index].title;
                              type = snapi[index].type;
                              target = snapi[index].target;
                              usernameThatAnswers =
                                  snapi[index].listOfUsernamesThatGaveAnswers;

                              var begin = Offset(1.0, 0.0);
                              var end = Offset.zero;
                              var curve = Curves.easeIn;
                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));

                              /// conditions which must be satisfied
                              /// after them show flash cards with questions
                              if (snapi[index].title != '') {
                                if (usernameThatAnswers.contains(username) ==
                                        false &&
                                    usernameThatAnswers
                                            .contains(usernameSecond) ==
                                        false &&
                                    target > usernameThatAnswers.length) {
                                  return type == 'checkbox'
                                      ? SlideTransition(
                                            position: animationController.drive(tween),
                                          child: MyCardMCQ(
                                            key: key,
                                            sar: sar,
                                            isSar: isSar,
                                            usersSar: userSar,
                                            question: question,
                                            choices: choices,
                                            snapi: snapi,
                                            snap: snap,
                                            index: index,
                                            notifyParent: refresh,
                                            target: target,
                                            doc: doc,
                                            username: username,
                                          ),
                                        )
                                      : SlideTransition(
                                          position: animationController.drive(tween),
                                          child: MyCardYesNo(
                                              key: key,
                                              sar: sar,
                                              isSar: isSar,
                                              usersSar: userSar,
                                              snap: snap,
                                              question: question,
                                              snapi: snapi,
                                              index: index,
                                              notifyParent: refresh,
                                              target: target,
                                              doc: doc,
                                              username: username),
                                        );
                                } else {
                                  return EmptyContainer();
                                }
                              } else {
                                return EmptyContainer();
                              }
                            },
                          );
                        }

                        /// Indicator that appears while questions are loading
                        return CircularProgressIndicator();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  exitApp() {
    exit(0);
  }

  /// [_onWillPop]
  ///
  /// async funstion that creates an exit dialog for our screen
  /// YES / NO
  Future<bool> _onWillPop() async {
    return showDialog(
          context: context,
          builder: (context) => MyAlertDialog(
              title: MyText().willQuestion,
              content: MyText().willQuestion1,
              yes: MyText().willYes,
              no: MyText().willNo,
              notifyParent: exitApp),
        ) ??
        true;
  }

  /// [checkForInternet]
  ///
  /// function that checks for internet connection
  checkForInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isSar = false;
      }
    } on SocketException catch (_) {
      isSar = true;
    }
  }

  /// [addPhysicsListenerController]
  ///
  /// function that creates a listener for out scroll controller
  /// and checks for controller position
  /// then add physics that recieve dimension
  /// [dimension] =  361.7809523809524;
  addPhysicsListenerController() {
    _controller.addListener(() {
      if (_controller.position.haveDimensions && _physics == null) {
        setState(() {
          _physics = CustomScrollPhysics(
            itemDimension: ScreenUtil.instance.setWidth(dimension),
          );
        });
      }
    });
  }

  /// [refresh]
  ///
  /// this is parent function that gets invoked when
  /// changes occured in children of this dashboard widget.
  /// It refresh the state and call [checkForInternet] function
  refresh() {
    /// reset animation
    animationController.reset();
    setState(() {});
    Timer(Duration(milliseconds: 500), () {
      setState(() {});
    });
    /// animation forward
    animationController.forward();
    checkForInternet();
  }
}
