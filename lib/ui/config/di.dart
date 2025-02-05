import 'package:ceiba_app/data/datasource/post_data_source.dart';
import 'package:ceiba_app/data/datasource/user_data_source.dart';
import 'package:ceiba_app/data/repository/post_repository.dart';
import 'package:ceiba_app/data/repository/user_repository.dart';
import 'package:ceiba_app/ui/pages/post/bloc/post_bloc.dart';
import 'package:ceiba_app/ui/pages/user/bloc/user_bloc.dart';
import 'package:ceiba_app/ui/utils/hive_manager.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  _general();
  _repositories();
  _dataSources();
  _viewModels();
}

void _general() {
  locator.registerLazySingleton<HiveManager>(() => HiveManager());
}

void _repositories() {
  locator.registerLazySingleton<PostRepository>(() => PostRepositoryImpl(postDataSource: locator()));
  locator.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(userDataSource: locator()));
}

void _dataSources() {
  locator.registerLazySingleton<PostDataSource>(() => PostDataSourceImpl());
  locator.registerLazySingleton<UserDataSource>(() => UserDataSourceImpl());
}

void _viewModels() {
  locator.registerFactory<PostBloc>(() => PostBloc(hiveManager: locator(), postRepository: locator()));
  locator.registerFactory<UserBloc>(() => UserBloc(hiveManager: locator(), userRepository: locator()));
}
