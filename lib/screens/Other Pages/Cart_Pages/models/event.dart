
import 'package:credenz_23/screens/Other%20Pages/Cart_Pages/controllers/Cart_Controller.dart';
import 'package:credenz_23/screens/Other%20Pages/Cart_Pages/controllers/stepper_controller.dart';
import 'package:get/get.dart';

class Event extends GetxController {
  final controller = Get.put(StepperController());
  final cartController = Get.put(CartController());
  final String eventName;
  final double price;
  Event({
    required this.eventName,
    required this.price,
  });

  static List<Event> events = [
    Event(
      eventName: 'Enigma',
      price: 100,
    ),
    Event(
      eventName: 'DataWiz',
      price: 40,
    ),
    Event(
      eventName: 'Clash RC',
      price: 100,
    ),
    Event(
      eventName: 'B-Plan',
      price: 40,
    ),
    Event(
      eventName: 'Pixelate',
      price: 40,
    ),
    Event(
      eventName: 'WebWeaver',
      price: 40,
    ),
    Event(
      eventName: 'Cretronix',
      price: 40,
    ),
    Event(
      eventName: 'WallStreet',
      price: 40,
    ),
    Event(
      eventName: 'Quiz',
      price: 40,
    ),
  ].obs;
}
