import 'package:ceiba_app/domain/model/user/user_model.dart';

abstract class UserDataSource {
  Future<List<UserModel>> getUsers();
}

class UserDataSourceImpl extends UserDataSource {
  @override
  Future<List<UserModel>> getUsers() {
    throw UnimplementedError();
  }
}