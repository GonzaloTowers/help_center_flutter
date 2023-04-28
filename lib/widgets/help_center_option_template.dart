import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:help_center/bloc/help_center_bloc.dart';
import 'package:help_center/bloc/model/help_center_model.dart';
import 'package:help_center/bloc/repository/help_center_repository.dart';
import 'package:help_center/bloc/state/help_center_state.dart';

class HelpCenterOptionTemplate extends StatelessWidget {
  const HelpCenterOptionTemplate({
    Key? key,
    required this.icon,
    required this.title,
    required this.url,
  }) : super(key: key);

  final Icon icon;
  final String title;
  final String url;

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
          child: BlocConsumer<HelpCenterBloc, HelpCenterState>(
            bloc: HelpCenterBloc(HelpCenterRepo(url)),
            listener: (context, state) {},
            builder: (context, state) {
              if (state is HelpCenterLoaded) {
                return _buildLoadedContent(state.data);
              } else if (state is HelpCenterLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is HelpCenterError) {
                return const Center(
                  child: Text(
                    'Error',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.redAccent,
                    ),
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLoadedContent(HelpCenterModel data) => Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Text(
                data.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                data.content,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      );
}
