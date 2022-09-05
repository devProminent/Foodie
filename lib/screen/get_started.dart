import 'package:flutter/material.dart';
import 'package:foodie_delivery_app/screen/login_tab.dart';
import 'package:foodie_delivery_app/screen/menu.dart';
import 'package:foodie_delivery_app/screen/register_tab.dart';

void main() {
  runApp(MaterialApp(
    title: 'Named Routes',
    initialRoute: '/',
    routes: {
      '/': (context) => const GetStarted(),
      '/menu': (context) => const Menu(),
    },
  ));
}

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            toolbarHeight: 300,
            title: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Image.asset(
                      'assets/images/logo.png',
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 40, left: 50, right: 50),
                  child: TabBar(
                      indicatorColor: Color(0xffea4534),
                      labelColor: Colors.black,
                      tabs: [
                        Tab(
                          text: ('Login'),
                        ),
                        Tab(
                          text: 'Register',
                        ),
                      ]),
                ),
              ],
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(50),
              ),
            ),
          ),
          body: const TabBarView(children: [
            LoginView(),
            RegisterView(),
          ]),
        ),
      ),
    );
  }
}
