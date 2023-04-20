import 'package:flutter/material.dart';
import 'package:credenz_23/screens/Other Pages/Contact_Us/glass_box.dart';
import 'package:random_text_reveal/random_text_reveal.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  AssetImage image1 = const AssetImage("assets/images/contact_us.jpg");

  @override
  void initState() {
    super.initState();
    image1 = const AssetImage("assets/images/contact_us.jpg");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(image1, context);
  }

  @override
  Widget build(BuildContext context) {
    final fSize = MediaQuery.of(context).size.width > 600 ? 28.0 : 20.0;
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: RandomTextReveal(
          text: 'CONTACT US',
          duration: const Duration(seconds: 2),
          style: TextStyle(
            fontFamily: 'Mars Bold',
            color: Colors.white,
            fontSize: fSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: image1,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 0.091 * h,
            ),
            SizedBox(height: 0.144 * h),
            GlassBox(),
          ],
        ),
      ),
    );
  }
}
