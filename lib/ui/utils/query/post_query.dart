class PostQuery {
  final String? userId;
  PostQuery({this.userId});
  
  Map<String, dynamic> toJson() {
    if (userId == null) return {};
    return {
      'userId': userId,
    };
  }
}
