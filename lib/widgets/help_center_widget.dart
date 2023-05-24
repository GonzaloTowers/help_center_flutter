import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpCenterWidget extends StatelessWidget {
  const HelpCenterWidget({
    Key? key,
    required this.title,
    required this.buttons,
  }) : super(key: key);

  final String title;
  final List<Widget> buttons;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.dark,
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.black54,
              ),
              splashRadius: 20.0,
            ),
            title: Text(
              title,
              style: GoogleFonts.varelaRound(
                color: Colors.black54,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0.5,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: buttons,
            ),
          ),
        ),
      ),
    );
  }
}
