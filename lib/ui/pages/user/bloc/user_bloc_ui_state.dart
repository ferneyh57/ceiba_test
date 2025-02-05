// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ceiba_app/domain/model/user/user_model.dart';

class UserBlocUiState {
  final bool isLoading;
  final List<UserModel> users;
  final String searchQuery;

  UserBlocUiState({
    this.isLoading = false,
    this.users = const [],
    this.searchQuery = '',
  });



  UserBlocUiState copyWith({
    bool? isLoading,
    List<UserModel>? users,
    String? searchQuery,
  }) {
    return UserBlocUiState(
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}
