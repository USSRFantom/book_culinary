import 'package:book_culinary/domain/models/recipe.dart';
import 'package:book_culinary/domain/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'comment.g.dart';

@JsonSerializable(includeIfNull: true)
@HiveType(typeId: 11)
class Comment extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String text;
  @HiveField(2)
  final String photo;
  @HiveField(3)
  final String datetime;
  @HiveField(4)
  final User? user;
  @HiveField(5)
  final Recipe? recipe;

  Comment(this.id, this.text, this.photo, this.datetime, this.user, this.recipe);

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
}
