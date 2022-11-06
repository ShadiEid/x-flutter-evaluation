import 'package:bloc_app/models/data/post.dart';
import 'package:flutter/material.dart';

class PostListItem extends StatelessWidget {
  final Post post;
  const PostListItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      leading: Text('${post.id}', style: textTheme.caption),
      title: Text(
        post.title ?? "-",
        style: textTheme.bodyLarge,
      ),
      isThreeLine: true,
      subtitle: Text(post.body ?? "-"),
      dense: true,
    );
  }
}
