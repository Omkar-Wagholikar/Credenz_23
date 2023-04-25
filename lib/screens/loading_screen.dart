// Use This Screen for loading gif of start
import 'package:credenz_23/screens/Main%20Screens/AppDrawer/appDrawer.dart';
import 'package:credenz_23/screens/Other%20Pages/Privacy_Policy/privacy_policy.dart';
import 'package:credenz_23/screens/Other%20Pages/Profile_And_Ticket/profile_page.dart';
// import 'package:credenz_23/screens/Other%20Pages/Sponsors_Page/sponsers.dart';
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
                  database db = database();
                  db.placeOrders(
                      context: context,
                      eventList: ["eventList"],
                      transactionId: "transactionId",
                      amount: "1000");

                  // db.test();

                  // db.getOrders(context: context);

                  // db.register(
                  //   username: 'John2',
                  //   email: '123452@4.com',
                  //   phone: '1234567890',
                  //   first_name: '12345',
                  //   last_name: '12345',
                  //   password: 'tT13456789',
                  //   senior: false,
                  //   institute: '12345',
                  //   context: context,
                  // );

                  // db.login(
                  //     context: context, username: "t1", password: "tT12345678");

                  // db.getEvents();

                  // db.profile(context: context);

                  // db.getHeaders(
                  //     context: context, username: "t1", password: "tT12345678");
                },
                child: const Text("Test"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PingPage()),
                  );
                },
                child: const Text("Ping"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage(
                              emailid: "test@gmail.com",
                              nontechevents: 1,
                              phonenumber: "1234567890",
                              techevents: 4,
                              username: "testUser",
                            )),
                  );
                },
                child: const Text("Profile"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutUGM()),
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
