// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mymoney/screen/home/watchlist/home_screen.dart';
// import 'package:mymoney/screen/home/watchlist/watchlist_screen.dart';
//
// import 'all_stocks_screen.dart';
// import 'buy_sell_screen.dart';
//
// // GlobalKey<NavigatorState> watchListRouteScreen = GlobalKey<NavigatorState>();
//
// class WatchListRouteScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Navigator(
//       key: navigatorKeys[0],
//       onGenerateRoute: (RouteSettings settings) {
//         return GetPageRoute(
//           settings: settings,
//           page: () {
//             switch (settings.name) {
//               case '/':
//                 return WatchListScreen();
//               case '/AllStockScreen':
//                 return AllStockScreen();
//             }
//           },
//         );
//       },
//     );
//   }
// }
