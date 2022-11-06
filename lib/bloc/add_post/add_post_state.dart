import '../../models/inputs/text_input.dart';

class AddPostState {
  final bool loading;
  final TextInput title;
  final TextInput description;
  final String? error;
  final bool success;

  const AddPostState({
    this.loading = false,
    this.title = const TextInput.pure(),
    this.description = const TextInput.pure(),
    this.error,
    this.success = false,
  });

  AddPostState copyWith({
    TextInput? title,
    TextInput? description,
    bool? loading,
    String? error,
    bool? success,
  }) {
    return AddPostState(
      title: title ?? this.title,
      description: description ?? this.description,
      loading: loading ?? this.loading,
      error: error ?? this.error,
      success: success ?? this.success,
    );
  }

  AddPostState loadState() {
    return AddPostState(
      title: title,
      description: description,
      loading: true,
      error: null,
    );
  }

  AddPostState errorState(String? error) {
    return AddPostState(
      title: title,
      description: description,
      loading: false,
      error: error,
    );
  }

  AddPostState successState() {
    return AddPostState(
      title: title,
      description: description,
      loading: false,
      error: null,
      success: true,
    );
  }
}

class AddPostInitial extends AddPostState {
  const AddPostInitial();
}
