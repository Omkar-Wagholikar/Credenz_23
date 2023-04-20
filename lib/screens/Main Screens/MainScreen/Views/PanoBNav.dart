import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';
import 'MainPage.dart';
import 'bNavBar.dart';

class PanoAndBottomNavBar extends StatelessWidget {
  final AnimationController animationController;
  const PanoAndBottomNavBar({super.key, required this.animationController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Panorama(
            sensorControl: SensorControl.Orientation,
            animSpeed: 0.1,
            latitude: 20,
            longitude: 0,
            hotspots: const [],
            child: Image.asset("assets/images/ClubBg2.png"),
          ),
          MainScreen(
            animationController: animationController,
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BNavBar(
                activeBar: 2,
              )),
        ],
      ),
    );
  }
}
