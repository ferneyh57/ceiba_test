import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class UserModel with EquatableMixin {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final String? email;

  @HiveField(3)
  final String? phone;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  List<Object?> get props => [id, name, email, phone];
}
