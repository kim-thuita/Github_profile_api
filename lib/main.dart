import 'package:flutter/material.dart';
import 'package:trial_api/screen/Github_profile.dart';

void main() {
  runApp(MaterialApp(
      initialRoute: 'profile_screen',
      routes: {'profile_screen': (context) => ProfileScreen()}));
}
