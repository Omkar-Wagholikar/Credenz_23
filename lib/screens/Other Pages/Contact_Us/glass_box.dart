import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class GlassBox extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      'image': 'assets/images/nidhi2.jpg',
      'name': 'Nidhi Yadav',
      'title': 'Vice Chairperson',
      'linkedin': 'https://www.linkedin.com/in/nidhi-p-yadav/',
      'mail': 'nidhiprashantyadav1904@gmail.com',
      'call': '+91-8767887493',
    },
    {
      'image': 'assets/images/harsh_bhat.png',
      'name': 'Harsh Bhat',
      'title': 'Joint Secretary',
      'linkedin': 'https://www.linkedin.com/in/harshbhat/',
      'mail': 'harshbhat005@gmail.com',
      'call': '+91-8983594252',
    },
  ];
  GlassBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final fSize = MediaQuery.of(context).size.width > 600 ? 28.0 : 20.0;
    return CarouselSlider(
      options: CarouselOptions(
        enlargeCenterPage: true,
        autoPlay: true,
        enableInfiniteScroll: false,
        height: 0.6 * h,
        aspectRatio: 16 / 9,
      ),
      items: items.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    height: 0.5 * h,
                    width: 0.7 * w,
                    child: Stack(
                      children: [
                        BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 0.8,
                            sigmaY: 0.8,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 0.14,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.black.withOpacity(0.5),
                                Colors.white.withOpacity(0.3),
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 0.05 * h,
                                ),
                                Container(
                                  height: 0.25 * h,
                                  width: 0.45 * w,
                                  decoration: BoxDecoration(
                                    // borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        item['image'],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 0.025 * h,
                                ),
                                Text(
                                  item['name'],
                                  style: TextStyle(
                                    fontFamily: 'OxaniumRegular',
                                    fontSize: fSize - 2.0,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 0.012 * h,
                                ),
                                Text(
                                  item['title'],
                                  style: TextStyle(
                                    fontFamily: 'OxaniumLight',
                                    fontSize: fSize - 4.0,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 0.03 * h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      iconSize: 32.0,
                                      icon: const Icon(
                                        Icons.call,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        String tele = item['call'];
                                        String telephone = "tel:$tele";
                                        launchUrlString(telephone);
                                      },
                                    ),
                                    SizedBox(
                                      width: 0.08 * w,
                                    ),
                                    IconButton(
                                      iconSize: 32.0,
                                      icon: const Icon(
                                        Icons.mail,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        String mail = item['mail'];
                                        String email = "mailto:$mail";
                                        launchUrlString(email);
                                      },
                                    ),
                                    SizedBox(
                                      width: 0.08 * w,
                                    ),
                                    IconButton(
                                      iconSize: 32.0,
                                      icon: const Icon(
                                        FontAwesome.linkedin,
                                        color: Colors.white,
                                      ),
                                      onPressed: () async {
                                        String url = item['linkedin'];
                                        final uri = Uri.parse(url);
                                        if (await canLaunchUrl(uri)) {
                                          await launchUrl(
                                            mode:
                                                LaunchMode.externalApplication,
                                            uri,
                                          );
                                        } else {
                                          await launch(url,
                                              forceSafariVC: false);
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 0.03 * h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      }).toList(),
    );
  }
}
