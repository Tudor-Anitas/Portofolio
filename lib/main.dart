import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portofolio/colors.dart';
import 'package:portofolio/database.dart';
import 'package:portofolio/screens/desktop_body.dart';
import 'package:portofolio/screens/mobile_body.dart';
import 'package:portofolio/responsive_layout.dart';
import 'package:portofolio/screens/tablet_body.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tudor Anițaș',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
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
