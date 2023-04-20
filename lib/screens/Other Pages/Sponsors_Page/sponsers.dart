import 'package:credenz_23/screens/Other%20Pages/Sponsors_Page/interface.dart';
import 'package:credenz_23/screens/Other%20Pages/Sponsors_Page/interface1.dart';
import 'package:flutter/material.dart';
import 'package:random_text_reveal/random_text_reveal.dart';

class Sponsors extends StatefulWidget {
  const Sponsors({Key? key}) : super(key: key);

  @override
  State<Sponsors> createState() => _SponsorsState();
}

class _SponsorsState extends State<Sponsors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const RandomTextReveal(
          duration: Duration(seconds: 2),
          text: "SPONSORS",
          style: TextStyle(
            fontFamily: 'Mars',
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/back.jpg'),
                    fit: BoxFit.cover)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ui(),
              FloatingActionButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ui1()),
                );
              })
            ],
          )
        ],
      ),
    );
  }
}
