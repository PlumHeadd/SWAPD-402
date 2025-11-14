import 'dart:async';
import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class FocusSession {
  final String name;
  final int durationSeconds;
  final DateTime createdAt;

  FocusSession({required this.name, required this.durationSeconds})
    : createdAt = DateTime.now();
}

class _TimerScreenState extends State<TimerScreen> {
  static const int defaultTime = 1500;
  int remainingSeconds = defaultTime;
  Timer? timer;
  bool isRunning = false;

  final List<FocusSession> sessions = [
    FocusSession(name: '25 min Focus', durationSeconds: 25 * 60),
  ];

  String formatTime(int seconds) {
    final h = seconds ~/ 3600;
    final m = (seconds % 3600) ~/ 60;
    final s = seconds % 60;
    if (h > 0) {
      return "${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}";
    }
    return "${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}";
  }

  void startTimer() {
    if (isRunning || remainingSeconds <= 0) return;

    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (remainingSeconds <= 0) {
        t.cancel();
        setState(() => isRunning = false);
      } else {
        setState(() => remainingSeconds--);
      }
    });

    setState(() => isRunning = true);
  }

  void pauseTimer() {
    timer?.cancel();
    setState(() => isRunning = false);
  }

  void resetTimer([int? toSeconds]) {
    timer?.cancel();
    setState(() {
      isRunning = false;
      remainingSeconds = toSeconds ?? defaultTime;
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void _showCreateSessionModal() {
    final nameController = TextEditingController();
    final hoursController = TextEditingController(text: '0');
    final minutesController = TextEditingController(text: '25');
    final secondsController = TextEditingController(text: '0');

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
          left: 16,
          right: 16,
          top: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Create Focus Session',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: hoursController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Hours',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: minutesController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Minutes',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: secondsController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Seconds',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(ctx),
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      final name = nameController.text.trim().isEmpty
                          ? 'Custom Session'
                          : nameController.text.trim();
                      final h = int.tryParse(hoursController.text.trim()) ?? 0;
                      final m =
                          int.tryParse(minutesController.text.trim()) ?? 0;
                      final s =
                          int.tryParse(secondsController.text.trim()) ?? 0;
                      final total = h * 3600 + m * 60 + s;
                      if (total <= 0) return;

                      setState(() {
                        sessions.add(
                          FocusSession(name: name, durationSeconds: total),
                        );
                      });

                      Navigator.pop(ctx);
                    },
                    child: const Text('Create'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Focus Timer"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Focus Session",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.purpleAccent],
                ),
              ),
              child: Text(
                formatTime(remainingSeconds),
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: startTimer,
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Start"),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: pauseTimer,
                  icon: const Icon(Icons.pause),
                  label: const Text("Pause"),
                ),
                const SizedBox(width: 10),
                OutlinedButton.icon(
                  onPressed: () => resetTimer(),
                  icon: const Icon(Icons.restart_alt),
                  label: const Text("Reset"),
                ),
              ],
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Saved Sessions',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton.icon(
                  onPressed: _showCreateSessionModal,
                  icon: const Icon(Icons.add),
                  label: const Text('Create'),
                ),
              ],
            ),

            const SizedBox(height: 8),

            if (sessions.isEmpty)
              const Text('No sessions yet')
            else
              Column(
                children: sessions.map((s) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      title: Text(s.name),
                      subtitle: Text(
                        'Duration: ${formatTime(s.durationSeconds)}',
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.play_arrow,
                              color: Colors.green,
                            ),
                            onPressed: () {
                              resetTimer(s.durationSeconds);
                              startTimer();
                            },
                            tooltip: 'Start session',
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.redAccent,
                            ),
                            onPressed: () {
                              setState(() => sessions.remove(s));
                            },
                            tooltip: 'Delete session',
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
          ],
        ),
      ),  
    );
  }
}
