import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../model/models.dart';
import '../repository/auth_repository.dart';
export '../../app/cubit/app_cubit.dart';
import 'package:meta/meta.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthRepository _authRepository = AuthRepository();


  AuthCubit() : super(LandingState()){
    checkLogin();
  }


  Future checkLogin()async{
    emit(AuthLoadingState());
    try{
      bool isLoggedIn = await _authRepository.isSignedIn();
    if(isLoggedIn){
      String _userID = await _authRepository.getUser();
      print("authCheck");
      print(_userID);
      emit(AuthAppState(uuid:_userID));
    }else{
      emit(LandingState());
    }
    }catch (e){
      emit(AuthErrorState());
    }
  }

  Future login({@required LoginModel loginModel})async{
    emit(AuthLoadingState());

    try{ _authRepository.signInWithCredentials(loginModel);
    checkLogin();
   }catch (e){
     emit(AuthErrorState());
   }
  }

  Future logout()async{
    _authRepository.signOut();
    await checkLogin();
  }

  Future signup({@required SignUpModel signupModel})async{
    emit(AuthLoadingState());

    try{ _authRepository.signUp(signupModel);
    checkLogin();
    }catch (e){
      emit(AuthErrorState());
    }
  }
}
