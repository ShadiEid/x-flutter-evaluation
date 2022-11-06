import 'package:easy_localization/easy_localization.dart';
import 'package:formz/formz.dart';

enum InputError { empty, invalid }

class TextInput extends FormzInput<String, InputError> {
  const TextInput.pure([String value = '']) : super.pure(value);
  const TextInput.dirty([String value = '']) : super.dirty(value);

  @override
  InputError? validator(String value) {
    return value.isNotEmpty == true ? null : InputError.empty;
  }
}

extension Explanation on InputError {
  String? get message {
    switch (this) {
      case InputError.empty:
        return "required".tr();
      default:
        return null;
    }
  }
}
