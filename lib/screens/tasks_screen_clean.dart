import 'package:flutter/material.dart';

class TasksScreen extends StatefulWidget {
  final bool openAdd;
  const TasksScreen({super.key, this.openAdd = false});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class Task {
  final int id;
  final String title;
  final String description;
  bool isImportant;
  bool isFinished;
  final DateTime createdAt;
  final DateTime? dueAt;

  Task({
    required this.id,
    required this.title,
    required this.description,
    this.isImportant = false,
    this.isFinished = false,
    required this.createdAt,
    this.dueAt,
  });
}

class _TasksScreenState extends State<TasksScreen> {
  final List<Task> tasks = [];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  DateTime? _selectedDue;
  bool _isImportant = false;
  int _nextId = 1;

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.openAdd) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => _showAddModal(context),
      );
    }
  }

  void _showAddModal(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      isScrollControlled: true,
      builder: (c) => Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: MediaQuery.of(c).viewInsets.bottom + 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Add New Task",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _descController,
                decoration: const InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 8),
              CheckboxListTile(
                value: _isImportant,
                onChanged: (v) => setState(() => _isImportant = v ?? false),
                title: const Text('Mark as important / urgent'),
                controlAffinity: ListTileControlAffinity.leading,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDue == null
                          ? 'No due date set'
                          : 'Due: ${_formatDateTime(_selectedDue!)}',
                    ),
                  ),
                  TextButton(
                    onPressed: () => _pickDueDate(c),
                    child: const Text('Pick due date'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _titleController.clear();
                        _descController.clear();
                        _selectedDue = null;
                        _isImportant = false;
                      });
                      Navigator.pop(c);
                    },
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => _addTaskAndClose(c),
                    child: const Text('Add Task'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addTaskAndClose(BuildContext ctx) {
    final title = _titleController.text.trim();
    if (title.isEmpty) return;

    final newTask = Task(
      id: _nextId++,
      title: title,
      description: _descController.text.trim(),
      isImportant: _isImportant,
      createdAt: DateTime.now(),
      dueAt: _selectedDue,
    );

    setState(() {
      tasks.add(newTask);
      _titleController.clear();
      _descController.clear();
      _selectedDue = null;
      _isImportant = false;
    });

    Navigator.pop(ctx);
  }

  Future<void> _pickDueDate(BuildContext ctx) async {
    final date = await showDatePicker(
      context: ctx,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
    );
    if (date == null) return;

    final time = await showTimePicker(
      context: ctx,
      initialTime: TimeOfDay.now(),
    );

    setState(() {
      _selectedDue = DateTime(
        date.year,
        date.month,
        date.day,
        time?.hour ?? 0,
        time?.minute ?? 0,
      );
    });
  }

  String _formatDateTime(DateTime dt) {
    return "${dt.year.toString().padLeft(4, '0')}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')} ${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Your Tasks"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () => _showAddModal(context),
        child: const Icon(Icons.add),
      ),
      body: tasks.isEmpty
          ? const Center(
              child: Text("No tasks yet!", style: TextStyle(fontSize: 18)),
            )
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final t = tasks[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 12,
                    ),
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundColor: t.isImportant
                          ? Colors.redAccent
                          : Colors.deepPurple,
                      child: Text(
                        '${t.id}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    title: Text(
                      t.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        decoration: t.isFinished
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    subtitle: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (t.description.isNotEmpty)
                          Text(
                            t.description,
                            style: TextStyle(
                              decoration: t.isFinished
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        const SizedBox(height: 4),
                        Text(
                          'Created: ${_formatDateTime(t.createdAt)}',
                          style: const TextStyle(fontSize: 12),
                        ),
                        if (t.dueAt != null)
                          Text(
                            'Due: ${_formatDateTime(t.dueAt!)}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black87,
                            ),
                          ),
                      ],
                    ),
                    isThreeLine: t.description.isNotEmpty || t.dueAt != null,
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          iconSize: 20,
                          padding: const EdgeInsets.all(4),
                          constraints: const BoxConstraints(
                            minWidth: 36,
                            minHeight: 36,
                          ),
                          icon: Icon(
                            t.isFinished
                                ? Icons.check_circle
                                : Icons.radio_button_unchecked,
                            color: t.isFinished ? Colors.green : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() => t.isFinished = !t.isFinished);
                          },
                          tooltip: t.isFinished
                              ? 'Mark as unfinished'
                              : 'Mark as finished',
                        ),
                        const SizedBox(width: 6),
                        IconButton(
                          iconSize: 20,
                          padding: const EdgeInsets.all(4),
                          constraints: const BoxConstraints(
                            minWidth: 36,
                            minHeight: 36,
                          ),
                          icon: Icon(
                            t.isImportant ? Icons.star : Icons.star_border,
                            color: t.isImportant ? Colors.amber : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() => t.isImportant = !t.isImportant);
                          },
                          tooltip: t.isImportant
                              ? 'Unmark important'
                              : 'Mark important',
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
