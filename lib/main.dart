import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:msar/firebase_options.dart';
import 'package:msar/src/core/app/app.dart';
import 'package:msar/src/core/di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  setupServiceLocator();

  runApp(const MsarApp());
}
