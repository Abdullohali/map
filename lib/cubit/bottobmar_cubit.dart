import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:meta/meta.dart';

part 'bottobmar_state.dart';

class BottombarCubit extends Cubit<BottobmarState> {
  BottombarCubit() : super(BottobmarInitial());
  int _currentPageIndex = 0;

  List locations = [
    ["Jarariq 12", 41.34130778976598, 69.17571000716833],
    ["Maktab 299", 41.33990056270199, 69.17860979027202],
    [
      "Respublika bopalar ortaped markazi",
      41.36478982406261,
      69.34492062511545
    ],
    ["Amir Temur Xiyoboni", 41.31124397833541, 69.27965103720506],
    ["Metro Yunus Rajabiy", 41.31388003304186, 69.28339514239002],
    ["Shtab Non", 41.322159685085126, 69.17902998622863],
  ];

  void onBottomBarChanged(int index) {
    _currentPageIndex = index;
    emit(BottobmarInitial());
  }

  GoogleMapController? controller;
  Location currentLocation = Location();
  Set<Marker> markers = {};
  LatLng latLngg = LatLng(41.32343223806224, 69.20421249979806);

  void getLocation() async {
    var location = await currentLocation.getLocation();
    currentLocation.onLocationChanged.listen((LocationData loc) {
      controller
          ?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
        target: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
        zoom: 16.0,
      )));
      print(loc.latitude);
      print(loc.longitude);
      markers.add(Marker(
          markerId: MarkerId('Home'),
          position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)));
      latLngg = LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0);
    });
    emit(BottobmarInitial());
  }

  Future<void> changeLat(double lat, double lng) async {
    currentLocation.onLocationChanged.listen((LocationData loc) async {
      await markers.add(
          Marker(markerId: MarkerId('Position'), position: LatLng(lat, lng)));
      controller
          ?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
        target: LatLng(lat, lng),
        zoom: 18.0,
      )));
      latLngg = LatLng(lat, lng);
    });

    onBottomBarChanged(0);
    emit(BottobmarInitial());
  }

  int get currentPageIndex => _currentPageIndex;
}
