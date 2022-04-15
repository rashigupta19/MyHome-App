import 'package:abc/UI/signin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:abc/Constant/constant.dart';
import 'package:abc/Splash/splash_screen.dart';
import 'package:abc/UI/bottom_nav.dart';
import 'package:abc/UI/home.dart';

import 'provider/provider.dart';

void main() => runApp(ChangeNotifierProvider<Update>(
      create: (_) => Update(),
      child: MaterialApp(
        home: AnimatedSplashScreen(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryIconTheme: IconThemeData(color: Colors.black),
            primaryColor: Colors.black,
            appBarTheme: AppBarTheme(
              color: Colors.black,
              iconTheme: IconThemeData(color: Colors.white),
            )),
        routes: <String, WidgetBuilder>{
          SPLASH_SCREEN: (BuildContext context) => AnimatedSplashScreen(),
          SIGN_SCREEN: (BuildContext context) => SignIn(),
          // HOME_SCREEN: (BuildContext context) => MyApp(),
        },
      ),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Wrap(children: <Widget>[
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'YOU ARE IN',
                    style: TextStyle(fontSize: 12),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Sector 46, Gurugram',
                        style: TextStyle(fontSize: 15),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ]),
          ])),
      body: Home(),
      bottomNavigationBar: Bottom(),
    );
  }
}
