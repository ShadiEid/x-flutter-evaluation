class AddPostEvent {
  const AddPostEvent();
}

class FormTitleChanged extends AddPostEvent {
  final String text;
  const FormTitleChanged(this.text);
}

class FormDescriptionChanged extends AddPostEvent {
  final String text;
  const FormDescriptionChanged(this.text);
}

class AddPostRequested extends AddPostEvent {
  const AddPostRequested();
}
