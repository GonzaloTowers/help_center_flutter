import 'package:flutter/material.dart';
import 'package:help_center/bloc/model/help_center_model.dart';

@immutable
abstract class HelpCenterState {}

class HelpCenterInitial extends HelpCenterState {}

class HelpCenterLoading extends HelpCenterState {}

class HelpCenterLoaded extends HelpCenterState {
  final HelpCenterModel data;

  HelpCenterLoaded(this.data);
}

class HelpCenterError extends HelpCenterState {}
