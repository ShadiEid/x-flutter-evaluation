import 'package:bloc_app/models/inputs/text_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/post_repository.dart';
import 'add_post_event.dart';
import 'add_post_state.dart';

class AddPostBloc extends Bloc<AddPostEvent, AddPostState> {
  final PostRepository postRepository;

  AddPostBloc({required this.postRepository}) : super(AddPostInitial()) {
    // when title text changed
    on<FormTitleChanged>((event, emit) {
      final title = TextInput.dirty(event.text);
      emit(state.copyWith(title: title));
    });
    // when description text changed
    on<FormDescriptionChanged>((event, emit) {
      final description = TextInput.dirty(event.text);
      emit(state.copyWith(description: description));
    });
    // When User Presses the Add Post Button
    on<AddPostRequested>((event, emit) async {
      final title = state.title.value;
      final description = state.description.value;
      emit(state.loadState());
      try {
        await postRepository.createPost(title: title, description: description);
        emit(state.successState());
      } catch (e) {
        emit(state.errorState(e.toString()));
      }
    });
  }
}
