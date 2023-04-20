// Working anim
import 'package:credenz_23/screens/Main%20Screens/MainScreen/Views/bNavBar.dart';
import "package:flutter/material.dart";
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../controllers/dateController.dart';
import 'SwichDate.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final eventController = Get.put(eventDateController());
    final CalendarController calenderController = CalendarController();

    print("inside topWidget: \nLENGTH: ${eventController.allDates.length}");
    print(
        "DATE: ${eventController.allDates[1].date}\nDAY: ${eventController.allDates[1].day}\nHALFDAY: ${eventController.allDates[1].day.substring(0, 3)}\nMONTH: ${eventController.allDates[1].month}\nYEAR: ${eventController.allDates[1].year}\nTop complete");

    return GetMaterialApp(
      home: Scaffold(
        // extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        // bottomNavigationBar: BNavBar(activeBar: 0),
        appBar: AppBar(
          // backgroundColor: Colors.deepPurple[800],
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            "Schedule",
            style: TextStyle(fontFamily: "Mars", fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/CalenderBgV3.png"),
                        fit: BoxFit.cover)),
              ),
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.095,
                  ),
                  Expanded(
                    child: SfCalendar(
                      headerStyle: const CalendarHeaderStyle(
                          textStyle: TextStyle(color: Colors.blue)),
                      viewHeaderStyle: const ViewHeaderStyle(
                          dayTextStyle: TextStyle(color: Colors.white),
                          dateTextStyle: TextStyle(color: Colors.white)),
                      cellBorderColor: Colors.white,
                      backgroundColor: Colors.transparent,
                      appointmentBuilder: appoint,
                      dataSource: MeetingDataSource(getAppointments()),
                      controller: calenderController,
                      view: CalendarView.day,
                      timeSlotViewSettings: const TimeSlotViewSettings(
                        startHour: 10,
                        endHour: 19,
                        timeFormat: 'HH:mm',
                        timeInterval: Duration(minutes: 30),
                        timeTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'oxantium',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.095,
                  ),
                  GlassmorphicContainer(
                    height: MediaQuery.of(context).size.height * 0.13,
                    width: MediaQuery.of(context).size.width,
                    borderRadius: 10,
                    blur: 10,
                    alignment: Alignment.bottomCenter,
                    border: 1,
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
                    // Container(
                    // color: const Color.fromARGB(100, 255, 255, 255),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.13,
                          child: Obx(() => ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: eventController.allDates.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Obx(() => SwitcherWidget(
                                          date: eventController
                                              .allDates[index].date,
                                          fullDay: eventController
                                              .allDates[index].day,
                                          halfday: eventController
                                              .allDates[index].day
                                              .substring(0, 3),
                                          isFirst: eventController
                                              .activeDates[index],
                                          month: eventController
                                              .allDates[index].month,
                                          year: eventController
                                              .allDates[index].year,
                                          index_: index,
                                          calenderController:
                                              calenderController,
                                        )),
                                  );
                                },
                              ))),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // bottomNavigationBar: BNavBar(activeBar: 0),
      ),
    );
  }
}

final eventController = Get.put(eventDateController());

List<Appointment> getAppointments() {
  List<Appointment> meetings = <Appointment>[];
  // final DateTime today = DateTime.now();
  // final DateTime startTime =
  //     DateTime(today.year, today.month, today.day, 9, 0, 0);
  // final DateTime endTime = startTime.add(const Duration(hours: 2));

  for (var event in eventController.allEventTimes) {
    print("NAME: ${event.name}");
    print("START TIME: ${event.startTime}");
    print("ENDING TIME: ${event.endTime}");
    print("-------------------");
    meetings.add(Appointment(
        startTime: event.startTime,
        endTime: event.endTime,
        subject: event.name));
  }
  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}

Widget appoint(BuildContext context,
    CalendarAppointmentDetails calendarAppointmentDetails) {
  final Appointment appointment = calendarAppointmentDetails.appointments.first;
  return Container(
    // color: appointment.color,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 255, 255, 255),
      // color: Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.red.withOpacity(0),
          spreadRadius: 1,
          blurRadius: 3,
          offset: const Offset(1, 3),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: Text(
                appointment.subject,
                style: const TextStyle(
                    fontFamily: 'oxantium', fontWeight: FontWeight.normal),
              ),
            ),
          ),
          const SizedBox(
            child: Icon(
              Icons.ac_unit,
              size: 45,
              color: Colors.black,
            ),
          )
        ],
      ),
    ),
  );
}
