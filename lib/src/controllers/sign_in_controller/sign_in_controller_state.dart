part of 'sign_in_controller.dart';

@freezed
@immutable
abstract class SignInState with _$SignInState {
  const factory SignInState({
    @Default(Email.pure()) Email email,
    @Default(Password.pure()) Password password,
  }) = _SignInState;
}
