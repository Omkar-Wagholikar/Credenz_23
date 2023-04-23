import 'package:get/get.dart';

import '../../../services/networking.dart';

database db = database();
Map<String, String> imageUrls = {
  "WEB WEAVER": "assets/images/cretronix.png",
  "CRETRONIX": "assets/images/cretronix.png",
  "QUIZ": "assets/images/datawiz.png",
  "DATAWIZ": "assets/images/datawiz.png",
  "CLASH": "assets/images/bplan.png",
  "REVERSE CODING": "assets/images/bplan.png",
  "NETWORK TREASURE HUNT": "assets/images/bplan.png",
  "B-PLAN": "assets/images/bplan.png",
  "ENIGMA": "assets/images/enigma.png",
  "WALL STREET": "assets/images/enigma.png"
};

class EventsPageController extends GetxController {
  var techNames = <String>[].obs;
  var techEventUrls = <String>[].obs;
  var nTechNames = <String>[].obs;
  var nTechEventUrls = <String>[].obs;
  var nTechDes = <String>[].obs;
  var techDes = <String>[].obs;
  var techTags = <String>[].obs;
  var ntechTags = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchEvents();
  }

  ScheduleController() {
    fetchEvents();
  }

  void fetchEvents() async {
    // await Future.delayed(Duration(seconds: 1));
    List<dynamic> allEvents = await db.getEvents();
    print("ALLEVENTS: ${allEvents.length}");

    for (int i = 0; i < 5; i++) {
      // if (allEvents[i]['type'] == 'technical') {
      techEventUrls.add(imageUrls[allEvents[i]['heading']]!);
      techNames.add(allEvents[i]['heading']);
      techTags.add(allEvents[i]['heading']);
      techDes.add(allEvents[i]['body']);
      // }
      // else {
      nTechEventUrls.add(imageUrls[allEvents[i + 5]['heading']]!);
      nTechNames.add(allEvents[i + 5]['heading']);
      ntechTags.add(allEvents[i + 5]['heading']);
      nTechDes.add(allEvents[i + 5]['body']);
      // }
    }
  }
}
