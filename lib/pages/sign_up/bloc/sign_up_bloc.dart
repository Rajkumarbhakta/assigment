import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<OnSignUpClick>((event, emit) async{
      emit(SignUpLoading());
      if(event.email.isNotEmpty && event.password.isNotEmpty){
        try{
          final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: event.email, password: event.password);
          if(result.user!=null){
            emit(SignUpSuccess("Sign Up Successful"));
          }else{
            emit(SignUpFailed("Something went wrong"));
          }
        }on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            emit(SignUpFailed('The password provided is too weak.'));
          } else if (e.code == 'email-already-in-use') {
            emit(SignUpFailed('The account already exists for that email.'));
          }
        } catch (e) {
          emit(SignUpFailed((e.toString())));
        }
      }else{
        emit(SignUpFailed("Email password required"));
      }
    });
  }
}
