import '../../styles/style.dart';

abstract class Validator {
  final String errorText;
  final List<Validator> _validators;
  final void Function(String error)? onError;
  Validator(
    this.errorText,
    List<Validator> children, {
    this.onError,
  }) : _validators = children;

  String? validate(String? value);

  @protected
  String? validateChildren(String? value, {bool showFull = false}) {
    String errorString = '';
    for (final validator in _validators) {
      final error = validator.validate(value);
      if (error != null) {
        if (showFull) {
          errorString += "・$error\n";
        } else {
          return error;
        }
      }
    }
    return errorString.isEmpty ? null : errorString;
  }

  static String? Function(String?) validateAll(
    List<Validator> validators, {
    bool showFull = false,
  }) {
    return CompositeValidator(validators, showFull: showFull).validate;
  }
}

class CompositeValidator extends Validator {
  CompositeValidator(List<Validator> children, {this.showFull = false})
      : super('', children);
  final bool showFull;
  @override
  String? validate(String? value) {
    return validateChildren(value, showFull: showFull);
  }
}

class IdValidator extends Validator {
  IdValidator(
    String errorText, {
    void Function(String error)? onError,
  }) : super(errorText, [], onError: onError);

  @override
  String? validate(String? value) {
    if (value!.isEmpty) {
      onError?.call(errorText);
      return errorText;
    }
    onError?.call('');
    return null;
  }
}

class PasswordValidator extends Validator {
  PasswordValidator(
    String errorText, {
    void Function(String error)? onError,
  }) : super(errorText, [], onError: onError);

  @override
  String? validate(String? value) {
    if (value!.isEmpty) {
      onError?.call(errorText);
      return errorText;
    }
    onError?.call('');
    return null;
  }
}
