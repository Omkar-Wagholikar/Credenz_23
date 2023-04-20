import 'package:flutter/material.dart';

import 'package:random_text_reveal/random_text_reveal.dart';

import 'glass_box_sessions.dart';

class Sessions extends StatefulWidget {
  const Sessions({super.key});

  @override
  State<Sessions> createState() => _SessionsState();
}

class _SessionsState extends State<Sessions> {
  @override
  Widget build(BuildContext context) {
    final fSize = MediaQuery.of(context).size.width > 600 ? 28.0 : 20.0;
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: RandomTextReveal(
          text: 'SESSIONS',
          duration: const Duration(seconds: 1),
          style: TextStyle(
            fontFamily: 'Mars Bold',
            color: Colors.white,
            fontSize: fSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/sessions_background.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 0.144 * h),
            Container(
              height: 0.04 * h,
              width: 0.65 * w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.05),
                    Colors.white.withOpacity(0.05),
                  ],
                ),
              ),
              child: Center(
                child: RandomTextReveal(
                  randomString: Source.lowercase,
                  text: 'Exploring Paradigm',
                  duration: const Duration(seconds: 2),
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OxaniumRegular',
                    fontSize: fSize - 1.0,
                    letterSpacing: 3.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 0.07 * h,
            ),
            GlassBox(),
          ],
        ),
      ),
    );
  }
}
