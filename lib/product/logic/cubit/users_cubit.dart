import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_skeleton/core/core.dart';
import 'package:flutter_skeleton/product/data/model/users.model.dart';
import 'package:flutter_skeleton/product/data/repo/users.repo.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit({required this.repo})
      : super(const UsersState(status: UsersStatus.initial));
  final UsersRepo repo;

  Future<void> getUsers() async {
    if (_isBusy) return;
    emit(const UsersState(status: UsersStatus.loading));

    try {
      final users = await repo.getUsers();
      emit(UsersState(
        status: UsersStatus.loaded,
        users: users ?? [],
      ));
    } on ErrorResponseException catch (error) {
      emit(UsersState(
        status: UsersStatus.error,
        errorMessage: error.message,
      ));
    } catch (e) {
      final erroMessage = e.toString();
      emit(UsersState(
        status: UsersStatus.error,
        errorMessage: erroMessage,
      ));
    }
  }

  bool get _isBusy => state.status == UsersStatus.loading;
}
