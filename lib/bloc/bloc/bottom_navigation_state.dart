part of 'bottom_navigation_bloc.dart';

class BottomNavigationState extends Equatable {
  final BottomNavigationItem tabItem;
  const BottomNavigationState(this.tabItem);

  @override
  List<Object> get props => [tabItem];
}
