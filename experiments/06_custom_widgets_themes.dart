
import 'package:flutter/material.dart';

void main() {
  runApp(const ThemeExperiment());
}

class ThemeExperiment extends StatelessWidget {
  const ThemeExperiment({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Widgets and Themes',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF635BDB),
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F7FC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF635BDB),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        cardTheme: CardThemeData(
          elevation: 2,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      home: const CustomWidgetsScreen(),
    );
  }
}

// Reusable product information card.
class ProductInfoCard extends StatelessWidget {
  final String name;
  final String category;
  final double price;
  final IconData icon;

  const ProductInfoCard({
    super.key,
    required this.name,
    required this.category,
    required this.price,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: Icon(
                icon,
                color: Theme.of(context).colorScheme.primary,
                size: 28,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    category,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '₹${price.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable styled button.
class StoreButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  const StoreButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
    );
  }
}

class CustomWidgetsScreen extends StatelessWidget {
  const CustomWidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experiment 6: Themes'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Reusable Store Components',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          const Text(
            'The following components share a consistent application theme.',
          ),
          const SizedBox(height: 20),
          const ProductInfoCard(
            name: 'Wireless Headphones',
            category: 'Electronics',
            price: 2499,
            icon: Icons.headphones,
          ),
          const ProductInfoCard(
            name: 'Classic Sneakers',
            category: 'Fashion',
            price: 1899,
            icon: Icons.directions_run,
          ),
          const ProductInfoCard(
            name: 'Travel Backpack',
            category: 'Accessories',
            price: 1499,
            icon: Icons.backpack,
          ),
          const SizedBox(height: 20),
          StoreButton(
            label: 'Explore Store',
            icon: Icons.shopping_bag,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Custom button pressed successfully!'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
