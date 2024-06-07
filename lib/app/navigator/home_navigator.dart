


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/app/navigator/login_navigator.dart';
import 'package:student_management_starter/app/navigator/navigator.dart';
import 'package:student_management_starter/features/home/presentation/view/home_view.dart';

final HomeViewNavigatorProvider = Provider<HomeViewNavigator>((ref){
  return HomeViewNavigator();
});

class HomeViewNavigator with LoginViewRoute{}

mixin HomeViewRoute{
  openHomeView(){
    NavigateRoute.pushRoute(const HomeView());
  }
}