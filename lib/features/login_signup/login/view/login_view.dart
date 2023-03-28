import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:placars/core/base/base_view/base_view.dart';
import 'package:placars/core/extension/context_extensions.dart';
import 'package:placars/features/login_signup/login/view_model/login_view_model.dart';
import 'package:placars/project/constants/project_extensions/translate_extension.dart';

import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../project/constants/image/image_names.dart';
import '../../onboard/view/onboard_view.dart';
import '../../signup/view/sign_up_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
        viewModel: LoginViewModel(),
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
                      filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
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
                          const PlacarsWidget(flex: 3),
                          CustomTextField(
                              label: LocaleKeys.first_page_register_user_name.tranlate,
                              validator: (value) => value?.isNotEmpty ?? false
                                  ? null
                                  : LocaleKeys.first_page_register_this_field_should_be_filled.tranlate),
                          CustomTextField(
                            label: LocaleKeys.first_page_register_email.tranlate,
                            validator: (value) => value?.isNotEmpty ?? false
                                ? null
                                : LocaleKeys.first_page_register_this_field_should_be_filled.tranlate,
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: context.deviceWith / 2,
                                  child: HighSizeStableElevatedButton(
                                      onPressed: viewModel.registerUser,
                                      height: 55,
                                      label: LocaleKeys.first_page_onBoard_login_button.tranlate),
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
