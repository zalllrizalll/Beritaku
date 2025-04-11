import 'package:beritaku/config/constant/bottom_navigation_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc()
    : super(BottomNavigationState(BottomNavigationItem.home)) {
    on<BottomNavigationEvent>((event, emit) {
      emit(BottomNavigationState(event.selectedTab));
    });
  }
}
