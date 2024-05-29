part of 'register_cubit.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.loading() = _Loading;

  const RegisterState._();

  bool get isLoading => maybeWhen(
        orElse: () => false,
        loading: () => true,
      );
}
