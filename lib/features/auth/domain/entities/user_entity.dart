import 'package:dart_mappable/dart_mappable.dart';

part 'user_entity.mapper.dart';

@MappableClass()
class UserEntity {
  final String id;
  final String email;
  final String? username;
  final bool subscriptionActive;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;


  const UserEntity({
    required this.id,
    required this.email,
    required this.username,
    required this.subscriptionActive,
    required this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });


}