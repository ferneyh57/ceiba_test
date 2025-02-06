import 'package:ceiba_app/domain/model/user/user_model.dart';
import 'package:ceiba_app/data/api/api.dart';
import 'package:flutter/foundation.dart';

abstract class UserDataSource {
  Future<List<UserModel>> getUsers();
}

class UserDataSourceImpl extends UserDataSource {
  final ApiClient apiClient;

  UserDataSourceImpl({required this.apiClient});
  @override
  Future<List<UserModel>> getUsers() async {
    try {
      return apiClient.getUsers();
    } catch (e) {
      debugPrint('Error at UserDataSourceImpl getUsers: $e');
      return <UserModel>[];
    }
  }
}
