import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/product/logic/cubit/users_cubit.dart';

class UsersView extends StatefulWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  @override
  void initState() {
    super.initState();
    context.read<UsersCubit>().getUsers();
  }

  @override
  Widget build(BuildContext context) {
    final usersCubit = context.watch<UsersCubit>();
    final usersState = usersCubit.state;
    final users = usersState.users;

    switch (usersState.status) {
      case UsersStatus.initial:
        return const Center(child: CircularProgressIndicator());
      case UsersStatus.loading:
        return const Center(child: CircularProgressIndicator());

      case UsersStatus.loaded:
        return Scaffold(
          appBar: AppBar(
            title: Text('Users'),
          ),
          body: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                title: Text(user.name.firstname),
              );
              // return ListTile(
              //   leading: Text(user.id.toString()),
              //   title: Text(user.email),
              //   subtitle: Text(user.phone),
              // );
            },
          ),
        );

      case UsersStatus.error:
        final e = usersState.errorMessage;
        return Center(
          child: Text(e!),
        );
    }
  }
}
