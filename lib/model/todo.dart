import 'package:flutter/cupertino.dart';
import 'package:todo_app/model/task.dart';

class Todo extends ChangeNotifier {
  final List<Task> taskList = [];

  addTask() {
    Task task = Task(
        title: 'title ${taskList.length}', detail: 'this is the task detail');
    taskList.add(task);
    notifyListeners();
  }
}
