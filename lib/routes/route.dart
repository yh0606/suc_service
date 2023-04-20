import 'package:flutter/material.dart';

import '../main.dart';
import '../screens/account.dart';
import '../screens/home/dashboard.dart';
import '../screens/login.dart';
import '../screens/coming_soon.dart';
import '../screens/maps.dart';
import '../screens/register.dart';
import '../screens/booking/booking_detail.dart';
import '../screens/booking/booking_list.dart';
import '../screens/welcome.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case RouteList.welcome:
        return MaterialPageRoute(builder: (_) => const Welcome());
      case RouteList.login:
        return MaterialPageRoute(builder: (_) => const Login());
      case RouteList.register:
        return MaterialPageRoute(builder: (_) => const Register());
      case RouteList.dashboard:
        return MaterialPageRoute(builder: (_) => const Dashboard());
      case RouteList.booking:
        return MaterialPageRoute(builder: (_) => const BookingList());
      case RouteList.bookingDetail:
        return MaterialPageRoute(builder: (_) => const BookingDetail());
      case RouteList.account:
        return MaterialPageRoute(builder: (_) => const Account());
      case RouteList.comingsoon:
        return MaterialPageRoute(builder: (_) => const ComingSoon());
      case RouteList.myMap:
        return MaterialPageRoute(builder: (_) => const MyMap());
      default:
        return MaterialPageRoute(builder: (_) => const MyApp());
    }
  }
}

class RouteList {
  static const String welcome = '/Welcome';
  static const String login = '/Login';
  static const String register = '/Register';
  static const String dashboard = '/Dashboard';
  static const String booking = '/Booking';
  static const String bookingDetail = '/BookingDetail';
  static const String account = '/Account';
  static const String comingsoon = '/comingSoon';
  static const String myMap = '/myMap';
}
