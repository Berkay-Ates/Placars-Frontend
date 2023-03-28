import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:placars/core/base/base_model/base_model.dart';
import 'package:placars/core/constants/enums/navigation_enums.dart';
part 'onboard_view_model.g.dart';

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase with Store, BaseModel {
  @override
  void init() {}

  @override
  void setContext(BuildContext context) => baseContext = context;

  void moveToLogin() {
    navigation.router.go(NavigationEnums.loginView.routeName);
  }

  void moveToSignUp() {
    navigation.router.go(NavigationEnums.singUpView.routeName);
  }
}
