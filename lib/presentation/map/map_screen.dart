import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:limona/presentation/resources/color_manager.dart';
import 'package:permission_handler/permission_handler.dart';

import '../orders/orders_screen.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  var c;
  late double lat, lang;
  CameraPosition? _kGooglePlex;
  GoogleMapController? gmc;
  StreamSubscription<Position>? ps;
  bool showLoader = false;
  late LatLng initPos;

  Set<Marker> myMarker = {};

  Future askLocationPermission() async {
    var status = await Permission.location.status;
    if (status.isGranted == false) {
      await Permission.location.request();
    }
    if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  Future<Position?> getCurrentPosition() async {
    try {
      initPos = (await Geolocator.getCurrentPosition()) as LatLng;
      return await Geolocator.getCurrentPosition();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> getLatLang() async {
    setState(() {
      showLoader = true;
    });
    c = await Geolocator.getCurrentPosition().then((value) => value);
    setState(() {
      showLoader = false;
    });
    if (c == null) {
      print('cant get location');
    }

    _kGooglePlex = CameraPosition(
      target: LatLng(c.latitude, c.longitude),
      zoom: 15,
    );
    initPos = LatLng(c.latitude, c.longitude);
    setState(() {});
  }

  void GoToPos(Position? position) {
    gmc?.animateCamera(CameraUpdate.newLatLng(
        LatLng(position?.latitude ?? 0, position?.longitude ?? 0)));
  }

  @override
  void initState() {
    askLocationPermission();
    getLatLang();
    setMarkers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: ColorManager.primaryColor,
              title: Image.asset(
                "assets/images/limona.png",
                width: 60,
                height: 80,
              ),
              centerTitle: true,
              leading: InkWell(
                  onTap: () {

                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(
                      Icons.notifications_none,
                      color: ColorManager.secondaryColor,
                      size: 25,
                    ),
                  )),
              actions: [
                InkWell(
                    onTap: () {
                      Get.to(()=> OrdersScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Icon(
                        Icons.menu,
                        color: ColorManager.secondaryColor,
                        size: 25,
                      ),
                    ))
              ],
            ),
            body: showLoader
                ? Center(child: CircularProgressIndicator())
                : Stack(
              children: [
                _kGooglePlex == null
                    ? Container(
                    height: MediaQuery.of(context).size.height,
                    child: Center(child: CircularProgressIndicator()))
                    : Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: GoogleMap(
                    zoomControlsEnabled: false,
                    markers: myMarker,
                    mapType: MapType.normal,
                    initialCameraPosition:
                    CameraPosition(target: initPos, zoom: 16),
                    onMapCreated:
                        (GoogleMapController controller) async {
                      gmc = controller;

                      var pos = await getCurrentPosition();
                      if (pos == null) return;

                      GoToPos(pos);
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }


  setMarkers() async {
    BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/pp.png",
    );
    await getLatLang();
   for(int i =0 ; i<4;i++){
     myMarker.add(Marker(
       markerId: MarkerId(i.toString()),
       position: LatLng(double.parse((c.latitude-(i*0.003)).toString()),
           double.parse((c.longitude).toString())),
       infoWindow:InfoWindow(title: '5'),
       icon: markerbitmap,
     ));

     myMarker.add(Marker(
       markerId: MarkerId((i+4).toString()),
       position: LatLng(double.parse((c.latitude- (i*0.002)).toString()),
           double.parse((c.longitude+ 0.003 ).toString())),
       infoWindow:InfoWindow(title: '5'),
       icon: markerbitmap,
     ));
   }


    setState(() {});
  }
}
