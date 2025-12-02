import 'package:notes_bucket/core/db/database_helper.dart';
import 'package:notes_bucket/features/notes/data/models/folder.dart';

abstract interface class FolderLocalDataSource {

  Future<Folder> create(Folder folder);

  Future<List<Folder>> fetchRootFolders();

  Future<List<Folder>> fetchFoldersByParentId(int parentId);

}

class FolderLocalDataSourceImpl implements FolderLocalDataSource {
  final DatabaseHelper databaseHelper;

  FolderLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<Folder> create(Folder folder) => databaseHelper.createFolder(folder);

  @override
  Future<List<Folder>> fetchRootFolders() => databaseHelper.fetchRootFolders();

  @override
  Future<List<Folder>> fetchFoldersByParentId(int parentId) => databaseHelper.fetchFoldersByParentId(parentId);


  }