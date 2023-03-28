// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:placars/core/extension/context_extensions.dart';
import 'package:placars/core/init/lang/locale_keys.g.dart';
import 'package:placars/features/login_signup/onboard/view/onboard_view.dart';
import 'package:placars/project/constants/project_extensions/translate_extension.dart';

import '../../../../core/base/base_view/base_view.dart';
import '../../../../project/constants/image/image_names.dart';
import '../view_model/sign_up_view_model.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SignUpViewModel>(
        viewModel: SignUpViewModel(),
        onModelCreated: ((viewModel) {
          viewModel.setContext(context);
          viewModel.init();
        }),
        onPageBuilder: ((viewModel, context) {
          return Scaffold(
              resizeToAvoidBottomInset: false,
              body: Form(
                key: viewModel.formState,
                child: Stack(
                  children: [
                    SizedBox(
                        height: context.deviceHeight,
                        width: context.deviceWith,
                        child: Image.asset(ImagePaths.instance.backgroundImage, fit: BoxFit.cover)),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Row(children: [
                              IconButton(
                                  onPressed: viewModel.moveToOnboard,
                                  icon: const Icon(
                                    Icons.chevron_left_outlined,
                                    color: Colors.white,
                                    size: 48,
                                  )),
                              const Spacer()
                            ]),
                          ),
                          AnimatedContainer(duration: const Duration(seconds: 2), child: const PlacarsWidget(flex: 3)),
                          CustomTextField(
                            inputType: TextInputType.name,
                            label: LocaleKeys.first_page_register_user_name.tranlate,
                            controller: viewModel.userNameController,
                            textInputAction: TextInputAction.next,
                            validator: (value) => value?.isNotEmpty ?? false
                                ? null
                                : LocaleKeys.first_page_register_this_field_should_be_filled.tranlate,
                          ),
                          CustomTextField(
                            inputType: TextInputType.emailAddress,
                            label: LocaleKeys.first_page_register_email.tranlate,
                            controller: viewModel.emailController,
                            textInputAction: TextInputAction.next,
                            validator: (value) => value?.isNotEmpty ?? false
                                ? null
                                : LocaleKeys.first_page_register_this_field_should_be_filled.tranlate,
                          ),
                          Observer(builder: (_) {
                            return CustomTextField(
                                isObsecured: viewModel.isSecure,
                                label: LocaleKeys.first_page_register_password.tranlate,
                                textInputAction: TextInputAction.done,
                                controller: viewModel.passwordController,
                                validator: (value) => value?.isNotEmpty ?? false
                                    ? null
                                    : LocaleKeys.first_page_register_stronger_password.tranlate,
                                suffix: viewModel.isSecure
                                    ? IconButton(
                                        onPressed: viewModel.changeVisibility,
                                        icon: const Icon(Icons.visibility_off_outlined))
                                    : IconButton(
                                        onPressed: viewModel.changeVisibility,
                                        icon: const Icon(Icons.visibility_outlined)));
                          }),
                          Expanded(
                            flex: 4,
                            child: Column(
                              children: [
                                Observer(builder: (_) {
                                  return NotifierCheckBox(
                                      onChanged: viewModel.changeCertificateAcceptence,
                                      isAccepted: viewModel.isUserTermAccepted,
                                      message: LocaleKeys.first_page_register_user_contract.tranlate);
                                }),
                                SizedBox(
                                  width: context.deviceWith / 2,
                                  child: HighSizeStableElevatedButton(
                                      onPressed: viewModel.registerUser,
                                      height: 55,
                                      label: LocaleKeys.first_page_onBoard_sign_up_button.tranlate),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(flex: 1),
                          const CertificateText()
                        ],
                      ),
                    )
                  ],
                ),
              ));
        }));
  }
}

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      required this.label,
      this.controller,
      this.suffix,
      this.isObsecured,
      this.textInputAction,
      this.validator,
      this.inputType})
      : super(key: key);
  final String label;
  final TextEditingController? controller;
  final Widget? suffix;
  final bool? isObsecured;
  final TextInputAction? textInputAction;
  String? Function(String? value)? validator;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: SizedBox(
          width: context.deviceWith * 0.80,
          child: TextFormField(
              validator: validator,
              textInputAction: textInputAction,
              obscureText: isObsecured ?? false,
              controller: controller,
              keyboardType: inputType,
              decoration: InputDecoration(
                  errorStyle: const TextStyle(color: Colors.orange),
                  suffix: suffix,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  labelStyle: context.themeText.button,
                  label: Text(label),
                  filled: true,
                  fillColor: context.themeColor.onError,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border:
                      const OutlineInputBorder(gapPadding: 0.0, borderRadius: BorderRadius.all(Radius.circular(8.0))))),
        ));
  }
}

class NotifierCheckBox extends StatelessWidget {
  const NotifierCheckBox({
    Key? key,
    required this.message,
    required this.isAccepted,
    required this.onChanged,
  }) : super(key: key);

  final String message;
  final bool isAccepted;
  final Function(bool? value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: isAccepted,
          onChanged: onChanged,
          checkColor: Colors.white,
        ),
        SizedBox(
          width: context.deviceWith * 0.75,
          child: Text(
            message,
            style: context.themeText.bodyLarge?.copyWith(color: context.themeColor.onError),
          ),
        )
      ],
    );
  }
}
