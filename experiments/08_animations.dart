
import 'package:flutter/material.dart';

void main() {
  runApp(const AnimationExperiment());
}

class AnimationExperiment extends StatelessWidget {
  const AnimationExperiment({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const AnimationDemoScreen(),
    );
  }
}

class AnimationDemoScreen extends StatefulWidget {
  const AnimationDemoScreen({super.key});

  @override
  State<AnimationDemoScreen> createState() => _AnimationDemoScreenState();
}

class _AnimationDemoScreenState extends State<AnimationDemoScreen> {
  bool visible = true;
  bool expanded = false;
  bool shifted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Experiment 8: Animations')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Text(
                'Flutter Animation Gallery',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),

              // Fade animation
              AnimatedOpacity(
                opacity: visible ? 1 : 0.15,
                duration: const Duration(milliseconds: 600),
                child: const Icon(
                  Icons.shopping_bag,
                  size: 90,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: () => setState(() => visible = !visible),
                child: const Text('Toggle Fade'),
              ),

              const Divider(height: 40),

              // Container size and color animation
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                width: expanded ? 240 : 150,
                height: expanded ? 130 : 90,
                decoration: BoxDecoration(
                  color: expanded ? Colors.orange : Colors.deepPurple,
                  borderRadius: BorderRadius.circular(expanded ? 30 : 12),
                ),
                child: const Center(
                  child: Text(
                    'Animated Box',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              FilledButton.tonal(
                onPressed: () => setState(() => expanded = !expanded),
                child: const Text('Resize and recolor'),
              ),

              const Divider(height: 40),

              // Slide animation
              SizedBox(
                height: 100,
                child: AnimatedSlide(
                  offset: shifted ? const Offset(0.6, 0) : Offset.zero,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  child: const Icon(
                    Icons.local_shipping,
                    size: 65,
                    color: Colors.teal,
                  ),
                ),
              ),
              FilledButton.tonal(
                onPressed: () => setState(() => shifted = !shifted),
                child: const Text('Toggle Slide'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
