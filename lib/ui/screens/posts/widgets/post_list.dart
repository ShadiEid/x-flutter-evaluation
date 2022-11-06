import 'package:bloc_app/bloc/post/post_bloc.dart';
import 'package:bloc_app/bloc/post/post_event.dart';
import 'package:bloc_app/bloc/post/post_state.dart';
import 'package:bloc_app/ui/widgets/animations/customized_animation_widget.dart';
import 'package:bloc_app/ui/widgets/loader/progress_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'post_item.dart';

class PostList extends StatefulWidget {
  const PostList({super.key});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<PostBloc>().add(PostFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        switch (state.status) {
          case PostStatus.failure:
            return Center(child: Text('failed_to_fetch_posts'.tr()));
          case PostStatus.success:
            if (state.posts.isEmpty) {
              return Center(child: Text('no_posts'.tr()));
            }
            return SingleChildScrollView(
              controller: _scrollController,
              child: ListView.custom(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                childrenDelegate: SliverChildBuilderDelegate(
                  (context, index) => CustomizedAnimatedWidget(
                    child: PostListItem(
                      key: ValueKey(state.posts[index].id),
                      post: state.posts[index],
                    ),
                  ),
                  childCount: state.posts.length,
                  findChildIndexCallback: (key) {
                    return state.posts.indexWhere((element) => element.id == (key as ValueKey).value);
                  },
                  addSemanticIndexes: true,
                ),
              ),
            );
          case PostStatus.initial:
            return const Center(child: AppProgressBar());
        }
      },
    );
  }
}
