import 'package:flutter/material.dart';

@immutable
abstract class HelpCenterEvent {}

class SendData extends HelpCenterEvent {
  SendData();
}

class SetContentUrl extends HelpCenterEvent {
  final String url;

  SetContentUrl(this.url);
}
