import 'package:ceiba_app/data/repository/user_repository.dart';
import 'package:ceiba_app/domain/model/user/user_model.dart';
import 'package:ceiba_app/ui/pages/user/bloc/user_bloc_ui_state.dart';
import 'package:ceiba_app/ui/utils/constants.dart';
import 'package:ceiba_app/ui/utils/hive_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Cubit<UserBlocUiState> {
  final HiveManager hiveManager;
  final UserRepository userRepository;

  UserBloc({
    required this.hiveManager,
    required this.userRepository,
  }) : super(UserBlocUiState()) {
    _onInit();
  }

  _onInit() async {
    emit(state.copyWith(isLoading: true));
    final localUsers = hiveManager.getMany<UserModel>(USER_BOX);
    if (localUsers?.isNotEmpty == true) {
      emit(state.copyWith(users: localUsers, isLoading: false));
      return;
    }
    final remoteUsers = await userRepository.getUsers();
    hiveManager.save(USER_BOX, remoteUsers);
    emit(state.copyWith(users: remoteUsers, isLoading: false));
  }
}
