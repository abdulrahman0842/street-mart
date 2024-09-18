// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';

// class Testi extends StatefulWidget {
//   const Testi({super.key});

//   @override
//   State<Testi> createState() => _TestiState();
// }

// class _TestiState extends State<Testi> {
//   String _currentLocation = "Location not determined";

//   Future<void> _getLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       setState(() {
//         _currentLocation = "Location service disabled";
//       });
//       return;
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//     }
//     if (permission == LocationPermission.denied) {
//       setState(() {
//         _currentLocation = "Location Permission Denied";
//       });
//       return;
//     }

//     if (permission == LocationPermission.deniedForever) {
//       setState(() {
//         _currentLocation =
//             "Location Permission Denied forever manually grant permission";
//       });
//       return;
//     }

//     //Get Current Posiiton
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     setState(() {
//       _currentLocation =
//           "Latitude:${position.latitude},Longitude:${position.longitude}";
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("get Location"),
//       ),
//       // backgroundColor: Colors.black,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(_currentLocation),
//             ElevatedButton(
//                 onPressed: () {
//                   _getLocation();
//                 },
//                 child: const Text("Get Location"))
//           ],
//         ),
//       ),
//     );
//   }
// }