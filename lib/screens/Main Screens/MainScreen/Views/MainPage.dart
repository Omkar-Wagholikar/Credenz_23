// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/CtrlsMainPage.dart';
import 'AllEvent.dart';

class MainScreen extends StatefulWidget {
  final AnimationController animationController;
  const MainScreen({Key? key, required this.animationController})
      : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  // late AnimationController _controller;
  late TabController tabController;
  final eventsPageController = Get.put(EventsPageController());
  late PageController pageController;
  @override
  Widget build(BuildContext context) {
    tabController = TabController(length: 2, vsync: this)
      ..addListener(() {
        print("Selected Tab: ${tabController.index}");
      });
    double heightTotal = MediaQuery.of(context).size.height;
    // double widthTotal = MediaQuery.of(context).size.width;
    double viewportFraction = 0.8;
    double pageOffset = 0;

    pageController =
        PageController(initialPage: 0, viewportFraction: viewportFraction)
          ..addListener(() {
            setState(() {
              pageOffset = pageController.page!;
              print('PAGE: $pageOffset');
            });
          });

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            widget.animationController.forward(from: 0.0);
            // if (ZoomDrawer.of(context)!.isOpen()) {
            //   ZoomDrawer.of(context)!.close();
            // } else {
            //   ZoomDrawer.of(context)!.open();
            // }
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: const Text(
          '',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: heightTotal * 0.05,
          ),
          Text(
            "Credenz'23",
            style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: "Mars"),
          ),
          SizedBox(
            height: heightTotal * 0.05,
          ),
          TabBar(
            indicatorColor: Colors.blue,
            controller: tabController,
            tabs: const [
              Tab(
                child: Text(
                  "Tech Events",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Oxanium"),
                ),
              ),
              Tab(
                child: Text(
                  "Non - Tech Events",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Oxanium"),
                ),
              ),
            ],
          ),
          SizedBox(
            height: heightTotal * 0.05,
          ),
          SizedBox(
            height: heightTotal * 0.5,
            child: TabBarView(
              controller: tabController,
              children: [
                EventViewWidget(
                  events: eventsPageController.techEvents,
                  names: eventsPageController.techNames,
                  tags: eventsPageController.techTags,
                ),
                EventViewWidget(
                  names: eventsPageController.nTechNames,
                  events: eventsPageController.nTechEvents,
                  tags: eventsPageController.ntechTags,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
