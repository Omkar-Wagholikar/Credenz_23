import 'package:flutter/material.dart';
import 'single_event.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => DashBoard(
                        tag: "tag",
                        event: 'nth',
                        name: 'name',
                      )),
            );
          },
          child: const Center(
            child: SizedBox(
              height: 300,
              width: 300,
              child: Hero(
                tag: 'wallstreet',
                child: Image(
                  image: AssetImage('assets/images/datawizwhite.png'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
