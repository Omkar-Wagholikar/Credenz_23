import 'package:credenz_23/constants/constants_profile_getpass.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class goldpass extends StatefulWidget {
  const goldpass({Key? key}) : super(key: key);

  @override
  State<goldpass> createState() => _goldpassState();
}

class _goldpassState extends State<goldpass> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  String passdetails(bool paymentstatus) {
    if (paymentstatus) {
      return "verified!";
    } else {
      return "Pending..";
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'GOLDEN PASS',
          style: TextStyle(
            fontSize: 22.0,
            fontFamily: 'Mars',
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: screenwidth * 0.8,
          height: screenheight * 0.5,
          child: FlipCard(
            key: cardKey,
            flipOnTouch: true,
            autoFlipDuration: const Duration(seconds: 10),
            // fill: Fill.fillFront,
            front: Stack(children: [
              Image.asset(
                'assets/images/goldpass(3).png',
                fit: BoxFit.fill,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenheight * 0.04,
                  ),
                  const Center(
                    child: Text(
                      'Credenz \'23',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Oxanium',
                          color: Colors.white,
                          shadows: [
                            Shadow(
                                color: Colors.black,
                                offset: Offset(2.0, 2.0),
                                blurRadius: 2.0)
                          ]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: screenheight * 0.285,
                  ),
                  Container(
                    width: screenwidth * 0.6,
                    height: screenheight * 0.04,
                    color: Colors.black38,
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: screenwidth * 0.15,
                          ),
                          Text(
                            passdetails(paymentstatus),
                            style: const TextStyle(
                                fontSize: 24.0,
                                // fontWeight: FontWeight,
                                fontFamily: 'Oxanium',
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                      color: Colors.black,
                                      offset: Offset(1.0, 2.0))
                                ]),
                          ),
                          SizedBox(
                            width: screenwidth * 0.017,
                          ),
                          IconButton(
                              onPressed: () {
                                cardKey.currentState?.toggleCard();
                              },
                              icon: const Icon(
                                Icons.info_outline,
                                size: 20.0,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                      color: Colors.black,
                                      offset: Offset(1.0, 2.0))
                                ],
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ]),
            back: const Backcard(),
          ),
        ),
      ),
    );
  }
}

class Backcard extends StatefulWidget {
  const Backcard({Key? key}) : super(key: key);

  @override
  State<Backcard> createState() => _BackcardState();
}

class _BackcardState extends State<Backcard> {
  String backdetails(bool paymentstatus) {
    if (paymentstatus) {
      return "YOU CAN PLAY ALL EVENTS USING THIS PASS";
    } else {
      return "AFTER YOUR PAYMENT IS CONFIRMED YOU CAN PLAY ALL EVENTS USING THIS PASS!";
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
// height: screenheight * 0.1,
          decoration: BoxDecoration(
// color: Colors.yellow,
              borderRadius: BorderRadius.circular(20.0),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.yellow.shade100, Colors.yellow.shade700])),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                backdetails(paymentstatus),
                style: const TextStyle(
                    fontFamily: 'Oxanium',
                    fontWeight: FontWeight.bold,
                    fontSize: 26.0,
                    color: Colors.white,
                    shadows: [
                      Shadow(color: Colors.black, offset: Offset(1.0, 2.0))
                    ]),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}


// );