
import 'package:flutter/material.dart';

void main() {
  runApp(const StateManagementExperiment());
}

class StateManagementExperiment extends StatelessWidget {
  const StateManagementExperiment({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'State Management Experiment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StateDemoScreen(),
    );
  }
}

// StatefulWidget and setState demonstration.
class StateDemoScreen extends StatefulWidget {
  const StateDemoScreen({super.key});

  @override
  State<StateDemoScreen> createState() => _StateDemoScreenState();
}

class _StateDemoScreenState extends State<StateDemoScreen> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Experiment 5: State Management')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Part A: setState()',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text('Shopping cart quantity'),
              Text(
                '$quantity',
                style: const TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: quantity > 0
                        ? () => setState(() => quantity--)
                        : null,
                    icon: const Icon(Icons.remove_circle_outline),
                  ),
                  IconButton(
                    onPressed: () => setState(() => quantity++),
                    icon: const Icon(Icons.add_circle_outline),
                  ),
                ],
              ),
              const Divider(height: 36),
              const Text(
                'Part B: Shared state with InheritedWidget',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'InheritedWidget is a Flutter primitive for sharing '
                'data down a widget tree. It is not the Provider package.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const SharedCounterDemo(),
            ],
          ),
        ),
      ),
    );
  }
}

class CounterScope extends InheritedWidget {
  final int value;

  const CounterScope({
    super.key,
    required this.value,
    required super.child,
  });

  static CounterScope? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterScope>();
  }

  @override
  bool updateShouldNotify(CounterScope oldWidget) {
    return value != oldWidget.value;
  }
}

class SharedCounterDemo extends StatefulWidget {
  const SharedCounterDemo({super.key});

  @override
  State<SharedCounterDemo> createState() => _SharedCounterDemoState();
}

class _SharedCounterDemoState extends State<SharedCounterDemo> {
  int sharedValue = 0;

  @override
  Widget build(BuildContext context) {
    return CounterScope(
      value: sharedValue,
      child: Column(
        children: [
          Builder(
            builder: (context) {
              final scope = CounterScope.maybeOf(context);
              return Text(
                'Shared value: ${scope?.value ?? 0}',
                style: const TextStyle(fontSize: 20),
              );
            },
          ),
          const SizedBox(height: 8),
          FilledButton(
            onPressed: () => setState(() => sharedValue++),
            child: const Text('Increment shared value'),
          ),
        ],
      ),
    );
  }
}
