
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ResponsiveExperiment(),
  ));
}

class ResponsiveExperiment extends StatelessWidget {
  const ResponsiveExperiment({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Experiment 3: Responsive UI'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;

          // Responsive breakpoints
          final columns = width >= 1000
              ? 4
              : width >= 650
                  ? 3
                  : 2;

          final deviceType = width >= 1000
              ? 'Desktop'
              : width >= 650
                  ? 'Tablet'
                  : 'Mobile';

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Responsive Product Gallery',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text('Screen width: ${screenWidth.toStringAsFixed(0)} px'),
                Text('Detected layout: $deviceType'),
                Text('Grid columns: $columns'),
                const SizedBox(height: 16),
                Expanded(
                  child: GridView.builder(
                    itemCount: 12,
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.85,
                    ),
                    itemBuilder: (context, index) {
                      return Card(
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_bag_outlined,
                              size: 48,
                              color: Colors.deepPurple.shade400,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Product ${index + 1}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text('₹${(index + 1) * 499}'),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
