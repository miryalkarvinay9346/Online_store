
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProviderCartScreen(),
      ),
    ),
  );
}

class CartModel extends ChangeNotifier {
  int quantity = 0;

  void addItem() {
    quantity++;
    notifyListeners();
  }

  void removeItem() {
    if (quantity > 0) {
      quantity--;
      notifyListeners();
    }
  }
}

class ProviderCartScreen extends StatelessWidget {
  const ProviderCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Experiment 5: Provider')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shopping_cart, size: 64),
            const SizedBox(height: 16),
            const Text('Items in cart', style: TextStyle(fontSize: 20)),
            Text(
              '${cart.quantity}',
              style: const TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
              ),
            ),
            FilledButton(
              onPressed: () => context.read<CartModel>().addItem(),
              child: const Text('Add item'),
            ),
            OutlinedButton(
              onPressed: () => context.read<CartModel>().removeItem(),
              child: const Text('Remove item'),
            ),
          ],
        ),
      ),
    );
  }
}
