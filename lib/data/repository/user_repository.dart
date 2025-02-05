import 'package:ceiba_app/data/datasource/user_data_source.dart';
import 'package:ceiba_app/domain/model/user/user_model.dart';

abstract class UserRepository {
  Future<List<UserModel>> getUsers();
}

class UserRepositoryImpl extends UserRepository {
  final UserDataSource userDataSource;

  UserRepositoryImpl({required this.userDataSource});

  @override
  Future<List<UserModel>> getUsers() {
    return userDataSource.getUsers();
  }
}
