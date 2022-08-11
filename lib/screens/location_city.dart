import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_map/cubit/bottobmar_cubit.dart';

class LocationCityPage extends StatefulWidget {
  const LocationCityPage({Key? key}) : super(key: key);

  @override
  State<LocationCityPage> createState() => _LocationCityPageState();
}

class _LocationCityPageState extends State<LocationCityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Locations"),
      ),
      body: BlocBuilder<BottombarCubit, BottobmarState>(
        builder: (context, state) {
          return SizedBox(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () async {
                    await context.read<BottombarCubit>().changeLat(
                        context.read<BottombarCubit>().locations[index][1],
                        context.read<BottombarCubit>().locations[index][2]);
                  },
                  title:
                      Text(context.watch<BottombarCubit>().locations[index][0]),
                  trailing:
                      Text(context.watch<BottombarCubit>().locations[index][0]),
                );
              },
              itemCount: context.watch<BottombarCubit>().locations.length,
            ),
          );
        },
      ),
    );
  }
}
