import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String content, {int? time}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content),
    duration: Duration(seconds: time ?? 5),
  ));
}

/*class SpaceMaker extends StatelessWidget {
  final percentSpace = int;
  const SpaceMaker({super.key, int? percentSpace = 5});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SizedBox(height: height / percentSpace);
  }
}*/

class formFieldRow extends StatelessWidget {
  TextEditingController? useController = TextEditingController();
  String useText;
  bool isReadOnly;
  String? initialText;

  formFieldRow(
      {super.key,
      this.useController,
      required this.useText,
      this.isReadOnly = false,
      this.initialText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(useText),
        const SizedBox(width: 25),
        Expanded(
          child: TextFormField(
            //initialValue: initialText,
            decoration: InputDecoration(labelText: initialText),
            readOnly: isReadOnly,
            controller: useController,
          ),
        ),
      ],
    );
  }
}

AppBar myAppBar = AppBar(
  leading: IconButton(
      onPressed: () {
        //Get.toNamed('/');
      },
      icon: const Icon(Icons.home)),
);