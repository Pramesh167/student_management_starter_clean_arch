import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/app/navigator/login_navigator.dart';
import 'package:student_management_starter/app/navigator/navigator.dart';
import 'package:student_management_starter/features/auth/presentation/view/login_view.dart';

final registerViewNavigatorProvider =
    Provider((ref) => RegisterViewNavigator());

class RegisterViewNavigator with LoginViewRoute {}

//which view calls me, mixin i am where they call me
mixin RegisterViewRoute {
  openRegisterView() {
    NavigateRoute.pushRoute(const LoginView());
  }
}
