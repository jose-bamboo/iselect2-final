import 'package:embesys_ctrl/constants.dart';
import 'package:embesys_ctrl/pages/home_page.dart';
import 'package:embesys_ctrl/providers/room_provider.dart';
import 'package:embesys_ctrl/providers/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WeatherProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RoomProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'CTRL - Things Anywhere',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Montserrat',
          textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w800,
            ),
            headline2: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
            headline3: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            headline4: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            button: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/intro_screen.png',
                alignment: Alignment.center,
                scale: 3,
              ),
              SizedBox(height: 10),
              Image.asset(
                'assets/images/splash.png',
                alignment: Alignment.center,
                scale: 4,
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return HomePage();
                          },
                        ),
                      );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    color: boxGrad.colors[1],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
