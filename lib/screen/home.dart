import 'package:flutter/material.dart';
import 'package:foodie_delivery_app/screen/get_started.dart';

void main() {
  runApp(MaterialApp(
    title: 'Named Routes',
    initialRoute: '/',
    routes: {
      '/': (context) => const HomePage(),
      '/GetStarted': (context) => const GetStarted(),
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffea4534),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 65, bottom: 5),
            child: Row(
              children: const [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  // backgroundImage: NetworkImage(logo),
                  backgroundImage: AssetImage('assets/images/logo.png'),
                  radius: 40,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Column(
                  children: const [
                    Text('Food for',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                            fontStyle: FontStyle.italic)),
                    Text(
                      'Everyone',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 400,
                child: Image.asset('assets/images/bg.png'),
                // child: Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   crossAxisAlignment: CrossAxisAlignment.end,
                //   children: [
                //     Image.asset(
                //       'assets/images/1.png',
                //       height: 250,
                //       width: 200,
                //     ),
                //     Image.asset(
                //       'assets/images/2.png',
                //       height: 150,
                //       width: 150,
                //     )
                //   ],
                // ),
              ),
              const SizedBox(
                height: 0,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(300, 60),
                        primary: Colors.white,
                        onPrimary: const Color(0xffea4534),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GetStarted()),
                      );
                    },
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
