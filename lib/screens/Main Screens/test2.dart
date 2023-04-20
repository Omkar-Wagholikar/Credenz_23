import 'package:credenz_23/screens/Main%20Screens/AppDrawer/appDrawer.dart';
import 'package:flutter/material.dart';
import 'MainScreen/Views/PanoBNav.dart';

class CustomAppBar_and_Screen extends StatefulWidget {
  const CustomAppBar_and_Screen({super.key});

  @override
  _CustomAppBar_and_ScreenState createState() =>
      _CustomAppBar_and_ScreenState();
}

class _CustomAppBar_and_ScreenState extends State<CustomAppBar_and_Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  final double _startValue = 0.0;
  final double _endValue = 2.0;
  final int _animationDuration = 200;
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _animationDuration),
    );
    _animation = Tween<double>(
      begin: _startValue,
      end: _endValue,
    ).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    Offset startingPosition = Offset.zero;
    double dragDistance = 0;

    void _callMyFunction() {
      _animationController.reverse();
    }

    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                    onHorizontalDragStart: (details) {
                      startingPosition = details.globalPosition;
                    },
                    onHorizontalDragUpdate: (details) {
                      print("DragDistance: $dragDistance");
                      if (startingPosition != Offset.zero) {
                        dragDistance =
                            details.globalPosition.dx - startingPosition.dx;
                        if (dragDistance < -80) {
                          _callMyFunction();
                        }
                      }
                    },
                    onHorizontalDragEnd: (details) {
                      startingPosition = Offset.zero;
                      dragDistance = 0;
                    },
                    child:
                        SizedBox(width: h * 0.35, child: const MenuScreen()))),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                final xPosition = (275.0 / 2) * _animation.value * -1;
                final scalePercentage = 1 - (_animation.value * 0.2);
                final yAngle = _animation.value * (3.141 / 4) * 1;

                return Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, -0.0009)
                      ..translate(-0.09 * xPosition)
                      ..scale(scalePercentage)
                      ..rotateY(-1 * yAngle * 0.2),
                    alignment: Alignment.centerRight,
                    child: ClipRect(
                      child: SizedBox(
                          height: h,
                          width: w,
                          child: PanoAndBottomNavBar(
                            animationController: _animationController,
                          )),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
