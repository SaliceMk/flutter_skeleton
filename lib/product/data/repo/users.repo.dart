import 'dart:developer';

import 'package:flutter_skeleton/core/error/error_response.exception.dart';
import 'package:flutter_skeleton/product/data/model/users.model.dart';
import 'package:flutter_skeleton/service/chopper_services/api_service.dart';

class UsersRepo {
  UsersRepo({required this.service});

  final APIService service;

  Future<List<UserModel>?> getUsers() async {
    final response = await service.getUsers();

    log(response.bodyString);
    log(response.error.toString());

    if (!response.isSuccessful) {
      final error = response.error;
      final statusCode = response.statusCode.toString();

      throw ErrorResponseException(
        statusCode: statusCode,
        message: error.toString(),
      );
    }

    final users = response.body;
    return users;
  }
}
