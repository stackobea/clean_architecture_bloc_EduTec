// Author : stackobea

import 'package:flutter/material.dart';

import 'dl/injection.dart';
import 'features/presentation/pages/landing_view.dart';

// Samples
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: LandingView()));
}
