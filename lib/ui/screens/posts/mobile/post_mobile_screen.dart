import 'package:bloc_app/ui/resources/dimensions/dimensions.dart';
import 'package:bloc_app/ui/screens/posts/widgets/post_list.dart';
import 'package:flutter/material.dart';

class PostMobileScreen extends StatelessWidget {
  const PostMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: twoUnits),
      child: const PostList(),
    );
  }
}
