// This is Currently not in use

// class GetShopLocationService{
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

// }