import 'package:bloc_app/bloc/add_post/add_post_bloc.dart';
import 'package:bloc_app/bloc/add_post/add_post_state.dart';
import 'package:bloc_app/repositories/post_repository.dart';
import 'package:bloc_app/router/app_router.dart';
import 'package:bloc_app/ui/core/layouts/base_scaffold.dart';
import 'package:bloc_app/ui/core/responsive/screen_type_layout.dart';
import 'package:bloc_app/ui/screens/add_post/mobile/add_post_mobile_screen.dart';
import 'package:bloc_app/ui/widgets/loader/full_screen_loader.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPostBloc(
        postRepository: RepositoryProvider.of<PostRepository>(context),
      ),
      child: Stack(
        children: [
          /// screen
          BaseScaffold(
            /// appBar
            appBar: (context, themeData) => AppBar(
              title: Text("add_post".tr()),
              centerTitle: true,
            ),

            /// layout
            builder: (context, theme) => const SafeArea(
              child: ScreenTypeLayout(
                mobile: AddPostMobileScreen(),
              ),
            ),
          ),

          /// loading widget
          BlocBuilder<AddPostBloc, AddPostState>(
            buildWhen: (previous, current) => previous.loading != current.loading,
            builder: (context, state) {
              if (state.loading) {
                return const FullScreenLoader();
              } else {
                return const SizedBox();
              }
            },
          ),

          /// error/success listener
          BlocListener<AddPostBloc, AddPostState>(
            listener: (context, state) {
              if (state.error != null) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text(state.error.toString()),
                    ),
                  );
              } else if (state.success) {
                appRouter.pop();
              }
            },
            child: const SizedBox(),
          ),
        ],
      ),
    );
  }
}
