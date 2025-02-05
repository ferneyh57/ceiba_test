
import 'package:equatable/equatable.dart';

class PostQuery extends Equatable{
  final int? userId;
  const PostQuery({this.userId});
  
  Map<String, dynamic> toJson() {
    if (userId == null) return {};
    return {
      'userId': userId,
    };
  }
  
  @override
  List<Object?> get props => [userId];
}
