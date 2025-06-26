import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rankah/feature/home/logic/cubit/home_cubit.dart';

class HomeScreenNavigationBar extends StatelessWidget {
  const HomeScreenNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.black45, blurRadius: 5.0),
            ],
          ),
          child: BottomNavigationBar(
              currentIndex: context.read<HomeCubit>().currentIndex,
              onTap: (value) => context.read<HomeCubit>().changeIndex(value),
              elevation: 10,
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home_outlined),
                  activeIcon: const Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  activeIcon: const Icon(Icons.person),
                  icon: const Icon(Icons.person_outlined),
                  label: "Profile",
                ),
                BottomNavigationBarItem(
                  activeIcon: const Icon(Icons.history_rounded),
                  icon: const Icon(Icons.history_toggle_off_outlined),
                  label: "History",
                ),
              ]),
        );
      },
    );
  }
}
