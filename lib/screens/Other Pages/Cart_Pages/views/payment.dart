import 'package:credenz_23/screens/Other%20Pages/Cart_Pages/controllers/Cart_Controller.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:get/get.dart';

import '../models/custom_button.dart';

class PaymentView extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  final PaymentController pay = Get.put(PaymentController());
  PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width,
          color: Colors.transparent,
          child: const Center(
            child: Text(
              'Payment',
              style: TextStyle(
                fontFamily: 'Mars Bold',
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.45,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: Obx(() => Center(
                child: showCode(context),
              )),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          margin: const EdgeInsets.only(
            top: 10,
          ),
          child: const Text(
            'OR',
            style: TextStyle(
              fontFamily: 'OxaniumLight',
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        Obx(
          () => Container(
            margin: const EdgeInsets.only(top: 13),
            //      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.05,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              child: showText(context),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 2,
          color: Colors.black,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        ),
      ],
    );
  }
}

Widget showCode(BuildContext context) {
  final CartController cartController = Get.put(CartController());

  if (Get.find<PaymentController>().showQR.value == true) {
    return Container(
      color: Colors.red,
    );
  } else {
    return AnimatedButton(
      icon: Icons.qr_code_scanner_outlined,
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.4,
      pressEvent: () {
        AwesomeDialog(
          context: context,
          keyboardAware: true,
          dismissOnBackKeyPress: false,
          dialogType: DialogType.warning,
          animType: AnimType.rightSlide,
          btnCancelText: "Cancel",
          btnOkText: "Yes, I will pay",
          title: 'Continue to pay?',
          desc:
              "Please confirm that you will pay ₹${cartController.totalAmount.toString()} using the QR Code",
          btnCancelOnPress: () {},
          btnOkOnPress: () {
            // Update showQR
            Get.find<PaymentController>().showQR.value = true;
          },
        ).show();
      },
      text: 'Scan QR Here',
    );
  }
}

Widget showText(BuildContext context) {
  final CartController cartController = Get.put(CartController());

  if (Get.find<PaymentController>().showQR.value == false) {
    return ElevatedButton(
        style: ButtonStyle(
          overlayColor: ButtonStyles.buttonColor,
        ),
        onPressed: () {},
        child: const Text('Pay Here'));
  } else {
    return ElevatedButton(
      style: ButtonStyle(
        overlayColor: ButtonStyles.buttonColor,
      ),
      onPressed: () {
        Get.find<PaymentController>().showQR.value = false;
      },
      child: const Text('Pay By Another Method'),
    );
  }
}
