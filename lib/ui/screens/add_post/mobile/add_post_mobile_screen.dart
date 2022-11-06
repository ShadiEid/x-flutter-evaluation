import 'package:bloc_app/ui/core/layouts/base_scroll_view.dart';
import 'package:bloc_app/ui/resources/dimensions/dimensions.dart';
import 'package:bloc_app/ui/screens/add_post/widgets/add_post_form.dart';
import 'package:flutter/material.dart';

class AddPostMobileScreen extends StatelessWidget {
  const AddPostMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: twoUnits),
        child: AddPostFormWidget(),
      ),
    );
  }
}
