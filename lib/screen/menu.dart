// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodie_delivery_app/main.dart';
import 'package:foodie_delivery_app/screen/favorite.dart';
import 'package:foodie_delivery_app/screen/history.dart';
import 'package:foodie_delivery_app/screen/offers.dart';
import 'package:foodie_delivery_app/screen/orders.dart';
import 'package:foodie_delivery_app/screen/profile.dart';
import 'package:foodie_delivery_app/screen/utilities/drinks_tab.dart';
import 'package:foodie_delivery_app/screen/utilities/foods_tab.dart';
import 'package:foodie_delivery_app/screen/utilities/sauce_tab.dart';
import 'package:foodie_delivery_app/screen/utilities/snacks_tab.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

final user = FirebaseAuth.instance.currentUser!;
// final User? user = Auth().currentUser;

// Future<void> signOut() async {
//   await Auth().signOut();
// }

class _MenuState extends State<Menu> {
  int _currentindex = 0;
  // void _navigateBottomBar(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  //different pages to navigate to
  final pages = [
    Menu(),
    Favorite(),
    Profile(),
    History(),
  ];

  // var currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        //Bottom Navigationbar
        extendBody: true,
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Color(0xffea4534),
          elevation: 0,
          // backgroundColor: Colors.black,
          currentIndex: _currentindex,
          onTap: (index) {
            setState(() {
              _currentindex = index;
            });
          },
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history_outlined),
              label: '',
            ),
          ],
        ),
        // extendBodyBehindAppBar: true,
        backgroundColor: Color(0xffF2F2F2),
        drawer: Drawer(
          backgroundColor: Color(0xffea4534),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, top: 80),
            child: ListView(
              children: [
                ListTile(
                  textColor: Colors.white,
                  iconColor: Colors.white,
                  hoverColor: Colors.white,
                  title: Text('Profile'),
                  leading: Icon(
                    Icons.person_outlined,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Profile()),
                    );
                  },
                ),
                Divider(
                  color: Colors.white,
                ),
                ListTile(
                  textColor: Colors.white,
                  iconColor: Colors.white,
                  hoverColor: Colors.white,
                  title: Text('Orders'),
                  leading: Icon(Icons.shopping_cart_outlined),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Orders()),
                    );
                  },
                ),
                Divider(
                  color: Colors.white,
                ),
                ListTile(
                  textColor: Colors.white,
                  iconColor: Colors.white,
                  hoverColor: Colors.white,
                  title: Text('offer and promo'),
                  leading: Icon(
                    Icons.local_offer_outlined,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Offers()),
                    );
                  },
                ),
                Divider(
                  color: Colors.white,
                ),
                ListTile(
                  textColor: Colors.white,
                  iconColor: Colors.white,
                  hoverColor: Colors.white,
                  title: Text('Privacy and policy'),
                  leading: Icon(
                    Icons.privacy_tip_outlined,
                  ),
                  onTap: () {},
                ),
                Divider(
                  color: Colors.white,
                ),
                ListTile(
                  textColor: Colors.white,
                  iconColor: Colors.white,
                  hoverColor: Colors.white,
                  title: Text('Security'),
                  leading: Icon(
                    Icons.security_outlined,
                  ),
                  onTap: () {},
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: ListTile(
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    hoverColor: Colors.white,
                    title: Text(
                      'Sign-Out',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_outlined,
                      size: 30,
                    ),
                    onTap: () {
                      FirebaseAuth auth = FirebaseAuth.instance;
                      auth.signOut().then((res) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                            (Route<dynamic> route) => false);
                      });
                      // FirebaseAuth.instance.signOut();
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const GetStarted()),
                      // );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xffF2F2F2),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart_checkout),
            )
          ],
          iconTheme: const IconThemeData(
            size: 30,
            color: Colors.black38,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Delicious',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              Text(
                'food for you',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 30),
              // search bar
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xffEFEEEE),
                  borderRadius: BorderRadius.circular(35),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      hintText: 'Search'),
                ),
              ),
              SizedBox(
                height: 30,
              ),

              //Tab bar
              TabBar(
                  indicatorColor: Color(0xffea4534),
                  labelColor: Color(0xffea4534),
                  unselectedLabelColor: Color(0xffCBCBCC),
                  // ignore: prefer_const_literals_to_create_immutables
                  tabs: [
                    Tab(
                      text: 'Foods',
                    ),
                    Tab(
                      text: 'Drinks',
                    ),
                    Tab(
                      text: 'Snacks',
                    ),
                    Tab(
                      text: 'Sauce',
                    )
                  ]),
              // SizedBox(
              //   height: 00,
              // ),
              Expanded(
                  // ignore: prefer_const_literals_to_create_immutables
                  child: TabBarView(children: [
                FoodsTab(),
                DrinksTab(),
                SnacksTab(),
                SauceTab()
              ])),
            ],
          ),
        ),
      ),
    );
  }
}
