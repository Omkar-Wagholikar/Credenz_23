import 'dart:async';
// import 'dart:html';
import 'dart:ui';
import 'package:random_text_reveal/random_text_reveal.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class About_UGM extends StatefulWidget {
  const About_UGM({Key? key}) : super(key: key);

  @override
  State<About_UGM> createState() => _About_UGMState();
}

class _About_UGMState extends State<About_UGM> {
  // get child => null;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 30,
        // backgroundColor: Colors.black,
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.12),
          child: const RandomTextReveal(
            text: 'ABOUT US',
            duration: Duration(seconds: 2),
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontFamily: 'Mars',
            ),
          ), // Duration
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/gm (1).jpg'),
            fit: BoxFit.cover,
          ),
        ),
        // alignment: Alignment.center,
        child: Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            CarouselSlider(
              items: [
                Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/logo White.png'),
                      )),
                )
              ],
              options: CarouselOptions(
                height: screenHeight * 0.23,
                enableInfiniteScroll: false,
                // autoPlay: true,
                // aspectRatio: 16/2,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  // height: 300,
                  height: screenHeight * 0.59,
                  width: screenWidth * 1,
                  // alignment: Alignment.center,
                  decoration: BoxDecoration(
                    // color: Colors.white.withOpacity(0.3),
                    gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.center,
                        colors: [Colors.white24, Colors.white24]),
                    borderRadius: BorderRadius.circular(20),
                    // border: Border.all(width: 2,color: Colors.white30),
                  ),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(top: 12),
                    children: [
                      Container(
                        // height: 490,
                        // width: 39,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: const Center(
                          child: Text(
                            'Credenz is the the annual technical festival organised by'
                            'the PICT IEEE .Student Branch.Started in 2004 with a'
                            'view to elicit the best out of each a view and every one.It has grow to become one of the finest technical event in Pune '
                            'Credenz aims not only to infuse a competitive spirit among participants,but also widen their horizon in the every changing '
                            'field to technology via myriad seminars and workshops.Participants get a chance to discover their talent and thrive in numerous'
                            'event like Clash, RoboLIGA. WebWeaver,Pixelat,Cretronix, Paper presentation and Data Wiz. This is a Unique chance '
                            'for the student to go beyoud the traditional spheres of acadamics and make the most of thir potantial . This spirit of learning '
                            'and discovery has inspire the PICT IEEE Student Branch to present Credenz 20, a podium for you to nurture and cultivate your talent.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.white70,
                                fontFamily: 'Oxanium_Medium'),
                          ),
                        ), // child: Text('hello'),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Center(
                        child: GlowingButton(),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
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

// https://pictieee.in/

Future<void> _launchUrl() async {
  final Uri url = Uri.parse('https://credenz.in/');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

///////

class GlowingButton extends StatefulWidget {
  final Color color1;
  final Color color2;
  const GlowingButton(
      {Key? key, this.color1 = Colors.pink, this.color2 = Colors.purple})
      : super(key: key);
  @override
  State<GlowingButton> createState() => _GlowingButtonState();
}

class _GlowingButtonState extends State<GlowingButton> {
  // final _LoginState obj = _LoginState();
  var glowing = true;
  var scale = 1.0;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () async {
        var pressed = true;
        await _launchUrl();
      },
      child: AnimatedContainer(
        transform: Matrix4.identity()..scale(scale),
        duration: const Duration(milliseconds: 200),
        height: screenHeight * 0.06,
        width: screenWidth * 0.75,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            gradient: LinearGradient(
              colors: [
                widget.color1,
                widget.color2,
              ],
            ),
            boxShadow: glowing
                ? [
                    BoxShadow(
                      color: widget.color1.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 16,
                      offset: const Offset(-8, 0),
                    ),
                    BoxShadow(
                      color: widget.color2.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 16,
                      offset: const Offset(8, 0),
                    ),
                    BoxShadow(
                      color: widget.color1.withOpacity(0.3),
                      spreadRadius: 16,
                      blurRadius: 32,
                      offset: const Offset(-8, 0),
                    ),
                    BoxShadow(
                      color: widget.color2.withOpacity(0.2),
                      spreadRadius: 16,
                      blurRadius: 32,
                      offset: const Offset(8, 0),
                    )
                  ]
                : []),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.2,
          ),
          child: const Row(
            children: [
              Center(
                child: Icon(
                  Icons.web_sharp,
                  color: Colors.white,
                ),
                // alignment: Alignment.center,
              ),
              SizedBox(
                width: 10,
              ),
              Center(
                child: Text(
                  "Visit website",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
