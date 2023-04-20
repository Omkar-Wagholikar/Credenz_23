import 'dart:math';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});
  @override
  State<AppDrawer> createState() => AppDrawerState();
}

class AppDrawerState extends State<AppDrawer> with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(_animationController);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.red.shade400,
                  Colors.yellow.shade800,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          SafeArea(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.pink.shade400,
                    Colors.brown.shade800,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              width: 0.6 * w,
              height: double.infinity,
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 0.1 * h,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/credenz.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        ListTile(
                          onTap: () {
                            print('Clicked PISB');
                          },
                          leading: const Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          title: const Text(
                            'PISB',
                            style: TextStyle(
                              fontFamily: 'OxaniumRegular',
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            print('Clicked PING');
                          },
                          leading: const Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          title: const Text(
                            'PING',
                            style: TextStyle(
                              fontFamily: 'OxaniumRegular',
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            print('Clicked Sponsors');
                          },
                          leading: const Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          title: const Text(
                            'Sponsors',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'OxaniumRegular',
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            print('Clicked My Events');
                          },
                          leading: const Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          title: const Text(
                            'My Events',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'OxaniumRegular',
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            print('Clicked Website');
                          },
                          leading: const Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          title: const Text(
                            'Visit Website',
                            style: TextStyle(
                              fontFamily: 'OxaniumRegular',
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            print('Clicked Developers');
                          },
                          leading: const Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          title: const Text(
                            'Developers',
                            style: TextStyle(
                              fontFamily: 'OxaniumRegular',
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Placeholder()),
                            );
                          },
                          leading: const Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          title: const Text(
                            'Privacy Policy',
                            style: TextStyle(
                              fontFamily: 'OxaniumRegular',
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            print('Clicked Contact Us');
                          },
                          leading: const Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          title: const Text(
                            'Login',
                            style: TextStyle(
                              fontFamily: 'OxaniumRegular',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, 0.60 * w * _animation.value)
                  ..rotateY((pi / 10) * _animation.value)
                  ..scale(_animation.value),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  // margin: EdgeInsets.only(
                  //   top: x,
                  //   bottom: x,
                  // ),
                  child: Scaffold(
                    appBar: AppBar(
                      title: const Text(
                        'App bar',
                      ),
                    ),
                    body: Center(
                      child: ElevatedButton(
                          onPressed: () {
                            _animationController.forward(from: 0.0);
                          },
                          child: const Text("child")),
                    ),
                  ),
                ),
              );
            },
          ),
          GestureDetector(
            onHorizontalDragUpdate: (e) {
              if (e.delta.dx < 15) {
                print("TEST: ${1 - e.delta.dx / 25}");
                // _scale = 1 - (e.delta.dx / 25) * 0.8;
                // if (_scale > 1.0) _scale = 1.0;
                // print("THIS: ${e.delta.dx}");
                // print(e);
                if (e.delta.dx > 0) {
                  setState(() {
                    // value = 1;
                    // x = 50.0;
                  });
                } else {
                  setState(() {
                    // value = 0;
                    // x = 0;
                  });
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
