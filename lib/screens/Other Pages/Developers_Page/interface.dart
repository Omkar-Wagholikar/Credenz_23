import 'package:card_swiper/card_swiper.dart';
import 'package:credenz_23/screens/Other%20Pages/Developers_Page/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

import 'package:url_launcher/url_launcher.dart';

class ui extends StatefulWidget {
  const ui({Key? key}) : super(key: key);

  @override
  State<ui> createState() => _uiState();
}

class _uiState extends State<ui> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 200),
          SizedBox(
              height: 500,
              child: Swiper(
                itemCount: 1,
                pagination: const SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                      color: Colors.white24,
                      activeColor: Colors.white,
                      size: 6.0,
                      activeSize: 9.0),
                ),
                viewportFraction: 0.7,
                scale: 0.3,
                itemBuilder: (context, index) {
                  return Container(
                    child: GlassmorphicContainer(
                      width: 350,
                      height: 750,
                      borderRadius: 20,
                      blur: 20,
                      alignment: Alignment.bottomCenter,
                      border: 2,
                      linearGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color(0xFFffffff).withOpacity(0.10),
                            const Color(0xFFFFFFFF).withOpacity(0.25)
                          ],
                          stops: const [
                            0.1,
                            1,
                          ]),
                      borderGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color(0xFFffffff).withOpacity(0.0),
                            const Color(0xFFFFFFFF).withOpacity(0.0)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 18),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'assets/images/astronaut.png',
                              height: 300,
                              width: 230,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Center(
                            child: Text(
                              "Coming Soon",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Oxanium',
                                fontSize: 30,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                          const Text(
                            "App Team",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Oxanium',
                              fontSize: 20,
                              letterSpacing: 2,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () async {
                                  const url = '';
                                  final uri = Uri.parse(url);
                                  if (await canLaunchUrl(uri)) {
                                    await launchUrl(uri);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                                icon: const Icon(
                                  MyFlutterApp.linkedin,
                                  color: Colors.purple,
                                  size: 45,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  const url = '';
                                  final uri = Uri.parse(url);
                                  if (await canLaunchUrl(uri)) {
                                    await launchUrl(uri);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                                icon: const Icon(
                                  MyFlutterApp.github,
                                  color: Colors.purple,
                                  size: 45,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10)
                        ],
                      ),
                    ),
                  );
                },
              )),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
