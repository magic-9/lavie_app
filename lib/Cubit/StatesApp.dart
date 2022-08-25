import 'package:lavie_app/Models/Forums.dart';
import 'package:lavie_app/Models/User.dart';

abstract class StatesApp{}
class AppStatesInit extends StatesApp{
  AppStatesInit();
}
class StatesChangeNavBottom extends StatesApp{}
class StatesChangeCategory extends StatesApp{}
class StatesIndexForums extends StatesApp{}

class StateRegisterSuccess extends StatesApp{
  User user;
  StateRegisterSuccess(this.user);
}
class StateRegisterError extends StatesApp{
  UserError userError;
  StateRegisterError(this.userError);
}
class StateRegisterLoading extends StatesApp{}

class StateLoginSuccess extends StatesApp{
  User user;
  StateLoginSuccess(this.user);
}
class StateLoginError extends StatesApp{
  UserError userError;
  StateLoginError(this.userError);
}
class StateLoginLoading extends StatesApp{}

class StateGetCurrentUserSuccess extends StatesApp{
  User user;
  StateGetCurrentUserSuccess(this.user);
}
class StateGetCurrentUserError extends StatesApp{
   String message;
  StateGetCurrentUserError(this.message);
}
class StateGetCurrentUserLoading extends StatesApp{}


class StateForumsSuccess extends StatesApp{
  Forums forums;
  StateForumsSuccess(this.forums);
}
class StateForumsError extends StatesApp{
  String error;
  StateForumsError(this.error);
}
class StateForumsLoading extends StatesApp{}

class StateAddPostSuccess extends StatesApp{
  String message;
  StateAddPostSuccess(this.message);
}

class StateAddPostLoading extends StatesApp{

}

class StateAddPostError extends StatesApp{
  String message;
  StateAddPostError(this.message);
}