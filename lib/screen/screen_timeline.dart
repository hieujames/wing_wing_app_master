import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wing_wing/screen/screen_wing_play.dart';

class TimeLineScreen extends StatefulWidget {
  const TimeLineScreen({super.key});

  @override
  State<TimeLineScreen> createState() => _TimeLineScreenState();
}

class _TimeLineScreenState extends State<TimeLineScreen>
    with TickerProviderStateMixin {
  TabController? tabController;
  void handleTabSelection() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 3);
    tabController?.addListener(handleTabSelection);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomCustomize(selectedIndex: 0),
      backgroundColor: const Color(0xFFFFE500),
      body: DefaultTabController(
        length: 3,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 37.0, right: 37.0, top: 48),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'TIMELINE',
                          style: TextStyle(fontSize: 20),
                        ),
                        Icon(Icons.settings)
                      ]),
                  Padding(
                    padding: const EdgeInsets.only(top: 36),
                    child: Row(
                      children: [
                        Container(
                            width: 60,
                            height: 60,
                            child: const Icon(Icons.image),
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                color: Colors.green)),
                        const SizedBox(
                          width: 11,
                        ),
                        const Text('I\'m buzzing buzzing buzzing'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(11, 22, 11, 0),
              child: Container(
                height: 70,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 51.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildItemCard('Photos', '125'),
                      buildItemCard("Videos", "295"),
                      buildItemCard("Followers", "652"),
                      buildItemCard("Follows", "328"),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: TabBar(
                controller: tabController,
                labelColor: Colors.black, //<-- selected text color
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.transparent,
                // ignore: prefer_const_literals_to_create_immutables
                tabs: [
                  Tab(
                    icon: tabController?.index == 0
                        ? SvgPicture.asset(
                            'assets/images/multitasking-black.svg')
                        : SvgPicture.asset(
                            'assets/images/multitasking-grey.svg'),
                  ),
                  const Tab(
                    icon: Icon(
                      Icons.play_circle_outline_outlined,
                    ),
                  ),
                  const Tab(
                    icon: Icon(
                      Icons.person,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
                child: TabBarView(controller: tabController, children: const [
              Center(child: Text('Empty data')),
              pageVideo(),
              Center(child: Text('Empty data')),
              // MyTabTwo(),
              // MyPostTab(),
              // MyReelsTab(),
              // MyTagTab(),
            ])),
          ],
        ),
      ),
    );
  }

  Column buildItemCard(String title, String number) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title),
        Text(
          number,
          style: const TextStyle(fontSize: 20),
        )
      ],
    );
  }
}

class pageVideo extends StatelessWidget {
  const pageVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Stack(children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 17),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            height: 210,
            width: 370,
          ),
          Positioned(
            child: Image.asset('assets/images/pause.png'),
            left: 180,
            top: 85,
          )
        ]);
      },
      itemCount: 2,
    );
  }
}

class BottomCustomize extends StatefulWidget {
  BottomCustomize({super.key, required this.selectedIndex});
  int selectedIndex;
  @override
  State<BottomCustomize> createState() => _BottomCustomizeState();
}

class _BottomCustomizeState extends State<BottomCustomize> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(40),
        topLeft: Radius.circular(40),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: widget.selectedIndex,
        onTap: (data) {
          setState(() {
            widget.selectedIndex = data;
            if (widget.selectedIndex == 0) {
              Navigator.push(
                  context,
                  CupertinoDialogRoute(
                      builder: (context) {
                        return ScreenWingPlay();
                      },
                      context: context));
            }
            if (widget.selectedIndex == 1) {
              Navigator.push(
                  context,
                  CupertinoDialogRoute(
                      builder: (context) {
                        return TimeLineScreen();
                      },
                      context: context));
            }
          });
        },
        selectedItemColor: Colors.red,
        selectedIconTheme: const IconThemeData(color: Colors.red, size: 30.0),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/messengers.png',
                width: 23,
                height: 23,
              ),
              label: ' '),
          BottomNavigationBarItem(
              icon: Image.asset("assets/images/add-group.png",
                  width: 23, height: 23),
              label: ''),
          BottomNavigationBarItem(
              icon:
                  Image.asset("assets/images/movie.png", width: 23, height: 23),
              label: ''),
          BottomNavigationBarItem(
              icon:
                  Image.asset("assets/images/hive.png", width: 23, height: 23),
              label: ''),
          BottomNavigationBarItem(
              icon:
                  Image.asset("assets/images/user.png", width: 23, height: 23),
              label: '')
        ],
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
