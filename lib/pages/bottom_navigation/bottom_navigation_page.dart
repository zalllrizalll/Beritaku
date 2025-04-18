import 'package:beritaku/bloc/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:beritaku/config/constant/bottom_navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationPage extends StatelessWidget {
  final Widget child;
  const BottomNavigationPage({super.key, required this.child});

  void _onTabSelected(BuildContext context, int index) {
    final bloc = context.read<BottomNavigationBloc>();
    final tab = BottomNavigationItem.values[index];

    bloc.add(BottomNavigationEvent(tab));
    switch (tab) {
      case BottomNavigationItem.home:
        context.goNamed('home');
        break;
      case BottomNavigationItem.favourite:
        context.goNamed('favourite');
        break;
      case BottomNavigationItem.settings:
        context.goNamed('settings');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.tabItem.index,
            onTap: (index) {
              _onTabSelected(context, index);
            },
            backgroundColor: Colors.blue,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: 'Home',
                tooltip: 'Home',
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.favorite),
                label: 'Favourite',
                tooltip: 'Favourite',
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: 'Settings',
                tooltip: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }
}
