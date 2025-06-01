import 'package:flutter/material.dart';
import 'app.dart';
import 'core/routes/app_router.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await createRouter();
  runApp(const MyApp());
}