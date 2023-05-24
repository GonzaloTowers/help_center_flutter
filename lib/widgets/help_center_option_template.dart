import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:help_center/bloc/event/help_center_event.dart';
import 'package:help_center/bloc/help_center_bloc.dart';
import 'package:help_center/bloc/model/help_center_metadata.dart';
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
    return MaterialApp(
      color: Colors.white,
      theme: Theme.of(context).copyWith(
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.dark,
              ),
            ),
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.white),
        splashFactory: InkRipple.splashFactory,
      ),
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
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
            child: BlocProvider(
              create: (context) =>
                  HelpCenterBloc(HelpCenterRepo(url))..add(SetContentUrl(url)),
              child: BlocBuilder<HelpCenterBloc, HelpCenterState>(
                builder: (BuildContext context, state) {
                  if (state is HelpCenterLoaded) {
                    return _buildLoadedContent(
                      state.data,
                      context,
                    );
                  } else if (state is HelpCenterLoading) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.2,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          CircularProgressIndicator(
                            color: Colors.amber,
                            backgroundColor:
                                Colors.amberAccent.withOpacity(0.5),
                          ),
                        ],
                      ),
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
                    context.read<HelpCenterBloc>().add(SendData());
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.amber,
                          backgroundColor: Colors.amberAccent.withOpacity(0.5),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadedContent(
    HelpCenterModel data,
    BuildContext context,
  ) =>
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 1.2,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                data.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              _getContentIfNotEmpty(data.content),
              _processMetadataIfNotEmpty(data.metadata),
            ],
          ),
        ),
      );

  Widget _getContentIfNotEmpty(
    String content,
  ) {
    Widget widget = Container();
    if (content.isNotEmpty) {
      widget = Text(
        content,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black54,
        ),
      );
    }
    return widget;
  }

  Widget _processMetadataIfNotEmpty(
    List<HelpCenterMetadata> metadataList,
  ) {
    List<Widget> listOfWidgets = [];
    Widget widget = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: listOfWidgets,
    );

    for (HelpCenterMetadata metadata in metadataList) {
      switch (metadata.category) {
        case MetadataCategory.title:
          listOfWidgets.add(
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                metadata.stringValue,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
          break;
        case MetadataCategory.subtitle:
          listOfWidgets.add(
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                metadata.stringValue,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          );
          break;
        case MetadataCategory.image:
          // TODO: Handle this case.
          break;
        case MetadataCategory.listItem:
          listOfWidgets.add(
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 8.0,
              ),
              child: Row(
                children: <Widget>[
                  const Text('\u25CF'),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Text(
                      metadata.stringValue,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          );
          break;
        case MetadataCategory.paragraph:
          listOfWidgets.add(
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                metadata.stringValue,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          );
          break;
      }
    }

    return widget;
  }
}
