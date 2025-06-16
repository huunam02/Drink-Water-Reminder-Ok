// import 'package:connectivity_plus/connectivity_plus.dart';

// class CheckNetwork {
//   Future<bool> check() async {
//     var connectivityResult = await (Connectivity().checkConnectivity());
//     if (connectivityResult == ConnectivityResult.mobile) {
//       return true;
//     } else if (connectivityResult == ConnectivityResult.wifi) {
//       return true;
//     } else if (connectivityResult == ConnectivityResult.vpn) {
//       return true;
//     }
//     return false;
//   }

//   dynamic checkInternet(Function func) {
//     check().then((intenet) {
//       if (intenet) {
//         func(true);
//       } else {
//         func(false);
//       }
//     });
//   }
// }
