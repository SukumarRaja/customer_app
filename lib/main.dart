import 'dart:io';
import 'package:flutter/material.dart';
import 'app/responsive/responsive.dart';
import 'app/services/http/http_over_ride.dart';
import 'app/ui/screens/initial/initial.dart';

void main() async {
  if (ResponsiveHelper.isMobilePhone()) {
    HttpOverrides.global = MyHttpOverrides();
  }
  // WidgetsFlutterBinding.ensureInitialized();

  // Map<String, Map<String, String>> languages = await di.init();
  // var body = NotificationRes();
  runApp(
    InitialPage(),
  );
}
