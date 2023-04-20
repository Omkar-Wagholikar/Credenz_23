import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';

class ticket extends StatefulWidget {
  const ticket({super.key, required this.eventname,required this.eventdate,required this.eventtime,required this.eventlogo});
  final String eventname;
  final String eventdate;
  final String eventtime;
  final String eventlogo;

  @override
  State<ticket> createState() => _ticketState();
}

class _ticketState extends State<ticket> {
  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        double screenheight = MediaQuery.of(context).size.height;
        double screenwidth = MediaQuery.of(context).size.width;
        return
            GestureDetector(
              onTap: (){
                Get.back();
              },
              child: GlassmorphicContainer(
                width: screenwidth * 0.9,
                height: screenheight * 0.6 ,
                borderRadius: 20,
                blur: 2,
                alignment: Alignment.bottomCenter,
                border: 0,
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
                child: SimpleDialog(
                  clipBehavior: Clip.antiAlias,
                  elevation: 20.0,
                  backgroundColor: Colors.transparent,
                    children: [
                      Stack(
                        children: [
                          Center(
                            child: SizedBox(
                              width: screenwidth * 0.9 ,
                              height: screenheight * 0.7,
                              child: const Image(image: AssetImage('assets/images/ticketfinal(2).png'),
                              fit: BoxFit.fill,
                              ),
                        ),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: screenheight * 0.025,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(widget.eventdate,
                                    style: const TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black,
                                        fontFamily: 'Oxanium',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: screenwidth * 0.03,
                                  ),
                                  Text(widget.eventtime,
                                    style: const TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black,
                                        fontFamily: 'Oxanium',
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: screenheight * 0.01,
                              ),
                              Center(
                                child: SizedBox(
                                    width: screenwidth * 0.7,
                                    child: Image.asset('assets/images/barcode.gif')),
                              ),
                              SizedBox(
                                height: screenheight * 0.16,
                              ),
                              Image.asset(widget.eventlogo,
                              height: screenheight * 0.3,
                              )
                            ],
                          )
                        ]
                      )
                    ],
                ),
              ),
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: screenheight * 0.03,
        ),
        GestureDetector(
          onTap: showMyDialog,
          child: GlassmorphicContainer(
            width: screenwidth * 0.9,
            height: screenheight * 0.1,
            borderRadius: 20,
            blur: 20,
            alignment: Alignment.bottomCenter,
            border: 0.1,
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
              begin: Alignment.centerLeft,
              end: Alignment.center,
              colors: [
                const Color(0xFFffffff).withOpacity(0.5),
                const Color((0xFFFFFFFF)).withOpacity(0),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/icon2.png'),
                    backgroundColor: Colors.transparent,
                    radius: 35.0,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.eventname,
                      style: const TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                          fontFamily: 'Oxanium',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: screenheight * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.eventdate,
                          style: const TextStyle(
                              fontSize: 15.0,
                              color: Colors.white,
                              fontFamily: 'Oxanium',
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: screenwidth * 0.28,
                        ),
                        Text(
                          widget.eventtime,
                          style: const TextStyle(
                              fontSize: 15.0,
                              color: Colors.white,
                              fontFamily: 'Oxanium',
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
