part of 'bottom_navigation_bloc.dart';

class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent(this.selectedTab);

  final BottomNavigationItem selectedTab;

  @override
  List<Object> get props => [selectedTab];
}
