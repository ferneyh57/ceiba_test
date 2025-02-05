
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'post_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class PostModel {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final int? userId;

  @HiveField(2)
  final String? title;

  @HiveField(3)
  final String? body;
  
  PostModel({
    this.id,
    this.userId,
    this.title,
    this.body,
  });
  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
