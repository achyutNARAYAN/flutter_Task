import 'package:flutter/material.dart';

class Task {
  String name;
  bool isCompleted;

  Task({required this.name, this.isCompleted = false});
}

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  final TextEditingController _taskController = TextEditingController();
  final List<Task> _tasks = [];

  void _addTask() {
    String taskName = _taskController.text.trim();
    if (taskName.isNotEmpty) {
      setState(() {
        _tasks.add(Task(name: taskName));
        _taskController.clear();
      });
    }
  }

  void _toggleTaskStatus(int index) {
    setState(() {
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
    });
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: const InputDecoration(
                      hintText: 'Enter a task',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addTask,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                Task task = _tasks[index];
                return ListTile(
                  title: Text(
                    task.name,
                    style: TextStyle(
                      decoration:
                          task.isCompleted ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  leading: Checkbox(
                    value: task.isCompleted,
                    onChanged: (_) => _toggleTaskStatus(index),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _removeTask(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
