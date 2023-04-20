import 'dart:core';
import 'package:credenz_23/constants/constants_profile_getpass.dart';
import 'package:flutter/material.dart';

import 'package:glassmorphism/glassmorphism.dart';
import 'ticket.dart';
import 'package:flutter_glow/flutter_glow.dart';



class profilepage extends StatefulWidget {
  const profilepage({super.key, required this.username,required this.emailid,required this.phonenumber,required this.techevents,required this.nontechevents});
  final String username;
  final String emailid;
  final String phonenumber;
  final int techevents;
  final int nontechevents;

  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // String username = Widget.username;
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'PROFILE',
          style: kHeading,
        ),

        // backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            showMenu(
                context: context,
                position: RelativeRect.fromLTRB(screenwidth,0 , 0, 0),
                items:[
                  PopupMenuItem(child: Row(
                    children: [
                      const Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: screenwidth*0.01,
                      ),
                      const Text('Share',
                      style: kText,
                      ),
                    ],
                  )),
                  PopupMenuItem(child: Row(
                    children: [
                      const Icon(Icons.feedback,
                      color: Colors.white,
                      ),
                      SizedBox(
                        width: screenwidth * 0.01,
                      ),
                      const Text(
                        'Feedback',
                      style: kText,
                      ),
                    ],
                  ))
                ],
              // shape: ,
              color: const Color(0xFF0F0F1F),
            );
          }, icon: const Icon(Icons.more_vert)),
        ]
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg2.jpeg'), fit: BoxFit.fitHeight),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenheight * 0.1,
            ),
            SizedBox(
              width: screenheight * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient:
                            RadialGradient(colors: [
                            const Color(0xFF1D1D2F).withOpacity(1),
                            const Color(0xFF0F0F1F).withOpacity(0.7),
                          ]),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      backgroundImage: const AssetImage('assets/images/icon2.png'),
                      radius: screenwidth * 0.08,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  SizedBox(
                    width: screenwidth * 0.02,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.username,
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontFamily: 'Oxanium',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.clip,
                      ),
                      SizedBox(
                        height: screenheight * 0.01,
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: screenheight * 0.003,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: screenwidth * 0.01,
                  ),
                  Text(
                    widget.emailid,
                    style: const TextStyle(
                      fontFamily: 'Oxanium',
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenheight * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: screenwidth * 0.01,
                  ),
                  Text(
                    widget.phonenumber,
                    style: const TextStyle(
                      fontFamily: 'Oxanium',
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenheight * 0.03,
            ),
            const Center(
              child: GlowText(
                "Your registered events",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Oxanium',
                    color: Colors.white
                ),
              ),
            ),
            SizedBox(
              height: screenheight * 0.02,
            ),
            GlassmorphicContainer(
              width: screenwidth * 0.9,
              height: screenheight * 0.5,
              borderRadius: 20,
              blur: 2,
              alignment: Alignment.bottomCenter,
              border: 0,
              linearGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFFffffff).withOpacity(0),
                    const Color(0xFFFFFFFF).withOpacity(0.1),
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
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 12.0, left: 50.0, right: 50.0),
                    child: TabBar(

                        labelStyle: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Oxanium',
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        controller: _tabController,
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.white,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(70.0),
                          color: Colors.pink,
                        ),
                        tabs: const [
                          Tab(
                            text: 'Tech',
                          ),
                          Tab(
                            text: 'Non-Tech',
                          )
                        ]),
                  ),
                  Expanded(
                    flex: 2,
                    child: TabBarView(controller: _tabController, children: [
                      ListView.builder(
                        shrinkWrap: true,
                        // physics: ScrollBehavior._bouncingPhysics,
                        itemCount: widget.techevents,
                        itemBuilder: (BuildContext context,index){
                        return const ticket(eventname: "event name",eventdate: "26/04/23",eventtime: "12:00 pm",eventlogo: "assets/datawizwhite.png",);
                      },
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        // physics: ScrollBehavior._bouncingPhysics,
                        itemCount: widget.nontechevents,
                        itemBuilder: (BuildContext context,index){
                          return const ticket(eventname: eventname,eventdate: eventdate,eventtime: eventtime,eventlogo: eventlogo,);
                        },
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
