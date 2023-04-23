import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:shifting_tabbar/shifting_tabbar.dart';
import 'package:custom_floating_action_button/custom_floating_action_button.dart';
import 'eventData.dart';

class DashBoard extends StatefulWidget {
  final String name;
  final String event;
  final String tag;
  const DashBoard(
      {required this.event, required this.name, super.key, required this.tag});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    TabController tabcontroller = TabController(length: 4, vsync: this);
    return CustomFloatingActionButton(
      spaceFromBottom: h * 0.01,
      spaceFromRight: w * 0.05,
      openFloatingActionButton: const Icon(
        Icons.shopping_cart_rounded,
        color: Colors.black,
      ),
      options: [
        Container(
          height: h * 0.047,
          width: w * 0.28,
          margin: EdgeInsets.fromLTRB(w * 0.2, w * 0.05, 0, 0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
            child: ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.purple[700]),
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Get Pass'),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 74, 0),
          height: h * 0.047,
          width: w * 0.31,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
            child: ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.purple[700]),
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ' Go To Cart',
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
      type: CustomFloatingActionButtonType.horizontal,
      closeFloatingActionButton: const Icon(
        Icons.close,
        color: Colors.black,
      ),
      // )
      body: Scaffold(
        // backgroundColor: Colors.blueGrey[600],
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            widget.name,
            style: const TextStyle(
                fontFamily: 'Mars', fontSize: 20, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Opacity(
              opacity: 0.9,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: const Image(
                  image: AssetImage('assets/images/planetChina.jpeg'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Center(
              child: ClipPath(
                clipper: BackgroundClipper(),
                child: GlassContainer(
                  blur: 3,
                  // gradient: LinearGradient(colors: [Colors.blue, Colors.teal]),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.84,
                    width: MediaQuery.of(context).size.width * 0.93,
                    decoration: BoxDecoration(
                        // color: Colors.teal,
                        gradient: LinearGradient(
                            colors: [
                          Colors.white.withOpacity(0.001),
                          Colors.white.withOpacity(0.01)
                        ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 165, 0, 0),
                      child: Container(
                        decoration: BoxDecoration(
                            // color: Colors.teal,
                            gradient: LinearGradient(
                                colors: [
                              Colors.blue.withOpacity(0.01),
                              Colors.white.withOpacity(0.06),
                              Colors.tealAccent.withOpacity(0.08)
                            ],
                                begin: Alignment.topRight,
                                end: Alignment.bottomRight)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            DefaultTabController(
                              initialIndex: 1,
                              length: 4,
                              child: ShiftingTabBar(
                                // labelFlex: 2,
                                labelStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontFamily: 'Abel',
                                  decoration: TextDecoration.underline,
                                ),
                                controller: tabcontroller,
                                color: Colors.transparent,
                                tabs: [
                                  tab_info[0],
                                  tab_info[1],
                                  tab_info[2],
                                  tab_info[3],
                                  // tab_info[4]
                                ],
                              ),
                            ),
                            SizedBox(
                              height: h * 0.004,
                            ),
                            SizedBox(
                              height: h * 0.004,
                            ),
                            Container(
                              color: Colors.transparent,
                              width: double.maxFinite,
                              height: h * 0.42,
                              child: TabBarView(
                                clipBehavior: Clip.antiAlias,
                                controller: tabcontroller,
                                children: [
                                  tabBar_info[0],
                                  tabBar_info[1],
                                  tabBar_info[2],
                                  tabBar_info[3],
                                ],
                              ),
                            ),
                            SizedBox(
                              height: h * 0.01,
                            ),
                            Divider(
                              height: h * 0.01,
                              thickness: 1.5,
                              color: Colors.white24,
                            ),
                            SizedBox(
                              height: h * 0.006,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 25,
                                ),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Price',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Rs. 40/-',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.5),
                                CircleAvatar(
                                  backgroundColor: Colors.purple[200],
                                  radius: h * 0.030,
                                  child: IconButton(
                                    isSelected: false,
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.add_shopping_cart_rounded,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.15,
              top: MediaQuery.of(context).size.height * 0.045,
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 60, 0, 0),
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width * 0.70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Hero(
                  tag: widget.tag,
                  child: GlassImage(
                    blur: 0,
                    image: Image(
                      image: AssetImage(widget.event),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var roundnessFactor = size.height * 0.05;

    var path = Path();

    path.moveTo(0, size.height * 0.33);
    path.lineTo(0, size.height - roundnessFactor);
    path.quadraticBezierTo(0, size.height, roundnessFactor, size.height);
    path.lineTo(size.width - roundnessFactor, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - roundnessFactor);
    path.lineTo(size.width, roundnessFactor * 2);
    path.quadraticBezierTo(
        size.width - roundnessFactor * 0.5,
        roundnessFactor * 1.15,
        size.width - roundnessFactor * 1.5,
        roundnessFactor * 1.65);
    path.lineTo(
        roundnessFactor * 0.6, size.height * 0.33 - roundnessFactor * 0.3);
    path.quadraticBezierTo(
        0, size.height * 0.33, 0, size.height * 0.33 + roundnessFactor);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
