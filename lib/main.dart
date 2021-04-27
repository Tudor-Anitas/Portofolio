import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portofolio/colors.dart';
import 'package:portofolio/database.dart';
import 'package:portofolio/screens/desktop_body.dart';
import 'package:portofolio/screens/mobile_body.dart';
import 'package:portofolio/responsive_layout.dart';
import 'package:portofolio/screens/tablet_body.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print(snapshot.error);
          return SomethingWentWrong();
        }
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          print(snapshot.connectionState);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Tudor Anițaș',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: MyHomePage(),
          );
        }
        print('in the initialization');
        // Otherwise, show something whilst waiting for initialization to complete
        return Loading();
      },
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();

    DatabaseService().addVisitor();
  }

  @override
  Widget build(BuildContext context) {

    setState(() {});
    return Scaffold(
      backgroundColor: kJET,
      body: ResponsiveLayout(
        mobileBody: MobileBody(),
        tabletBody: TabletBody(),
        desktopBody: DesktopBody(),
      ),
    );
  }
}

class SomethingWentWrong extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Text('Something went wrong, try again!', style: GoogleFonts.raleway(fontSize: 64, color: Colors.white),),);
  }
}
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

