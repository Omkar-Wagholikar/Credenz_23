import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../../EventPage/views/single_event.dart';

class GlassEventContainer extends StatelessWidget {
  final double angle;
  final String name;
  final String event;
  final String tag;
  GlassEventContainer(
      {super.key,
      required this.angle,
      required this.event,
      required this.name,
      required this.tag});

  @override
  Widget build(BuildContext context) {
    double heightTotal = MediaQuery.of(context).size.height;
    double widthTotal = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {},
      child: InkWell(
        onTap: () {
          // Get.to(DashBoard());
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => DashBoard(
                      tag: tag,
                      event: event,
                      name: name,
                    )),
          );
        },
        child: GlassmorphicContainer(
          height: heightTotal * 0.60,
          width: widthTotal * 0.7,
          borderRadius: 20,
          blur: 10,
          alignment: Alignment.bottomCenter,
          border: 2,
          linearGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFFffffff).withOpacity(0.1),
                const Color(0xFFFFFFFF).withOpacity(0.05),
              ],
              stops: const [
                0.1,
                1,
              ]),
          borderGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFffffff).withOpacity(0.5),
              const Color((0xFFFFFFFF)).withOpacity(0.5),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Transform.rotate(
                  angle: angle,
                  child: Hero(
                    tag: tag,
                    child: Image.asset(
                      fit: BoxFit.contain,
                      "assets/images/$event.png",
                    ),
                  ),
                ),
              ),
              Text(name,
                  style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "oxanium")),
              Container()
            ],
          ),
        ),
      ),
    );
  }
}
