import 'dart:ui';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:random_text_reveal/random_text_reveal.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:hover_effect/hover_effect.dart';

class PingPage extends StatefulWidget {
  bool pressed = false;

  PingPage({super.key});
  @override
  State<PingPage> createState() => _PingPageState();
}

class _PingPageState extends State<PingPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // excludeHeaderSemantics: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.18),
          child: const RandomTextReveal(
            text: 'P.I.N.G',
            duration: Duration(seconds: 2),
            style: TextStyle(
              fontSize: 25,
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
            image: AssetImage('assets/images/image11.jpg'),
            opacity: 1,
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenWidth * 0.232),
                  // width: MediaQuery.of(context).size.width*0.1,
                  height: screenWidth * 0.66,
                  child: Container(
                    color: const Color(0xFFE9E9E9),
                    child: Center(
                      child: Image.asset(
                        'assets/images/ping_images.jpg',
                        height: screenHeight * 0.66,
                        width: screenWidth * 1,
                        fit: BoxFit.fill,
                      ),
                    ),
                  )),
              const SizedBox(height: 25.0),
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    // height: MediaQuery.of(context).padding.top)
                    height: screenHeight * 0.56,
                    width: screenWidth * 0.7,
                    alignment: Alignment.center,
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
                      children: [
                        // SizedBox(height: 20,),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          // width: 45,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          // height: 30,
                          child: const Center(
                            child: Text(
                              'P.I.N.G (PICT IEEE Newsletter Group is the official technicla magazine of PICT published'
                              'twise a year .PING server as a platform for individuals to portray their technical ingenuity.It highlight '
                              'artical outcutting edge technologies form technocrats all around the global including student industrialists'
                              'and faculty members .It also features interviews of distinguished personalities in various technical domain.'
                              'P.I.N.G aims at keeping its readers up to data on recent developments in technology and help them extrapolate'
                              'their perception to contemporary ideas of modernisation .With the imminent Issue _18.1_ be ready to get P.I.N.G\'d! ',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.white70,
                                  fontFamily: 'Oxanium_Medium'),
                            ),
                          ),
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
              // SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
//////////// ping url ////////////

Future<void> _launchUrl() async {
  final Uri url = Uri.parse('https://issuu.com/p.i.n.g./docs/2-5');
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
        ));
  }
}
