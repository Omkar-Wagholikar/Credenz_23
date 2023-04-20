import 'package:get/get.dart';

class EventsPageController extends GetxController {
  var techNames = <String>[].obs;
  var techEvents = <String>[].obs;
  var nTechNames = <String>[].obs;
  var nTechEvents = <String>[].obs;
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
    techEvents =
        RxList(["bplan", "bplan", "enigma", "bplan", "bplan", "enigma"]);
    techNames = RxList(["NTH0", "nth1", "nth2", "nth3", "nth4", "nth5"]);
    techTags = RxList(["NTH0", "nth1", "nth2", "nth3", "nth4", "nth5"]);

    nTechEvents =
        RxList(["bplan", "bplan", "enigma", "bplan", "bplan", "enigma"]);
    nTechNames = RxList([
      "Cretonics1",
      "Cretonics2",
      "Cretonics3",
      "Cretonics4",
      "Cretonics5",
      "Cretonics6",
    ]);
    ntechTags = RxList([
      "Cretonics1",
      "Cretonics2",
      "Cretonics3",
      "Cretonics4",
      "Cretonics5",
      "Cretonics6",
    ]);
  }
}
