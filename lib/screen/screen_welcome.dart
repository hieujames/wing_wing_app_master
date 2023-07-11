import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wing_wing/screen/screen_login.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFE500),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset("assets/images/circlerbottom.svg"),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset("assets/images/circlerleft.svg"),
                const SizedBox(
                  height: 35.0,
                )
              ],
            ),
          ),
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
                ]),
                Image.asset(
                  "assets/images/welcome.png",
                ),
                Image.asset(
                  "assets/images/wingwing.png",
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Row(
                    children: [
                      buildButton(context, 'Login', () {}),
                      const SizedBox(
                        width: 20,
                      ),
                      buildButton(context, 'Sign Up', () {})
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildButton(BuildContext context, String title, Function action) {
    return SizedBox(
      width: 150,
      height: 55,
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => LoginScreen(),
                ));
          },
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ))),
          child: Container(
            alignment: Alignment.center,
            child: Text(title),
          )),
    );
  }
}
