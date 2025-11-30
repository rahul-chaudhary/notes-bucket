import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_bucket/core/db/database_helper.dart';
import 'app.dart';
import 'core/db/app_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.initDB();


  runApp(const ProviderScope(child: MyApp()));
}



