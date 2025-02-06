import 'package:ceiba_app/domain/model/user/user_model.dart';
import 'package:ceiba_app/ui/pages/post/bloc/post_bloc.dart';
import 'package:ceiba_app/ui/pages/post/widgets/post_page_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatefulWidget {
  final UserModel userModel;
  const PostPage({super.key, required this.userModel});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  void initState() {
    context.read<PostBloc>().onInit(widget.userModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba de ingreso'),
        centerTitle: false,
      ),
      body: Builder(
        builder: (context) {
          final postBloc = context.watch<PostBloc>();
          final posts = postBloc.currentUserPosts;
          if (postBloc.state.isLoading) return const Center(child: CircularProgressIndicator());

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  "${widget.userModel.name}",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.phone),
                    const SizedBox(width: 4),
                    Text(
                      "${widget.userModel.phone}",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.email),
                    const SizedBox(width: 4),
                    Text(
                      "${widget.userModel.email}",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                if (posts.isEmpty)
                  const Center(child: Center(child: Text('List is empty')))
                else
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: posts.length,
                      itemBuilder: (BuildContext context, int index) {
                        final post = posts[index];
                        return PostPageElement(post: post);
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
