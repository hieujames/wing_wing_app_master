import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wing_wing/screen/screen_timeline.dart';

class ScreenWingPlay extends StatefulWidget {
  const ScreenWingPlay({super.key});

  @override
  State<ScreenWingPlay> createState() => _ScreenWingPlayState();
}

class _ScreenWingPlayState extends State<ScreenWingPlay> {
  @override
  Widget build(BuildContext context) {
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomCustomize(selectedIndex: 0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              height: 413,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Color(0xFFFFE500),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 37.0, vertical: 48),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'WINGPLAY',
                          style: TextStyle(fontSize: 20),
                        ),
                        Icon(Icons.settings)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _buildItem(
                            icon: const Icon(Icons.shopping_bag),
                            title: 'SHOP'),
                        _buildItem(
                            icon: const Icon(Icons.airplane_ticket_rounded),
                            title: 'AIRTICKET'),
                        _buildItem(
                            icon: const Icon(Icons.car_repair),
                            title: 'RENT-CAR'),
                        _buildItem(
                            icon: const Icon(Icons.local_taxi_outlined),
                            title: 'TAXI'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildItem(
                            icon:
                                const Icon(Icons.sentiment_satisfied_alt_sharp),
                            title: 'Sticker'),
                        _buildItem(
                            icon: const Icon(Icons.gamepad_outlined),
                            title: 'GAME'),
                        _buildItem(
                            icon: const Icon(Icons.draw_outlined),
                            title: 'EDUCATION'),
                        _buildItem(
                            icon: const Icon(Icons.run_circle_outlined),
                            title: 'WALK'),
                      ],
                    ),
                    SizedBox(
                      height: 46,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.only(top: 10.0, left: 20),
                            isDense: true,
                            filled: true,
                            suffixIconColor: Colors.grey,
                            fillColor: Colors.white,
                            hintText: 'Search',
                            suffixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)))),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 29.0),
              child: Text(
                  "This is a place for text\nArticles that users are interested in are placed"),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 36),
              height: 160,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 22),
                          width: 90,
                          height: 90,
                          decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30.0),
                                  bottomRight: Radius.circular(30.0),
                                  topRight: Radius.circular(30.0))),
                          child: Image.asset(
                            "assets/images/wingwing.png",
                          ),
                        ),
                        const Text(
                          'Music',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        const Text(
                          'dummy text\n Enter simple text',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              height: 100,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }

  _buildItem({required Icon icon, required String title}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 50,
          height: 50,
          child: icon,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30))),
        ),
        Container(
            padding: EdgeInsets.only(top: 4.0),
            width: 10,
            height: 15,
            child: FittedBox(
                fit: BoxFit.none,
                child: Text(
                  title,
                )))
      ],
    );
  }
}
