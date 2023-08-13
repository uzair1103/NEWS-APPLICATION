import 'package:api_implementation/Screens/choice_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 15,
              left: -10,
              child: Container(
                width: 400,
                height: 400,
                color: Colors.transparent,
                child: Image.asset('assets/live-feeds.png'),
              ),
            ),
            const Positioned(
              top: 400,
              left: 40,
              child: SizedBox(
                width: 300,
                height: 200,
                child: Text(
                  "Let's Explore The World",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Positioned(
              top: 600,
              left: 90,
              child: Container(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChoiceScreen()));
                  },
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
