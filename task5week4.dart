import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path; // Import path correctly

void main() {
  runApp(const MaterialApp(
    home: TaskListScreen(),
  ));
}

class Task {
  final int id;
  final String name;
  bool isDone;

  Task({required this.id, required this.name, this.isDone = false});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isDone': isDone ? 1 : 0,
    };
  }

  @override
  String toString() {
    return 'Task{id: $id, name: $name, isDone: $isDone}';
  }
}

// Define your Task class here as before...

class TaskDatabase {
  static const _databaseName = 'tasks.db';
  static const _databaseVersion = 1;

  static Database? _database;

  TaskDatabase._privateConstructor();
  static final TaskDatabase instance = TaskDatabase._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final documentsDirectory =
        await getDatabasesPath(); // Use getDatabasesPath() for sqflite
    final pathToDatabase = path.join(documentsDirectory, _databaseName);
    return await openDatabase(pathToDatabase,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tasks (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        isDone INTEGER NOT NULL
      )
    ''');
  }

  Future<int> insertTask(Task task) async {
    final db = await instance.database;
    return await db.insert('tasks', task.toMap());
  }

  Future<List<Task>> fetchTasks() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('tasks');
    return List.generate(maps.length, (i) {
      return Task(
        id: maps[i]['id'],
        name: maps[i]['name'],
        isDone: maps[i]['isDone'] == 1,
      );
    });
  }

  Future<void> updateTask(Task task) async {
    final db = await instance.database;
    await db.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<void> deleteTask(int id) async {
    final db = await instance.database;
    await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final TextEditingController _taskController = TextEditingController();
  final List<Task> _tasks = [];

  @override
  void initState() {
    super.initState();
    _fetchTasks();
  }

  Future<void> _fetchTasks() async {
    final tasks = await TaskDatabase.instance.fetchTasks();
    setState(() {
      _tasks.clear();
      _tasks.addAll(tasks);
    });
  }

  Future<void> _addTask(String name) async {
    final task = Task(
        id: DateTime.now().millisecondsSinceEpoch, name: name, isDone: false);
    await TaskDatabase.instance.insertTask(task);
    await _fetchTasks();
  }

  Future<void> _toggleTask(Task task) async {
    await TaskDatabase.instance.updateTask(task);
    await _fetchTasks();
  }

  Future<void> _deleteTask(int id) async {
    await TaskDatabase.instance.deleteTask(id);
    await _fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: const InputDecoration(
                      hintText: 'Enter task name',
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () async {
                    if (_taskController.text.isNotEmpty) {
                      await _addTask(_taskController.text);
                      _taskController.clear();
                    }
                  },
                  child: const Text('Add Task'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return ListTile(
                  onTap: () => _toggleTask(task),
                  onLongPress: () => _deleteTask(task.id),
                  title: Text(
                    task.name,
                    style: TextStyle(
                      decoration:
                          task.isDone ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  trailing: Checkbox(
                    value: task.isDone,
                    onChanged: (value) => _toggleTask(task),
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
