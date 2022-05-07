import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geo_coding;

part 'location_state.dart';
part 'location_cubit.freezed.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(const LocationState.initial());
  Location location = Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData locationData;

  List<geo_coding.Placemark>? placemarks;

  double lat = 0;
  double long = 0;

  Future<void> checkService() async {
    emit(const LocationState.loading());
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        emit(const LocationState.error('Service not available'));
      }
    }
  }

  Future<void> checkPermission() async {
    emit(const LocationState.loading());
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        emit(const LocationState.error('Permission not granted'));
      }
    }
  }

  Future<bool> checkStatus() async {
    bool status = false;
    await checkService();
    await checkPermission();
    if (_serviceEnabled && _permissionGranted == PermissionStatus.granted) {
      status = true;
    }
    return status;
  }

  Future<void> getLocation() async {
    emit(const LocationState.loading());
    bool status = await checkStatus();
    if (status) {
      locationData = await location.getLocation();
      await geo_coding.placemarkFromCoordinates(
        locationData.latitude!,
        locationData.longitude!,
      );
      lat = locationData.latitude!;
      long = locationData.longitude!;

      emit(const LocationState.success());
    }
  }

  Future<void> getAddress(LatLng latLng) async {
    try {
      emit(const LocationState.loading());
      await geo_coding.placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );
      lat = latLng.latitude;
      long = latLng.longitude;
      emit(const LocationState.addressFetched());
    } catch (e) {
      emit(LocationState.error(e.toString()));
    }
  }
}
