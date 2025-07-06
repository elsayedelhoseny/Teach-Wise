import 'package:clean_arch_flutter/features/auth/domain/use_cases/user_rigester_use_case.dart';
import 'package:clean_arch_flutter/features/auth/presentation/register/presentation/manger/register_cubit/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.userRigesterUseCase) : super(UserInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);
  final UserRigesterUseCase userRigesterUseCase;

  Future<void> registerLogin(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {
    emit(RegisterLoading());
    var result = await userRigesterUseCase.call(
        email: email, password: password, name: name, phone: phone);
    result.fold((failure) {
      emit(RegisterFailure(failure.message));
    }, (loginModel) {
      emit(RegisterSuccess(loginModel));
    });
  }
}
