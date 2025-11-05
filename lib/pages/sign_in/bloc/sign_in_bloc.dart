import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<OnSingInClicked>((event, emit) async{
      emit(SignInLoading());
      if(event.email.isNotEmpty && event.password.isNotEmpty){
        try{
          final result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: event.email, password: event.password);
          if(result.user != null){
            emit(SignInSuccess("Login Successful"));
          }else{
            emit(SignInFailed("Login Failed"));
          }

        }catch(e){
          emit(SignInFailed(e.toString()));
        }

      }else{
        emit(SignInFailed("Email Password Required"));
      }

    });
  }
}
