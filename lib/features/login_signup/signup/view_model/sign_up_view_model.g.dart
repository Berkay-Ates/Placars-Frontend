// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignUpViewModel on _SignUpViewModelBase, Store {
  late final _$isSecureAtom =
      Atom(name: '_SignUpViewModelBase.isSecure', context: context);

  @override
  bool get isSecure {
    _$isSecureAtom.reportRead();
    return super.isSecure;
  }

  @override
  set isSecure(bool value) {
    _$isSecureAtom.reportWrite(value, super.isSecure, () {
      super.isSecure = value;
    });
  }

  late final _$isUserTermAcceptedAtom =
      Atom(name: '_SignUpViewModelBase.isUserTermAccepted', context: context);

  @override
  bool get isUserTermAccepted {
    _$isUserTermAcceptedAtom.reportRead();
    return super.isUserTermAccepted;
  }

  @override
  set isUserTermAccepted(bool value) {
    _$isUserTermAcceptedAtom.reportWrite(value, super.isUserTermAccepted, () {
      super.isUserTermAccepted = value;
    });
  }

  late final _$_SignUpViewModelBaseActionController =
      ActionController(name: '_SignUpViewModelBase', context: context);

  @override
  void changeVisibility() {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.changeVisibility');
    try {
      return super.changeVisibility();
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCertificateAcceptence(bool? newValue) {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.changeCertificateAcceptence');
    try {
      return super.changeCertificateAcceptence(newValue);
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void registerUser() {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.registerUser');
    try {
      return super.registerUser();
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSecure: ${isSecure},
isUserTermAccepted: ${isUserTermAccepted}
    ''';
  }
}
