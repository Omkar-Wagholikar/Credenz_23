import 'dart:async';
// import 'dart:html';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:random_text_reveal/random_text_reveal.dart';
import 'package:url_launcher/url_launcher.dart';

class PISB extends StatefulWidget {
  const PISB({Key? key}) : super(key: key);

  @override
  State<PISB> createState() => _PISBState();
}

class _PISBState extends State<PISB> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // backgroundColor: Colors.black,
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.19),
          child: const RandomTextReveal(
            text: 'PISB',
            duration: Duration(seconds: 2),
            style: TextStyle(fontSize: 30, fontFamily: 'Mars'),
          ),
        ),
      ),
      body: Container(
        // height: screenHeight*0.4,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/image17.jpg'),
              fit: BoxFit.cover,
              opacity: 1,
              scale: 20 / 2),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 90,
            ),
            SizedBox(
              height: screenHeight * 0.2,
              width: screenWidth * 0.62,
              child: Image.asset(
                'assets/images/logopisb.png',
                fit: BoxFit.contain,
              ),
              // decoration: BoxDecoration(
              //   image: DecorationImage(image: AssetImage('assets/images/pisblogo.png',),),
              // ),
            ),

            // Container(
            //   height: screenHeight*0.5,
            //   width: screenWidth*01,
            //   padding: EdgeInsets.symmetric(horizontal: 15),
            //   child: Center(
            //     child: Text(
            //       'PICT IEEE student branch (PISB) was established in the year 1988 with an aim of inculcating a sense of technical '
            //           'awareness amongst its student members .PISB aims to escalate the knowledge and trends in the diverse fields of '
            //           'technologies amongst its members.PISB upholds two majors events every year - Credenz and Credenz Tech Days with the'
            //           'first with the first one being conducted in odd semester and the latter one in even semester. PISB is also marked'
            //           'by its Women in Engineering (WIE) chapter . an Initative for empowerment of women.',
            //       textAlign: TextAlign.justify,
            //       style: TextStyle(
            //         fontSize: 20,
            //         color: Colors.white,
            //         fontFamily: 'Oxanium_Medium',
            //       ),
            //     ),
            //   ),
            // ),
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  // height: 300,
                  height: screenHeight * 0.47,
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
                            'PICT IEEE student branch (PISB) was established in the year 1988 with an aim of inculcating a sense of technical '
                            'awareness amongst its student members .PISB aims to escalate the knowledge and trends in the diverse fields of '
                            'technologies amongst its members.PISB upholds two majors events every year - Credenz and Credenz Tech Days with the'
                            'first with the first one being conducted in odd semester and the latter one in even semester. PISB is also marked'
                            'by its Women in Engineering (WIE) chapter . an Initative for empowerment of women.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.white70,
                                fontFamily: 'Oxanium_Medium'),
                          ),
                        ), // child: Text('hello'),
                      ),
                      // SizedBox(height: 25,),
                      // Center(child: GlowingButton(),),
                      // // SizedBox(height: 25,),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            const Center(
              child: GlowingButton(),
            ),
            // SizedBox(height: 25,),
          ],
        ),
      ),
    );
  }
}

// https://credenz.in/

Future<void> _launchUrl() async {
  final Uri url = Uri.parse('https://pictieee.in/');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

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
        ));
  }
}
