import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shifting_tabbar/shifting_tabbar.dart';

final List tab_text = ["Details", "Schedule", "Rules", "Contact"];

final List tab_icons = [
  const Icon(
    Icons.info,
    color: Colors.white,
    size: 22,
  ),
  const Icon(
    Icons.schedule_outlined,
    color: Colors.white,
    size: 22,
  ),
  const Icon(
    Icons.file_copy,
    color: Colors.white,
    size: 22,
  ),
  // Icon(
  //   Icons.bar_chart_outlined,
  //   color: Colors.pinkAccent,
  //   size: 21,
  // ),
  const Icon(
    Icons.contact_page_outlined,
    color: Colors.white,
    size: 22,
  )
];

final List tabBar_info = [

  Container(
    child: const Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text(
                'Get ready to set off on a journey to the world of data science. DataWiz gives you an opportunity to test your machine learning and data analytics skills, work on datasets to analyse and make predictions using your models. Datawiz is a week-long machine learning competition hosted on Kaggle. The participants can form teams of up to 3 members and submit their predicted data values. The team with the highest accuracy on the leaderboard at the end of the week will be declared as winners.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  wordSpacing: 2.5,
                  letterSpacing: 1.8,
                  fontFamily: 'Abel',
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ),

  Container(
    child: const Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text(
                'Round 1: 10th April 9pm to 12th April 12pm\n\nRound 2: 13th April 12pm to 15th April 12pm',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  wordSpacing: 2.5,
                  letterSpacing: 2,
                  fontFamily: 'Abel',
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ),

  Container(
    child: const Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text(
                """1)Each team of students may consist of a maximum of 3 participants.

2)One account per participant

3)Signing In on Kaggle through Multiple accounts is prohibited.

4)No private sharing outside teams.

5)Privately sharing code or data outside of teams is not permitted.

6)Results should be reproducible to be eligible for prizes.""",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  wordSpacing: 2.5,
                  letterSpacing: 2,
                  fontFamily: 'Abel',
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ),

  Container(
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  const Text(
                    'Coming Soon...',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      wordSpacing: 2.5,
                      letterSpacing: 2,
                      fontFamily: 'Abel',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 150,
                    width: 180,
                    child: Lottie.asset('assets/images/coming soon.json'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  ),
];

final List tab_info = [
  ShiftingTab(icon: tab_icons[0], text: tab_text[0]),
  ShiftingTab(icon: tab_icons[1], text: tab_text[1]),
  ShiftingTab(icon: tab_icons[2], text: tab_text[2]),
  ShiftingTab(icon: tab_icons[3], text: tab_text[3]),
];
