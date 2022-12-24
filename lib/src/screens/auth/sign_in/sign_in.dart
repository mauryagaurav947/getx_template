import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getx_template/src/commons/gap.dart';
import 'package:getx_template/src/controllers/controllers.dart';
import 'package:getx_template/src/gen/assets.gen.dart';
import 'package:getx_template/src/l10n/app_localizations.dart';
import 'package:getx_template/src/utils/extensions/size_extension.dart';
import 'package:getx_template/src/utils/palette.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> _obscurePassword = ValueNotifier(true);
  final SignInController _signInController = SignInController();

  @override
  void dispose() {
    super.dispose();
    _signInController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: !Get.find<ThemeController>().isDark
          ? const Color.fromRGBO(241, 240, 242, 1)
          : null,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.helloAgain,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const Gap(10),
                  Text(
                    AppLocalizations.of(context)!.signInWelcomeMsg,
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                  const Gap(40),
                  _userFormField(),
                  const Gap(20),
                  _passwordFormField(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        AppLocalizations.of(context)!.forgotPassword,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  _signInButton(),
                  const Gap(40),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).dividerColor,
                          ),
                          height: 2,
                        ),
                      ),
                      Text(AppLocalizations.of(context)!.orContinueWith),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).dividerColor,
                          ),
                          height: 2,
                        ),
                      ),
                    ],
                  ),
                  const Gap(40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Palette.white,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Assets.brands.google.svg(
                          height: 30,
                          width: 30,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Palette.white,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Assets.brands.apple.svg(
                          height: 30,
                          width: 30,
                          color: Get.find<ThemeController>().isDark
                              ? Palette.white
                              : null,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Palette.white,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Assets.brands.facebook.svg(
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ],
                  ),
                  const Gap(40),
                  Text.rich(
                    TextSpan(
                      text: AppLocalizations.of(context)!.notAMember,
                      children: [
                        const TextSpan(text: ' '),
                        TextSpan(
                          text: AppLocalizations.of(context)!.registerNow,
                          style: const TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _signIn() {
    Get.focusScope!.unfocus();
    if (_formKey.currentState!.validate()) {
      _signInController.signIn();
    }
  }

  Widget _userFormField() {
    return TextFormField(
      validator: _signInController.state!.email.validator,
      onChanged: _signInController.onEmailChanged,
      cursorHeight: 24,
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context)!.enterUsername,
        contentPadding: const EdgeInsets.all(15),
        prefixIcon: const Icon(
          Icons.person,
          size: 25,
        ),
      ),
    );
  }

  Widget _passwordFormField() {
    return ValueListenableBuilder(
      valueListenable: _obscurePassword,
      builder: (context, obscure, child) {
        return TextFormField(
          obscureText: obscure,
          validator: _signInController.state!.password.validator,
          onChanged: _signInController.onPasswordChanged,
          cursorHeight: 24,
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.enterPassword,
            contentPadding: const EdgeInsets.all(15),
            prefixIcon: const Icon(
              FontAwesomeIcons.lock,
              size: 20,
            ),
            suffixIcon: IconButton(
              onPressed: () => _obscurePassword.value = !_obscurePassword.value,
              iconSize: 20,
              icon: Icon(
                obscure ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
              ),
            ),
          ),
          onEditingComplete: _signIn,
        );
      },
    );
  }

  Widget _signInButton() {
    return SizedBox(
      width: context.sw(),
      height: 50,
      child: GetBuilder<SignInController>(
        id: 'signInButton',
        init: _signInController,
        builder: (SignInController controller) {
          if (!controller.status.isLoading) {
            return ElevatedButton(
              onPressed: _signIn,
              child: Text(
                AppLocalizations.of(context)!.signIn,
                style: Theme.of(context).textTheme.button!.copyWith(
                      color: Palette.white,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 3,
              ),
            );
          }
        },
      ),
    );
  }
}
