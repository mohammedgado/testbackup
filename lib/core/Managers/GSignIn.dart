// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'dart:io' show Platform;
//
// class GSignIn {
//   final GoogleSignIn _googleSignIn = kIsWeb
//       ? GoogleSignIn(
//           clientId:
//               "828257622620-225311rg9f2el453urmsim52ieds0aic.apps.googleusercontent.com",
//           scopes: [
//             'email',
//           ],
//         )
//       : Platform.isAndroid
//           ? GoogleSignIn(
//               scopes: [
//                 'email',
//               ],
//             )
//           : GoogleSignIn(
//               clientId:
//                   "828257622620-70ba966hm8gdtdk4f5lrfrq6fib1j35k.apps.googleusercontent.com",
//               scopes: [
//                 'email',
//               ],
//             );
//   Future<dynamic> handleSignIn() async {
//     try {
//       return await _googleSignIn.signIn();
//     } catch (error) {
//       print(error);
//     }
//   }
// }
