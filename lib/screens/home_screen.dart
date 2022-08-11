import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_map/screens/location_city.dart';
import 'package:test_map/screens/my_home_page.dart';

import '../cubit/bottobmar_cubit.dart';
import '../widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottombarCubit(),
      child: BlocBuilder<BottombarCubit, BottobmarState>(
        builder: (ctx, state) {
          BottombarCubit cubit = ctx.watch();
          return Scaffold(
            backgroundColor: Colors.white,
            body: _showBody(cubit.currentPageIndex, cubit.onBottomBarChanged),
            bottomNavigationBar: AppBottomNavBar(
                currentIndex: cubit.currentPageIndex,
                onPressed: cubit.onBottomBarChanged),
          );
        },
      ),
    );
  }

  Widget _showBody(int index, final onpressed) {
    switch (index) {
      case 0:
        return  MapScreen();
      case 1:
        return const LocationCityPage();

      default:
        return  MapScreen();
    }
  }
}
