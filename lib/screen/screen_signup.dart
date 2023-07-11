import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wing_wing/screen/screen_timeline.dart';
import 'package:wing_wing/screen/screen_wing_play.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFE500),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Positioned(
                    left: 90.0,
                    child: SvgPicture.asset('assets/images/circlehalftop.svg')),
                Positioned(
                  child:
                      SvgPicture.asset('assets/images/circleblacktopleft.svg'),
                  top: 53,
                ),
                Container(
                  margin: EdgeInsets.only(top: 90),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: SvgPicture.asset(
                        'assets/images/circleblacktopright.svg'),
                  ),
                ),
              ],
            ),
            Image.asset('assets/images/bee-wingwing.png'),
            Container(
              width: 331,
              height: 516,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 34),
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    _buildTextField(
                        hint: 'Name',
                        iconSuf: Icon(Icons.remove_red_eye),
                        iconPre: Icon(Icons.lock)),
                    _buildTextField(
                        hint: 'Password',
                        iconSuf: Icon(Icons.remove_red_eye),
                        iconPre: Icon(Icons.lock)),
                    _buildTextField(
                        hint: 'Email',
                        iconSuf: Icon(Icons.remove_red_eye),
                        iconPre: Icon(Icons.lock)),
                    _buildTextField(
                        hint: 'Date of Birth',
                        iconSuf: Icon(Icons.remove_red_eye),
                        iconPre: Icon(Icons.lock)),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 8.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                color: Colors.black),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text('Upload Your Photo')
                        ],
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => ScreenWingPlay(),
                              ));
                        },
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ))),
                        child: Container(
                          alignment: Alignment.center,
                          width: 295, height: 48,
                          // padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Text('Sign Up'),
                        )),
                    Container(
                      margin: EdgeInsets.only(right: 12.0, top: 10.0),
                      child: Text('Login'),
                      alignment: Alignment.centerRight,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildTextField(
      {required String hint, required Icon iconSuf, required Icon iconPre}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 17.0),
      width: 295,
      height: 48,
      child: TextFormField(
        decoration: InputDecoration(
            isDense: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
            hintText: hint,
            suffixIcon: iconSuf,
            prefixIcon: iconPre),
      ),
    );
  }
}
