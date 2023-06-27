library help_center;

import 'package:flutter/material.dart';
import 'package:help_center/utils/utils.dart';
import 'package:help_center/widgets/button_plain.dart';
import 'package:help_center/widgets/custom_expansion_panel.dart';
import 'package:help_center/widgets/help_center_no_widget_option_template.dart';
import 'package:help_center/widgets/help_center_option_template.dart';
import 'package:help_center/widgets/help_center_widget.dart';

class HelpCenter {
  static HelpCenter helpCenter = HelpCenter();

  /// Get instance method for helpCenter class
  /// Returns an instance of HelpCenter
  static HelpCenter getInstance() {
    return helpCenter;
  }

  /// Gets the initial button for Help Center.
  /// It takes as parameter a list of optionButtons which will be
  /// later displayed within the Help Center Options screen.
  ///
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
            title: title,
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
      backgroundColor: const Color(0xFFF2F2FA),
    );
  }

  /// Gets an option type button for Help Center Options.
  /// It takes as parameter the url for the content which will be
  /// later displayed within the Help center Option Template Screen
  ///
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
        backgroundColor: Colors.white,
      ),
    );
  }

  /// Gets a void function which can be used directly to give
  /// functionality to a custom button.
  /// This method does not provide any widget, only the action which can be
  /// implemented within a button type widget.
  ///
  void Function()? getOnPressedFunctionality({
    Icon? icon,
    String? title,
    required BuildContext context,
    required String urlContent,
  }) {
    return () => Utils.getInstance().navigate(
          context,
          HelpCenterOptionTemplate(
            icon: icon ?? const Icon(Icons.info_outline_rounded),
            title: title ?? '',
            url: urlContent,
          ),
        );
  }

  /// Gets an expansion panel to display the Help Center Options.
  /// This method takes as parameter the list of ExpansionPanelItems that
  /// will be displayed within the expansion panel.
  ///
  Widget getExpansionPanel({
    required List<ExpansionPanelItem> items,
    void Function(int, bool)? expansionCallback,
  }) {
    return CustomExpansionPanelList(
      expansionCallback: expansionCallback,
      children: items.map<ExpansionPanel>((ExpansionPanelItem item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: item.headerValue,
            );
          },
          body: ExpansionPanelCard(
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                item.url != null
                    ? HelpCenterOptionNoWidgetTemplate(
                        url: item.url!,
                      )
                    : item.expandedValue,
              ],
            ),
          ),
          isExpanded: item.isExpanded,
          canTapOnHeader: true,
        );
      }).toList(),
    );
  }
}
