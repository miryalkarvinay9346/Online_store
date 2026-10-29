
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: WidgetsExperiment(),
  ));
}

class WidgetsExperiment extends StatelessWidget {
  const WidgetsExperiment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experiment 2: Flutter Widgets'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Flutter Widget Gallery',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Demonstrating basic widgets and layout structures.',
            ),
            const SizedBox(height: 20),

            // Container and Text widgets
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                'Container + Text',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Row widget
            const Text(
              '1. Row Layout',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.phone_android, size: 40, color: Colors.blue),
                Icon(Icons.laptop, size: 40, color: Colors.green),
                Icon(Icons.watch, size: 40, color: Colors.orange),
              ],
            ),
            const SizedBox(height: 20),

            // Column widget
            const Text(
              '2. Column Layout',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Product: Wireless Headphones'),
                Text('Category: Electronics'),
                Text('Price: ₹2,499'),
              ],
            ),
            const SizedBox(height: 20),

            // Stack widget
            const Text(
              '3. Stack Layout',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 150,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  const Icon(
                    Icons.shopping_bag,
                    size: 65,
                    color: Colors.deepPurple,
                  ),
                  const Positioned(
                    bottom: 10,
                    right: 10,
                    child: Chip(label: Text('Featured')),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Image widget with an offline fallback
            const Text(
              '4. Image Widget',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Image.network(
              'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500',
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 180,
                  color: Colors.grey.shade200,
                  child: const Center(
                    child: Icon(Icons.image_not_supported, size: 50),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            const Text(
              'The Image widget displays product imagery. '
              'The fallback icon appears if loading fails.',
            ),
          ],
        ),
      ),
    );
  }
}
