import 'package:bloc_app/bloc/post/post_bloc.dart';
import 'package:bloc_app/bloc/post/post_event.dart';
import 'package:bloc_app/repositories/post_repository.dart';
import 'package:bloc_app/router/app_router.dart';
import 'package:bloc_app/ui/core/responsive/screen_type_layout.dart';
import 'package:bloc_app/ui/resources/colors/colors.dart';
import 'package:bloc_app/ui/screens/posts/mobile/post_mobile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(
        postRepository: RepositoryProvider.of<PostRepository>(context),
      )..add(PostFetched()),
      child: Scaffold(
        body: const ScreenTypeLayout(
          mobile: PostMobileScreen(),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: DesignColors.primaryColor,
          onPressed: () => appRouter.push(const AddPost()),
        ),
      ),
    );
  }
}
