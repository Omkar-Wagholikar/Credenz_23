// ignore_for_file: prefer_const_constructors

import 'package:credenz_23/screens/Other%20Pages/Developers_Page/homeScreen.dart';
// import 'package:credenz_23/screens/Main%20Screens/MainScreen/test.dart';

import 'package:credenz_23/screens/Other%20Pages/PING_Page/ping.dart';
import 'package:credenz_23/screens/Other%20Pages/Schedule_Page/views/ScrollViewSchedule.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../../Other Pages/About_Us_Page/aboutus_withgm.dart';
import '../../Other Pages/Contact_Us/contact_us.dart';
import '../../Other Pages/Privacy_Policy/privacy_policy.dart';
import '../MainScreen/Views/PanoBNav.dart';

class Drawer extends StatelessWidget {
  const Drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Zoom Drawer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DrawerScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/pingpage.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 260,
                  child: DrawerHeader(
                    child: Center(
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              height: 30,
                              width: MediaQuery.of(context).size.width * 1,
                              color: Colors.black26,
                              child: const Center(
                                child: Text(
                                  "Credenz 2023",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Icon(
                            Icons.account_circle_rounded,
                            size: 50,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Name Of the User'),
                          Text('Email Of the User'),
                          Text("Phone Number"),
                          SizedBox(
                            height: 5,
                          ),
                          Divider(
                            height: 6,
                            color: Colors.black,
                            thickness: 6,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.book,
                  ),
                  title: Text("PISB"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutUGM()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.book,
                  ),
                  title: Text("PING"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PingPage()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.book,
                  ),
                  title: Text("Sponsers"),
                ),
                Divider(
                  thickness: 2,
                  color: Colors.white24,
                ),
                ListTile(
                  leading: Icon(
                    Icons.book,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ScheduleScreen()),
                    );
                  },
                  title: Text("All Events"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.book,
                  ),
                  title: Text("Contact Us"),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => ContactUs(),
                      ),
                    );
                  },
                ),
                Divider(
                  thickness: 2,
                  color: Colors.white24,
                ),
                ListTile(
                  leading: Icon(
                    Icons.developer_board,
                  ),
                  title: Text(
                    "Developers Page",
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => DevelopersPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.policy_rounded,
                  ),
                  title: Text(
                    "Privacy Policy",
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => PrivacyPolicy(),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen>
    with SingleTickerProviderStateMixin {
  final zoomDrawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    final AnimationController animationController =
        AnimationController(vsync: this);
    return ZoomDrawer(
      controller: zoomDrawerController,
      menuScreen: MenuScreen(),
      mainScreen: PanoAndBottomNavBar(
        animationController: animationController,
      ),
      style: DrawerStyle.defaultStyle,
      moveMenuScreen: false,
      borderRadius: 24.0,
      angle: 0.0,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.decelerate,
      menuBackgroundColor: Colors.transparent,
      menuScreenWidth: MediaQuery.of(context).size.width * 0.80,
    );
  }
}
