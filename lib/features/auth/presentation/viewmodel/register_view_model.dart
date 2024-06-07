import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/app/navigator/navigator.dart';
import 'package:student_management_starter/app/navigator/register_navigator.dart';
import 'package:student_management_starter/features/auth/presentation/view/login_view.dart';

final registerViewModelProvider =
    StateNotifierProvider<RegisterViewModel, void>((ref) {
  final navigator = ref.read(registerViewNavigatorProvider);
  return RegisterViewModel(navigator);
});

class RegisterViewModel extends StateNotifier<void> {
  RegisterViewModel(this.navigator) : super(null);

  final RegisterViewNavigator navigator;

  //opening login page
  void openLoginView() {
    navigator.openLoginView();
  }
}

void openLoginView() {
  NavigateRoute.pushRoute(const LoginView());
  //writing your codes here for dashboard/homeviews
}
