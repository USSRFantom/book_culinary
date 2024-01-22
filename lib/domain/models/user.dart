import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';

@JsonSerializable(includeIfNull: true)
@HiveType(typeId: 12)
class User extends HiveObject {
  @HiveField(0)
  final int id;

  User(
    this.id,
  );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
