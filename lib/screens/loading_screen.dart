// Use This Screen for loading gif of start
import 'package:credenz_23/screens/Main%20Screens/AppDrawer/appDrawer.dart';
import 'package:credenz_23/screens/Other%20Pages/Privacy_Policy/privacy_policy.dart';
import 'package:credenz_23/screens/Other%20Pages/Sponsors_Page/sponsers.dart';
import 'package:credenz_23/services/networking.dart';
// import 'Main Screens/MainScreen/Views/PanoBNav.dart';
import 'package:flutter/material.dart';
import 'Main Screens/MainScreen/Views/AllEvent.dart';
// import 'Main Screens/menu.dart';
import 'Main Screens/test2.dart';
import 'Other Pages/About_Us_Page/aboutus_withgm.dart';
import 'Other Pages/Schedule_Page/views/ScrollViewSchedule.dart';
import 'Other Pages/PING_Page/ping.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Credenz 23"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  database dt = database();
                  // dt.register(
                  //   username: 'John',
                  //   email: '12345',
                  //   phone: '1234567890',
                  //   first_name: '12345',
                  //   last_name: '12345',
                  //   password: '12345',
                  //   senior: false,
                  //   institute: '12345',
                  //   context: context,
                  // );
                  // dt.login(
                  //     context: context, username: "t1", password: "tT12345678");
                  dt.getEvents();
                },
                child: const Text("Test"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Ping_Page()),
                  );
                },
                child: const Text("Ping"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const About_UGM()),
                  );
                },
                child: const Text("About Us"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DrawerScreen()),
                  );
                },
                child: const Text("Drawer"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ScheduleScreen()),
                  );
                },
                child: const Text("Schedule"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EventViewWidget(
                              names: const [],
                              events: const [],
                              tags: const [],
                            )),
                  );
                },
                child: const Text("test1"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PrivacyPolicy()),
                  );
                },
                child: const Text("Privacy Policy"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CustomAppBar_and_Screen()),
                  );
                },
                child: const Text("AnimTest"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
