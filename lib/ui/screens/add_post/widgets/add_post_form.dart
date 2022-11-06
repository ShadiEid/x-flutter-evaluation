import 'package:bloc_app/bloc/add_post/add_post_bloc.dart';
import 'package:bloc_app/bloc/add_post/add_post_event.dart';
import 'package:bloc_app/bloc/add_post/add_post_state.dart';
import 'package:bloc_app/main.dart';
import 'package:bloc_app/ui/resources/dimensions/dimensions.dart';
import 'package:bloc_app/ui/widgets/animations/customized_animation_widget.dart';
import 'package:bloc_app/ui/widgets/buttons/customized_button.dart';
import 'package:bloc_app/ui/widgets/text_fields/customized_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPostFormWidget extends StatelessWidget {
  const AddPostFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            const SizedBox(height: twoUnits),

            /// post title
            CustomizedAnimatedWidget(
              child: BlocBuilder<AddPostBloc, AddPostState>(
                buildWhen: (previous, current) => previous.title.value != current.title.value,
                builder: (context, state) => CustomizedTextFormField(
                  key: const Key("post_title"),
                  labelText: "title".tr(),
                  textCapitalization: TextCapitalization.words,
                  onTextChanged: (value) => context.read<AddPostBloc>().add(FormTitleChanged(value)),
                ),
              ),
            ),
            const SizedBox(height: twoUnits),

            /// register password
            CustomizedAnimatedWidget(
              child: BlocBuilder<AddPostBloc, AddPostState>(
                buildWhen: (previous, current) => previous.description.value != current.description.value,
                builder: (context, state) => CustomizedTextFormField(
                  key: const Key("post_description"),
                  labelText: "description".tr(),
                  textCapitalization: TextCapitalization.words,
                  onTextChanged: (value) => context.read<AddPostBloc>().add(FormDescriptionChanged(value)),
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            /// add post submit
            CustomizedAnimatedWidget(
              child: BlocBuilder<AddPostBloc, AddPostState>(
                buildWhen: (previous, current) => previous.title.value != current.title.value || previous.description.value != current.description.value,
                builder: (context, state) => SizedBox(
                  width: double.infinity,
                  child: CustomizedButton(
                    enabled: state.title.valid && state.description.valid,
                    child: Text("submit".tr()),
                    callback: () {
                      hideSoftKeyboard(context);
                      context.read<AddPostBloc>().add(const AddPostRequested());
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: twoUnits),
          ],
        )
      ],
    );
  }
}
