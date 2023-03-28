import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:placars/core/base/base_model/base_model.dart';

import '../../../../core/constants/enums/navigation_enums.dart';
part 'sign_up_view_model.g.dart';

class SignUpViewModel = _SignUpViewModelBase with _$SignUpViewModel;

abstract class _SignUpViewModelBase with Store, BaseModel {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formState = GlobalKey();

  @observable
  bool isSecure = false;

  @observable
  bool isUserTermAccepted = true;

  @override
  void setContext(BuildContext context) => baseContext = context;

  @override
  void init() {}

  void moveToOnboard() {
    navigation.router.go(NavigationEnums.onBoardView.routeName);
  }

  @action
  void changeVisibility() {
    isSecure = !isSecure;
  }

  @action
  void changeCertificateAcceptence(bool? newValue) {
    isUserTermAccepted = newValue ?? false;
  }

  bool validateForm() {
    return ((formState.currentState?.validate() ?? false) && isUserTermAccepted);
  }

  @action
  void registerUser() {
    if (validateForm()) {}
  }
}
