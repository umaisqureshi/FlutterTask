import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/constants.dart';
import '../../Widgets/widgets.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "TaskTracker",
                  style: GoogleFonts.aBeeZee(
                      color: Colors.teal,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              Center(child: imageWidget("assets/splash.png", 300)),
              SizedBox(
                height: size.height * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Work Better,\nTogether",
                      style: GoogleFonts.aBeeZee(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 40,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        splashText,
                        style: GoogleFonts.aBeeZee(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: Center(
                      child: raisedTextButton(() {
                context.go("/HOME");
              }, "Get Started", Theme.of(context).primaryColor)))
            ],
          ),
        ),
      ),
    );
  }
}
