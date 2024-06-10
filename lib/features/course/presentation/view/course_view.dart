import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/features/course/domain/entity/course_entity.dart';
import 'package:student_management_starter/features/course/presentation/viewmodel/course_view_model.dart';

class CourseView extends ConsumerStatefulWidget {
  const CourseView({super.key});

  @override
  ConsumerState<CourseView> createState() => _AddCourseViewState();
}

class _AddCourseViewState extends ConsumerState<CourseView> {
  final courseController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var courseState = ref.watch(courseViewModelProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Text(
              'Add Course',
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Brand Bold',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: courseController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Course Name',
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ref.read(courseViewModelProvider.notifier).addCourse(
                      CourseEntity(courseName: courseController.text));
                },
                child: const Text('Add Course'),
              ),
            ),

            //Display List of Courses
            if (courseState.isLoading) ...{
              const Center(child: CircularProgressIndicator()),
            } else if (courseState.error != null) ...{
              Text(courseState.error.toString()),
            } else if (courseState.lstCourse.isEmpty) ...{
              const Center(
                child: Text('No Courses'),
              )
            } else ...{
              Expanded(
                child: ListView.builder(
                  itemCount: courseState.lstCourse.length,
                  itemBuilder: (context, index) {
                    var course = courseState.lstCourse[index];
                    return ListTile(
                      title: Text(course.courseName),
                      subtitle: Text(course.courseId ?? ''),
                      trailing: IconButton(
                          icon: const Icon(Icons.delete), onPressed: () {}),
                    );
                  },
                ),
              )
            }
          ],
        ),
      ),
    );
    //
  }
}
