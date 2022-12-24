import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:getx_template/src/config/app_constants.dart';
import 'package:getx_template/src/formz_model/formz_model.dart';

part 'sign_in_controller.freezed.dart';
part 'sign_in_controller_state.dart';

class SignInController extends GetxController with StateMixin<SignInState> {
  SignInController() {
    value = const SignInState();
  }

  @override
  void onInit() {
    super.onInit();
    change(const SignInState(), status: RxStatus.empty());
  }

  void onEmailChanged(String? value) {
    final email = Email.dirty(value);
    change(state!.copyWith(
      email: email.valid ? email : const Email.pure(),
    ));
  }

  void onPasswordChanged(String? value) {
    final password = Password.dirty(value);
    change(state!.copyWith(
      password: password.valid ? password : const Password.pure(),
    ));
  }

  void signIn() async {
    final status = Formz.validate([state!.email, state!.password]);
    if (status.isPure) {
      change(
        state,
        status: RxStatus.error('Please enter username and password'),
      );
    }
    if (status.isValid) {
      change(state, status: RxStatus.loading());
      await Future.delayed(const Duration(milliseconds: 500));
      change(state, status: RxStatus.success());
      Get.offNamed(AppRoutes.home.path);
    } else {
      change(state, status: RxStatus.error('Invalid username and password'));
    }
  }
}
