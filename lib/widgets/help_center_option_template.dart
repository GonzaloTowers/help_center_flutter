import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpCenterOptionTemplate extends StatelessWidget {
  const HelpCenterOptionTemplate({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final Icon icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
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
          title: Row(
            children: <Widget>[
              Icon(
                icon.icon,
                color: icon.color,
                size: 36.0,
              ),
              const VerticalDivider(),
              Text(
                title,
                style: GoogleFonts.varelaRound(
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0.5,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const <Widget>[],
          ),
        ),
      ),
    );
  }
}
