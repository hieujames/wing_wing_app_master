import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wing_wing/screen/screen_signup.dart';
import 'package:wing_wing/screen/screen_welcome.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFFFE500),
      body: SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(),
        child: Stack(
          children: <Widget>[
            SvgPicture.asset(
              "assets/images/circlertopleft.svg",
            ),
            Container(
              margin: const EdgeInsets.only(top: 118.0),
              child: Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(
                  "assets/images/circlehalfright.svg",
                ),
              ),
            ),
            Align(
              child: Column(
                children: [
                  Stack(children: [
                    Image.asset(
                      "assets/images/bee2.png",
                      width: 336,
                      height: 332,
                    ),
                    Positioned(
                      left: 300,
                      top: 33,
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4.0, vertical: 2.0),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 13,
                                    height: 13.0,
                                    child: CustomPaint(
                                      painter: HalfCirclePainter(),
                                    ),
                                  ),
                                  const Text(
                                    'KR',
                                    style: TextStyle(fontSize: 12.0),
                                  )
                                ],
                              )
                            ],
                          )
                          // borderRadius:
                          //     BorderRadius.all(Radius.circular(25.0))),
                          ),
                    ),
                  ]),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30.0),
                    width: 334,
                    height: 427,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        color: Colors.white),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 30.0),
                        child: Text(
                          'LOGIN',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 17.0),
                        width: 295,
                        height: 48,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0))),
                              hintText: "Name",
                              prefixIcon: Icon(Icons.people_alt)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 17.0),
                        width: 295,
                        height: 48,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0))),
                              hintText: "Password",
                              suffixIcon: Icon(Icons.remove_red_eye),
                              prefixIcon: Icon(Icons.lock)),
                        ),
                      ),
                      SizedBox(
                        width: 295,
                        height: 48,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => const SignUpScreen(),
                                  ));
                            },
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ))),
                            child: const Text('Login')),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 30.0),
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 18.0),
                        child: Text('SNS LOGIN'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              child: const Icon(Icons.face),
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              child: const Icon(Icons.face),
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                  color: Colors.green,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              child: const Icon(Icons.face),
                            ),
                          )
                        ],
                      )
                    ]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (value) {},
                          ),
                          const Text('Remember me'),
                        ],
                      ),
                      const Text('Find Password')
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HalfCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final radius = min(size.width, size.height) / 2;
    final center = Offset(size.width / 2, size.height / 2);

    final paint1 = Paint()
      ..color = Colors.red // Màu 1
      ..style = PaintingStyle.fill;

    final paint2 = Paint()
      ..color = const Color(0xff0019FE) // Màu 2
      ..style = PaintingStyle.fill;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0, // Bắt đầu từ 90 độ
      pi, // Vẽ 180 độ
      true,
      paint1,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi, // Bắt đầu từ -90 độ
      pi, // Vẽ 180 độ
      true,
      paint2,
    );
  }

  @override
  bool shouldRepaint(HalfCirclePainter oldDelegate) => false;
}
