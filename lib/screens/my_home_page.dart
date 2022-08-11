import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:test_map/cubit/bottobmar_cubit.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
      ),
      body: BlocBuilder<BottombarCubit, BottobmarState>(
        builder: (context, state) {
          BottombarCubit cubit = context.watch<BottombarCubit>();
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              mapType: MapType.normal,
              zoomControlsEnabled: false,
              initialCameraPosition: CameraPosition(
                target: cubit.latLngg,
                zoom: 16.0,
              ),
              onMapCreated: (GoogleMapController controller) {
                context.read<BottombarCubit>().controller = controller;
              },
              markers: cubit.markers,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.location_searching,
          color: Colors.white,
        ),
        onPressed: () {
          context.read<BottombarCubit>().getLocation();
        },
      ),
    );
  }
}
