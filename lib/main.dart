import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        textTheme: GoogleFonts.montserratAlternatesTextTheme(),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ConfettiController _controllerLeft;
  late ConfettiController _controllerRight;

  @override
  void initState() {
    _controllerLeft = ConfettiController(duration: const Duration(seconds: 10));
    _controllerRight =
        ConfettiController(duration: const Duration(seconds: 10));

    _controllerLeft.play();
    _controllerRight.play();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
        body: Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTap: () {
            _controllerLeft.play();
            _controllerRight.play();
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: InteractiveViewer(
                  minScale: 1.5,
                  child: Lottie.network(
                    "https://assets7.lottiefiles.com/packages/lf20_thuioit5.json",
                    frameRate: FrameRate(35),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 240,
                        height: 2,
                        color: Colors.white,
                      ),
                      Text(
                        'Happy',
                        style: theme.headline2!.copyWith(color: const Color(0xFFFEAEF7), letterSpacing: 8,),
                      ),
                      Text(
                        'New',
                        style: theme.headline2!.copyWith(color: Colors.white, letterSpacing: 8,),
                      ),
                      Text(
                        'Year',
                        style: theme.headline2!.copyWith(color: Colors.white, letterSpacing: 8,),
                      ),
                      Text(
                        '2022',
                        style: theme.headline2!.copyWith(color: const Color(0xFF8FD4F3), letterSpacing: 8,),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 200),
            child: ConfettiWidget(
              confettiController: _controllerLeft,
              shouldLoop: true,
              blastDirectionality: BlastDirectionality.explosive,
              blastDirection: -1, // radial value - RIGHT
              emissionFrequency: 0.2,
              maxBlastForce: 30,
              minBlastForce: 15,
              minimumSize: const Size(5,
                  5), // set the minimum potential size for the confetti (width, height)
              maximumSize: const Size(15,
                  15), // set the maximum potential size for the confetti (width, height)
              numberOfParticles: 2,
              gravity: 0.6,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 200),
            child: ConfettiWidget(
              confettiController: _controllerRight,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: true,
              blastDirection: -2, // radia// l value - RIGHT
              emissionFrequency: 0.2,
              maxBlastForce: 30,
              minBlastForce: 15,
              minimumSize: const Size(5,
                  5), // set the minimum potential size for the confetti (width, height)
              maximumSize: const Size(15,
                  15), // set the maximum potential size for the confetti (width, height)
              numberOfParticles: 2,
              gravity: 0.6,
            ),
          ),
        ),
      ],
    ));
  }

  @override
  void dispose() {
    _controllerLeft.dispose();
    super.dispose();
  }
}
