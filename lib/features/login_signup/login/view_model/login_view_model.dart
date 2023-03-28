import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:placars/core/base/base_model/base_model.dart';

import '../../../../core/constants/enums/navigation_enums.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseModel {
  GlobalKey<FormState> formState = GlobalKey();

  @override
  void setContext(BuildContext context) => baseContext = context;

  @override
  void init() {}

  void moveToOnboard() {
    navigation.router.go(NavigationEnums.onBoardView.routeName);
  }

  bool validateForm() {
    return ((formState.currentState?.validate() ?? false));
  }

  @action
  void registerUser() {
    if (validateForm()) {}
  }
}
