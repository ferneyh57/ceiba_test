import 'package:ceiba_app/domain/model/post/post_model.dart';
import 'package:flutter/material.dart';

class PostPageElement extends StatelessWidget {
  final PostModel post;
  const PostPageElement({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        title: Text(
          post.title ?? "",
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(
          post.body ?? "",
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.black, fontSize: 14),
        ),
      ),
    );
  }
}
