import 'package:ceiba_app/ui/pages/user/bloc/user_bloc.dart';
import 'package:ceiba_app/ui/pages/user/widgets/user_page_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba de ingreso'),
        centerTitle: false,
      ),
      body: Builder(
        builder: (context) {
          final userBloc = context.watch<UserBloc>();
          final users = userBloc.filteredUsers;
          if (userBloc.state.isLoading) return const Center(child: CircularProgressIndicator());

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    userBloc.onSearch(value);
                  },
                ),
                const SizedBox(height: 24),
                if (users.isEmpty)
                  const Center(child: Center(child: Text('List is empty')))
                else
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: users.length,
                      itemBuilder: (BuildContext context, int index) {
                        final user = users[index];
                        return UserPageElement(user: user);
                      },
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
