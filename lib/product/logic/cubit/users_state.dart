part of 'users_cubit.dart';

enum UsersStatus {
  initial,
  loading,
  loaded,
  error,
}

class UsersState extends Equatable {
  const UsersState({
    required this.status,
    this.users = const [],
    this.errorMessage,
  });

  final UsersStatus status;
  final List<UserModel> users;
  final String? errorMessage;

  @override
  List<Object?> get props => [
        status,
        users,
        errorMessage,
      ];
}
