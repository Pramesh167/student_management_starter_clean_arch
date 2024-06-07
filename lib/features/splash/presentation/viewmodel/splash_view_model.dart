//when  we navigate we alwasy navigate thru viewmodel

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/app/navigator/splash_navigator.dart';


final splashViewModelProvider=StateNotifierProvider<SplashViewModel,void>((ref){
  final navigator =ref.read(splashViewNavigatorProvider);
  return SplashViewModel(navigator);
});

class SplashViewModel extends StateNotifier<void> {
  SplashViewModel(this.navigator) : super(null);
  

  final SplashViewNavigator navigator;

  //opening login page
  void openLoginView() {
    Future.delayed(const Duration(seconds: 2), () {
      navigator.openLoginView();
    });
  }

  void openHomeView(){
    //writing your codes here for dashboard/homeviews
  }
}
