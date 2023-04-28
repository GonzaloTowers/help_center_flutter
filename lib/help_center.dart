library help_center;

import 'package:flutter/material.dart';
import 'package:help_center/utils/utils.dart';
import 'package:help_center/widgets/button_option.dart';
import 'package:help_center/widgets/help_center_option_template.dart';
import 'package:help_center/widgets/help_center_widget.dart';

class HelpCenter {
  static HelpCenter helpCenter = HelpCenter();

  /// Get instance method for helpCenter class
  /// Returns an instance of HelpCenter
  static HelpCenter getInstance() {
    return helpCenter;
  }

  PlainButton getButtonHelpCenter({
    required Icon icon,
    required String title,
    String? subtitle,
    required BuildContext context,
    required List<Widget> optionButtons,
  }) {
    return PlainButton(
      onPressed: () {
        Utils.getInstance().navigate(
          context,
          HelpCenterWidget(
            buttons: optionButtons,
          ),
        );
      },
      leading: icon,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black54,
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.start,
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: const TextStyle(
                color: Colors.black38,
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.start,
            )
          : Container(),
    );
  }

  Widget getOptionButton(
    Icon icon,
    String title,
    String subtitle,
    BuildContext context,
    String urlContent,
  ) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: PlainButton(
        onPressed: () {
          Utils.getInstance().navigate(
            context,
            HelpCenterOptionTemplate(
              icon: icon,
              title: title,
              url: urlContent,
            ),
          );
        },
        leading: icon,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.start,
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            color: Colors.black38,
            fontSize: 20.0,
            fontWeight: FontWeight.w300,
          ),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}
