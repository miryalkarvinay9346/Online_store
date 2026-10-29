
void main() {
  print('================================');
  print('EXPERIMENT 1: DART LANGUAGE BASICS');
  print('================================');

  // 1. Variables and data types
  String storeName = 'Nova Store';
  int totalProducts = 8;
  double discount = 10.0;
  bool isStoreOpen = true;

  print('\n1. VARIABLES AND DATA TYPES');
  print('Store Name: $storeName');
  print('Total Products: $totalProducts');
  print('Discount: $discount%');
  print('Store Open: $isStoreOpen');

  // 2. List and Map collections
  List<String> categories = [
    'Electronics',
    'Fashion',
    'Accessories',
    'Home',
  ];

  Map<String, double> prices = {
    'Headphones': 2499.0,
    'Smart Watch': 3299.0,
    'Backpack': 1499.0,
  };

  print('\n2. COLLECTIONS');
  print('Categories: $categories');
  print('Product Prices: $prices');

  // 3. User-defined function
  double calculateDiscountedPrice(double price, double percentage) {
    return price - (price * percentage / 100);
  }

  print('\n3. USER-DEFINED FUNCTION');
  print(
    'Headphones after discount: '
    'Rs. ${calculateDiscountedPrice(2499, discount)}',
  );

  // 4. Conditional statement
  print('\n4. CONDITIONAL STATEMENT');
  if (isStoreOpen) {
    print('$storeName is open for shopping.');
  } else {
    print('$storeName is currently closed.');
  }

  // 5. Loop
  print('\n5. LOOP THROUGH CATEGORIES');
  for (int i = 0; i < categories.length; i++) {
    print('${i + 1}. ${categories[i]}');
  }

  print('\nExperiment 1 completed.');
}
