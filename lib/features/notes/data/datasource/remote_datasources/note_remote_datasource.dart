import 'package:notes_bucket/core/network/api_client.dart';
import 'package:notes_bucket/core/network/constants/api_endpoints.dart';
import 'package:notes_bucket/features/notes/data/models/note.dart';

abstract interface class NoteRemoteDatasource {
  Future<Note> addNote(String id, String folderId, String? title, String? content);

  Future<Note> updateNote(Note note);

  Future<void> deleteNote(String noteId);

  Future<List<Note>> fetchNotesByFolderId(String folderId);

  Future<Note?> fetchNoteById(String noteId);

  Future<int> fetchNotesCountByFolderId(String folderId);
}

class NoteRemoteDatasourceImpl implements NoteRemoteDatasource {
  final ApiClient apiClient;

  NoteRemoteDatasourceImpl({required this.apiClient});

  @override
  Future<Note> addNote(String id, String folderId, String? title, String? content) async {
    try {
      final res = await apiClient.post(ApiEndpoints.note, data: {
        'id': id,
        'folder_id': folderId,
        'title': title,
        'content': content,
      });
      return NoteMapper.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Note> updateNote(Note note) async {
    try {
      final res = await apiClient.put(ApiEndpoints.note, data: note.toJson());
      return NoteMapper.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteNote(String noteId) async {
    try {
      await apiClient.delete(ApiEndpoints.note, data: {'note_id': noteId});
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Note>> fetchNotesByFolderId(String folderId) async {
    try {
      final res = await apiClient.get(
        ApiEndpoints.note,
        queryParameters: {'folder_id': folderId},
      );
      final data = res.data['notes'] as List;
      return data.map((e) => NoteMapper.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Note?> fetchNoteById(String noteId) async {
    try {
      final res = await apiClient.get(ApiEndpoints.noteById(noteId));
      return NoteMapper.fromJson(res.data['note']);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> fetchNotesCountByFolderId(String folderId) async {
    try {
      final res = await apiClient.get(
        ApiEndpoints.noteCountByFolderId,
        queryParameters: {
          'folder_id': folderId,
        }
      );
      return res.data['count'];
    } catch (e) {
      rethrow;
    }
  }
}
