import 'package:notes_bucket/core/network/api_client.dart';
import 'package:notes_bucket/core/network/constants/api_endpoints.dart';
import 'package:notes_bucket/features/notes/data/models/folder.dart';

abstract interface class FolderRemoteDatasource {
  Future<Folder> addFolder(String id, String name, String? parentId);

  Future<Folder> updateFolder(String id, String? name, String? parentId);

  Future<String> deleteFolder(String folderId);

  Future<Folder> fetchFolderByID(String folderId);
}

class FolderRemoteDatasourceImpl implements FolderRemoteDatasource {
  final ApiClient apiClient;

  FolderRemoteDatasourceImpl({required this.apiClient});

  @override
  Future<Folder> addFolder(String id, String name, String? parentId) async {
    try {
      final response = await apiClient.post(
        ApiEndpoints.folder,
        data: {'id': id, 'name': name, 'parent_id': parentId},
      );
      return FolderMapper.fromJson(response.data['folder']);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Folder> updateFolder(String id, String? name, String? parentId) async {
    try {
      final response = await apiClient.put(
        ApiEndpoints.folder,
        data: {'id': id, 'name': name, 'parent_id': parentId},
      );
      return FolderMapper.fromJson(response.data['folder']);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> deleteFolder(String folderId) async {
    try {
      final response = await apiClient.delete(
        ApiEndpoints.folder,
        data: {'id': folderId},
      );
      return response.data['message'];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Folder> fetchFolderByID(String folderId) async {
    try {
      final response = await apiClient.get(
        ApiEndpoints.folder,
        queryParameters: {'id': folderId},
      );
      return FolderMapper.fromJson(response.data['folder']);
    } catch (e) {
      rethrow;
    }
  }

}
