import 'package:notes_bucket/core/network/api_client.dart';
import 'package:notes_bucket/core/network/constants/api_endpoints.dart';
import 'package:notes_bucket/features/notes/data/models/note.dart';

abstract interface class NoteRemoteDatasource {
  Future<Note> addNote(Note note);
  Future<Note> updateNote(Note note);
  Future<void> deleteNote(int noteId);
  Future<List<Note>> fetchNotesByFolderId(int folderId);
  Future<Note?> fetchNoteById(int noteId);
  Future<List<Note>> fetchAllNotes({required int limit, required int offset});
  Future<int> fetchNotesCountByFolderId(int folderId);
}

class NoteRemoteDatasourceImpl implements NoteRemoteDatasource {
  final ApiClient apiClient;

  NoteRemoteDatasourceImpl({required this.apiClient});

  @override
  Future<Note> addNote(Note note) async {
    try{
      final res = await apiClient.post(ApiEndpoints.note, data: note.toJson());
      return NoteMapper.fromJson(res.data);
    } catch(e){
      rethrow;
    }
  }

  @override
  Future<Note> updateNote(Note note) async {
    try{
      final res = await apiClient.put(ApiEndpoints.noteById(note.id), data: note.toJson());
      return NoteMapper.fromJson(res.data);
    } catch(e){
      rethrow;
    }
  }
  @override
  Future<void> deleteNote(int noteId) async {
    try{
      await apiClient.delete(ApiEndpoints.noteById(noteId));
    } catch(e){
      rethrow;
    }
  }

  @override
  Future<List<Note>> fetchNotesByFolderId(int folderId) async {
    try{
      final res = await apiClient.get('${ApiEndpoints.folders}/$folderId/notes');
      final data = res.data['data'] as List;
      return data.map((e) => NoteMapper.fromJson(e)).toList();
    } catch(e){
      rethrow;
    }
  }

  @override
  Future<Note?> fetchNoteById(int noteId) async {
    try{
      final res = await apiClient.get(ApiEndpoints.noteById(noteId));
      return NoteMapper.fromJson(res.data);
    } catch(e){
      rethrow;
    }
  }

  @override
  Future<List<Note>> fetchAllNotes({required int limit, required int offset}) async {
    try{
      final res = await apiClient.get(ApiEndpoints.note, queryParameters: {'limit': limit, 'offset': offset});
      final data = res.data['data'] as List;
      return data.map((e) => NoteMapper.fromJson(e)).toList();
    } catch(e){
      rethrow;
    }
  }

  @override
  Future<int> fetchNotesCountByFolderId(int folderId) async {
    try{
      final res = await apiClient.get('${ApiEndpoints.folders}/$folderId/notes/count');
      return res.data['data'];
    } catch(e){
      rethrow;
    }
  }

}
