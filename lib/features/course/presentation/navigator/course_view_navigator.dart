import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/app/navigator/navigator.dart';
import 'package:student_management_starter/features/course/presentation/view/course_view.dart';

final loginViewNavigatorProvider = Provider((ref) => CourseViewNavigator());

class CourseViewNavigator {}

mixin CourseViewRoute {
  openCourseView() {
    NavigateRoute.popAndPushRoute(const CourseView());
  }
}
