import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/CtrlsMainPage.dart';
import 'SingleEvent.dart';

class EventViewWidget extends StatefulWidget {
  final List<String> names;
  final List<String> events;
  final List<String> tags;
  EventViewWidget(
      {required this.names,
      required this.tags,
      required this.events,
      super.key});

  @override
  _EventViewWidgetState createState() => _EventViewWidgetState();
}

class _EventViewWidgetState extends State<EventViewWidget> {
  PageController? pageController;
  double viewportFraction = 0.8;
  double? pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController =
        PageController(initialPage: 0, viewportFraction: viewportFraction)
          ..addListener(() {
            setState(() {
              pageOffset = pageController!.page;
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    final eventsPageController = Get.put(EventsPageController());

    List<String> names = widget.names;
    List<String> events = widget.events;
    List<String> tags = widget.tags;

    double heightTotal = MediaQuery.of(context).size.height;
    return Obx(
      () => SizedBox(
        height: heightTotal * 0.5,
        child: PageView.builder(
          controller: pageController,
          itemBuilder: (context, index) {
            double scale = max(viewportFraction,
                (1 - (pageOffset! - index).abs()) + viewportFraction);

            double angle = -1 * (pageOffset! - index);

            return Container(
              padding: EdgeInsets.only(
                right: 10,
                left: 20,
                top: 100 - scale * 25,
                bottom: 50,
              ),
              child: Transform(
                transform: Matrix4.identity()
                  ..setEntry(
                    3,
                    2,
                    0.001,
                  )
                  ..rotateY(angle),
                alignment: Alignment.center,
                child: Obx(
                  () => GlassEventContainer(
                      angle: angle,
                      event: events[index],
                      name: names[index],
                      tag: tags[index]),
                ),
              ),
            );
          },
          itemCount: eventsPageController.nTechEventUrls.length,
        ),
      ),
    );
  }
}
