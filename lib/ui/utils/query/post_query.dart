
class PostQuery {
  final int? userId;
  PostQuery({this.userId});
  
  Map<String, dynamic> toJson() {
    if (userId == null) return {};
    return {
      'userId': userId,
    };
  }
}
