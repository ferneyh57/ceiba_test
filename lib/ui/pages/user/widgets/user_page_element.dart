import 'package:ceiba_app/domain/model/user/user_model.dart';
import 'package:flutter/material.dart';

class UserPageElement extends StatelessWidget {
  final UserModel user;
  const UserPageElement({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        title: Text(
          user.name ?? "",
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.phone, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 4),
                Text(user.phone ?? ""),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.email, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 4),
                Text(user.email ?? ""),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "VER PUBLICACIONES",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
