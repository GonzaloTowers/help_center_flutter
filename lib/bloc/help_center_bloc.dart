import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_center/bloc/event/help_center_event.dart';
import 'package:help_center/bloc/model/help_center_model.dart';
import 'package:help_center/bloc/repository/help_center_repository.dart';
import 'package:help_center/bloc/state/help_center_state.dart';

class HelpCenterBloc extends Bloc<HelpCenterEvent, HelpCenterState> {
  late HelpCenterModel data;
  final HelpCenterRepo helpCenterRepo;

  HelpCenterBloc(this.helpCenterRepo) : super(HelpCenterInitial()) {
    on<HelpCenterEvent>((event, emit) async {
      if (event is SetContentUrl) {
        helpCenterRepo.url = event.url;
      }
      if (event is SendData) {
        emit(HelpCenterLoading());
        await Future.delayed(const Duration(seconds: 3), () async {
          data = await helpCenterRepo.fetchData();
          emit(HelpCenterLoaded(data));
        });
      }
    });
  }
}
