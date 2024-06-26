import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/features/batch/presentation/navigator/batch_navigator.dart';
import 'package:student_management_starter/features/course/presentation/navigator/course_view_navigator.dart';
import 'package:student_management_starter/features/home/presentation/navigator/home_navigator.dart';
import 'package:student_management_starter/app/navigator/navigator.dart';
import 'package:student_management_starter/features/auth/presentation/navigator/register_navigator.dart';
import 'package:student_management_starter/features/auth/presentation/view/login_view.dart';

final LoginViewNavigatorProvider = Provider((ref) => LoginViewNavigator());

class LoginViewNavigator with RegisterViewRoute, HomeViewRoute,BatchViewRoute ,CourseViewRoute{}

mixin LoginViewRoute {
  openLoginView() {
    NavigateRoute.pushRoute(const LoginView());
  }
}
