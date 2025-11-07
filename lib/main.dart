import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'core/db/app_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = AppDatabase();

  // await database
  //     .into(database.FolderItems)
  //     .insert(
  //   FolderItemsCompanion.insert(
  //     title: 'todo: finish drift setup',
  //     content: 'We can now write queries and define our own tables.',
  //   ),
  // );
  List<FolderItem> allItems = await database.select(database.folderItems).get();

  print('items in database: $allItems');
  runApp(const ProviderScope(child: MyApp()));
}



