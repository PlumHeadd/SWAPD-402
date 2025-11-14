import 'package:flutter/material.dart';
import 'tasks_screen_clean.dart';
import 'timer_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF4EFFE),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const SizedBox.shrink(),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle_outline,
                  size: width * 0.10,
                  color: Colors.deepPurple,
                ),

                const SizedBox(height: 12),

                Text(
                  'Welcome to Tasky!',
                  style: TextStyle(
                    fontSize: width * 0.035,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  'Track your tasks and stay productive.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: width * 0.024,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 12),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.purple.shade100,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    '"Focus on being productive, not busy."',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: width * 0.024,
                      fontStyle: FontStyle.italic,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 14,
                  runSpacing: 14,
                  children: [
                    _statCard('0', 'Tasks Today'),
                    _statCard('0', 'Focus Time'),
                    _statCard('0', 'Streak'),
                  ],
                ),

                const SizedBox(height: 20),

                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: [
                    _quickAction(Icons.add, 'Add Task', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const TasksScreen(openAdd: true),
                        ),
                      );
                    }),
                    _quickAction(Icons.timer, 'Start Timer', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const TimerScreen()),
                      );
                    }),
                    _quickAction(Icons.list, 'View Tasks', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const TasksScreen()),
                      );
                    }),
                  ],
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _statCard(String number, String label) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        children: [
          Text(
            number,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _quickAction(IconData icon, String label, VoidCallback? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.deepPurple,
            child: Icon(icon, size: 24, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
