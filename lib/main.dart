
import 'package:flutter/material.dart';

void main() {
  runApp(const OnlineStoreApp());
}

class OnlineStoreApp extends StatelessWidget {
  const OnlineStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nova Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF635BDB),
        ),
      ),
      home: const StoreHome(),
    );
  }
}

class StoreHome extends StatefulWidget {
  const StoreHome({super.key});

  @override
  State<StoreHome> createState() => _StoreHomeState();
}

class _StoreHomeState extends State<StoreHome> {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Wireless Headphones',
      'price': 2499,
      'icon': Icons.headphones,
      'category': 'Electronics',
    },
    {
      'name': 'Classic Sneakers',
      'price': 1899,
      'icon': Icons.directions_run,
      'category': 'Fashion',
    },
    {
      'name': 'Smart Watch',
      'price': 3299,
      'icon': Icons.watch,
      'category': 'Electronics',
    },
    {
      'name': 'Travel Backpack',
      'price': 1499,
      'icon': Icons.backpack,
      'category': 'Accessories',
    },
    {
      'name': 'Camera',
      'price': 12999,
      'icon': Icons.camera_alt,
      'category': 'Electronics',
    },
    {
      'name': 'Desk Lamp',
      'price': 999,
      'icon': Icons.light,
      'category': 'Home',
    },
  ];

  final Map<String, int> cart = {};
  String search = '';
  String category = 'All';

  @override
  Widget build(BuildContext context) {
    final filtered = products.where((product) {
      final matchesName = product['name']
          .toString()
          .toLowerCase()
          .contains(search.toLowerCase());
      final matchesCategory =
          category == 'All' || product['category'] == category;
      return matchesName && matchesCategory;
    }).toList();

    final width = MediaQuery.sizeOf(context).width;
    final columns = width >= 1000 ? 4 : width >= 650 ? 3 : 2;
    final cartCount = cart.values.fold<int>(0, (a, b) => a + b);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NOVA STORE',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Center(
              child: Badge(
                label: Text('$cartCount'),
                isLabelVisible: cartCount > 0,
                child: const Icon(Icons.shopping_bag_outlined),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Find your next favourite.',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                const Text('Discover products for everyday living.'),
                const SizedBox(height: 20),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search products...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => setState(() => search = value),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  children: [
                    'All',
                    'Electronics',
                    'Fashion',
                    'Accessories',
                    'Home',
                  ].map((item) {
                    return ChoiceChip(
                      label: Text(item),
                      selected: category == item,
                      onSelected: (_) => setState(() => category = item),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: GridView.builder(
                    itemCount: filtered.length,
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      childAspectRatio: width < 400 ? 0.8 : 1.05,
                    ),
                    itemBuilder: (context, index) {
                      final product = filtered[index];
                      final name = product['name'] as String;

                      return Card(
                        clipBehavior: Clip.antiAlias,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Icon(
                                    product['icon'] as IconData,
                                    size: 65,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              ),
                              Text(
                                product['category'] as String,
                                style: const TextStyle(
                                  color: Colors.deepPurple,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      '₹${product['price']}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  IconButton.filledTonal(
                                    onPressed: () {
                                      setState(() {
                                        cart.update(
                                          name,
                                          (quantity) => quantity + 1,
                                          ifAbsent: () => 1,
                                        );
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.add_shopping_cart,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
