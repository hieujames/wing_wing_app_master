import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wing_wing/screen/screen_welcome.dart';

class LanDingScreen extends StatelessWidget {
  const LanDingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 82.0,
          child: Image.asset("assets/images/honey1.png"),
        ),
        Positioned(
          top: 190.0,
          left: 28,
          child: Column(
            children: [
              Stack(children: [
                Image.asset(
                  "assets/images/bee2.png",
                  width: 336,
                  height: 332,
                ),
                Positioned(
                  top: 200,
                  left: 60,
                  child: SvgPicture.asset(
                    "assets/images/dot.svg",
                  ),
                ),
              ]),
              Image.asset(
                "assets/images/dotcolumn.png",
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => WelcomeScreen(),
                      ));
                },
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ))),
                child: Container(
                  alignment: Alignment.center,
                  width: 320, height: 55,
                  // padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text('Landing'),
                )),
          ),
        )
      ],
    );
  }
}
