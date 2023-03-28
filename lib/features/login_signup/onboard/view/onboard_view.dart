// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:placars/core/base/base_view/base_view.dart';
import 'package:placars/core/extension/context_extensions.dart';
import 'package:placars/core/init/lang/locale_keys.g.dart';
import 'package:placars/features/login_signup/onboard/view_model/onboard_view_model.dart';
import 'package:placars/project/constants/image/image_names.dart';
import 'package:placars/project/constants/project_extensions/translate_extension.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
        viewModel: OnBoardViewModel(),
        onModelCreated: ((viewModel) {
          viewModel.setContext(context);
          viewModel.init();
        }),
        onPageBuilder: ((viewModel, context) {
          return Scaffold(
              body: Stack(
            children: [
              SizedBox(
                  height: context.deviceHeight,
                  width: context.deviceWith,
                  child: Image.asset(ImagePaths.instance.backgroundImage, fit: BoxFit.cover)),
              Column(children: [
                const Spacer(flex: 5),
                const PlacarsWidget(flex: 7),
                const Spacer(flex: 3),
                Expanded(
                    flex: 8,
                    child: Center(
                      child: SizedBox(
                        width: context.deviceWith / 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            HighSizeStableElevatedButton(
                                onPressed: viewModel.moveToLogin,
                                height: 50,
                                label: LocaleKeys.first_page_onBoard_login_button.tranlate),
                            HighSizeStableElevatedButton(
                                onPressed: viewModel.moveToSignUp,
                                height: 50,
                                label: LocaleKeys.first_page_onBoard_sign_up_button.tranlate),
                            Text(
                              LocaleKeys.first_page_onBoard_button_below_text.tranlate,
                              textAlign: TextAlign.center,
                              style: context.themeText.bodyLarge
                                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      ),
                    )),
                const CertificateText()
              ]),
            ],
          ));
        }));
  }
}

class PlacarsWidget extends StatelessWidget {
  const PlacarsWidget({
    Key? key,
    required this.flex,
  }) : super(key: key);

  final int flex;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0
        ? const SizedBox.shrink()
        : Expanded(
            flex: flex,
            child: Column(
              children: [
                Text(LocaleKeys.first_page_onBoard_title.tranlate,
                    style: context.themeText.headline3
                        ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 8)),
                Text(LocaleKeys.first_page_onBoard_small_title.tranlate,
                    style: context.themeText.bodyLarge?.copyWith(color: Colors.white)),
              ],
            ),
          );
  }
}

class CertificateText extends StatelessWidget {
  const CertificateText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Text(LocaleKeys.first_page_onBoard_certificate.tranlate,
            style: context.themeText.bodyLarge?.copyWith(color: Colors.white), textAlign: TextAlign.center));
  }
}

class HighSizeStableElevatedButton extends StatelessWidget {
  const HighSizeStableElevatedButton({
    Key? key,
    required this.height,
    required this.label,
    this.onPressed,
  }) : super(key: key);

  final double height;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
        child: Text(
          label,
          style: context.themeText.headline6?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
