import 'package:flutter/material.dart';

@immutable
abstract class HelpCenterEvent {}

class SendData extends HelpCenterEvent {
  final String title;
  final String content;

  SendData(this.title, this.content);
}

class SetContentUrl extends HelpCenterEvent {
  final String url;

  SetContentUrl(this.url);
}
