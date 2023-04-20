import 'package:credenz_23/constants/constants_profile_getpass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flip_card/flip_card.dart';

class GetPass extends StatefulWidget {
  const GetPass({Key? key}) : super(key: key);

  @override
  State<GetPass> createState() => _GetPassState();
}

class _GetPassState extends State<GetPass> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueGrey[900],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Get Pass',
          style: kHeading,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: screenheight * 0.3,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.transparent,
              ),
              // height: screenheight * 0.6,
              width: screenwidth * 0.7,
              child: FlipCard(
                fill: Fill.fillBack,
                key: cardKey,
                autoFlipDuration: const Duration(seconds: 10),
                flipOnTouch: true,
                front: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Stack(children: [
                    const Image(
                      image: AssetImage('assets/images/pass(3).png'),
                      fit: BoxFit.fill,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: screenwidth * 0.55, top: 5),
                      child: IconButton(
                          onPressed: () {
                            cardKey.currentState?.toggleCard();
                          },
                          icon: const Icon(
                            Icons.info,
                            color: Colors.grey,
                          )),
                    ),
                  ]),
                ),
                back: const backcard(),
              ),
            ),
          ),
          SizedBox(
            height: screenheight * 0.18,
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(
                paymentlink,
           //     transition: Transition.fadeIn,
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.teal[500],
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(3.0, 3.0)),
                  ]),
              height: screenheight * 0.1,
              width: screenwidth * 0.7,
              child: const Center(
                child: Text(
                  'Buy Pass',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Oxanium',
                      fontSize: 28.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class backcard extends StatelessWidget {
  const backcard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.9),
                  Colors.grey.withOpacity(0.4),
                ])),
        height: screenheight * 0.4,
        width: screenwidth * 0.8,
        child: Column(
          children: [
            SizedBox(
              height: screenheight * 0.05,
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'BUY THIS PASS AND YOU CAN PLAY ALL EVENTS!',
                style: TextStyle(
                  fontSize: 26.0,
                  fontFamily: 'Oxanium',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: screenheight * 0.02,
            ),
            const Text(
              price,
              style: TextStyle(
                fontSize: 26.0,
                fontFamily: 'Oxanium',
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
