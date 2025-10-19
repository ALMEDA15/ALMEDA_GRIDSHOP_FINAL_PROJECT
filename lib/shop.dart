import 'package:flutter/material.dart';
import 'package:flutter_my_grocery_app_1/app_drawer.dart';
import 'package:flutter_my_grocery_app_1/product.dart';
import 'package:flutter_my_grocery_app_1/provider.dart';
import 'package:flutter_my_grocery_app_1/cart.dart';
import 'package:provider/provider.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  double _parsePrice(String priceString) {
    try {
      final cleaned = priceString.replaceAll(RegExp(r'[^0-9.]'), '');
      if (cleaned.isEmpty) return 0.0;
      return double.parse(cleaned);
    } catch (e) {
      return 0.0;
    }
  }

  // Original Product Details
  final List<String> originalImages = [
    'https://jblstore.com.ph/cdn/shop/files/JBLTune670NC_Black_2_600x.png?v=1757250555',
    'https://i02.appmifile.com/133_operatorx_operatorx_opx/25/06/2023/af1cc31c5b732c0ce504f440373772e2.png',
    'https://jblstore.com.ph/cdn/shop/files/JBLClip3_Black_Front_2000x.png?v=1757250596',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBl6cL05qUXM-CTv_e1zxV5Tx6wwQdorUpWw&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsNeXy0UpPgRENMVowqlzLUEwelTJmer--pw&s',
    'https://ecommerce.datablitz.com.ph/cdn/shop/products/ezgif.com-gif-maker_bbb12a89-5663-43d4-ac27-c0aceb7746c3_800x.png?v=1739859987',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSV3ITe88MV8gDD1WBTr-tzx0co6FrafgNOiQ&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrsvaL_rIatM5UjyIUc9bEubfpT7JbPivEnQ&s',
  ];

  final List<String> originalNames = [
    'Wireless Headphones',
    'Smart Watch',
    'Bluetooth Speaker',
    'Mechanical Keyboard',
    'Gaming Mouse',
    'Gaming Headset',
    'Anker Power Bank',
    'Samsung A14 Phone',
  ];

  final List<String> originalPrices = [
    '\₱599',
    '\₱899',
    '\₱299',
    '\₱799',
    '\₱499',
    '\₱699',
    '\₱249',
    '\₱1,999',
  ];

  final List<String> originalVendors = [
    'Tech Store',
    'Gadget World',
    'Audio Hub',
    'Keyboard Zone',
    'Gaming Gear',
    'Headphone Haven',
    'Power Solutions',
    'Samsung Official',
  ];

  // Current product lists
  late List<String> productImages;
  late List<String> productNames;
  late List<String> productPrices;
  late List<String> productVendors;

  @override
  void initState() {
    super.initState();
    _resetProducts();
  }

  void _resetProducts() {
    productImages = List.from(originalImages);
    productNames = List.from(originalNames);
    productPrices = List.from(originalPrices);
    productVendors = List.from(originalVendors);
  }

  void _sortProducts(Comparator<Map<String, dynamic>> comparator) {
    List<Map<String, dynamic>> combined = [];
    for (int i = 0; i < productNames.length; i++) {
      combined.add({
        'name': productNames[i],
        'image': productImages[i],
        'price': productPrices[i],
        'vendor': productVendors[i],
      });
    }
    combined.sort(comparator);

    productNames = combined.map((e) => e['name'] as String).toList();
    productImages = combined.map((e) => e['image'] as String).toList();
    productPrices = combined.map((e) => e['price'] as String).toList();
    productVendors = combined.map((e) => e['vendor'] as String).toList();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: const Text('Grocery'),
        backgroundColor: Colors.blue[50],
        actions: [
          Consumer<CartProvider>(
            builder: (context, cart, child) {
              final count = cart.itemCount;
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => const Cart()));
                    },
                    icon: const Icon(Icons.shopping_cart, color: Colors.black),
                  ),
                  if (count > 0)
                    Positioned(
                      right: 4,
                      top: 4,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '$count',
                          style: const TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),

          // HOME ICON BUTTON
          IconButton(
            icon: const Icon(Icons.home, color: Colors.black),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/',
                (route) => false,
              );
            },
          ),

        ],
      ),
      drawer: const AppDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top "Products" section
          Container(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: double.infinity,
              height: 120,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Center(
                          child: Text(
                            'Products',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search, color: Colors.black)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _resetProducts();
                            });
                          },
                          child: const Text('Default'),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _sortProducts(
                                  (a, b) => a['name'].compareTo(b['name']));
                            });
                          },
                          child: const Text('A-Z'),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _sortProducts((a, b) => _parsePrice(a['price'])
                                  .compareTo(_parsePrice(b['price'])));
                            });
                          },
                          child: const Text('Low → High Prices'),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _sortProducts((a, b) => _parsePrice(b['price'])
                                  .compareTo(_parsePrice(a['price'])));
                            });
                          },
                          child: const Text('High → Low Prices'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Product List
          Expanded(
            child: ListView.builder(
              itemCount: productNames.length,
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 3,
                        color: Colors.grey,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Row(
                      children: [
                        // Product Image
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(productImages[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Product Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                productNames[index],
                                style:
                                    const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                productPrices[index],
                                style: const TextStyle(color: Colors.green),
                              ),
                              Text(
                                productVendors[index],
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        // Action Buttons
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.favorite, color: Colors.red),
                            ),
                            IconButton(
                              onPressed: () {
                                final price =
                                    _parsePrice(productPrices[index]);
                                final product = Product(
                                  id: index.toString(),
                                  name: productNames[index],
                                  description: productVendors[index],
                                  price: price,
                                );
                                cart.addItem(product);
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          '${productNames[index]} added to cart'),
                                      duration: const Duration(seconds: 1),
                                    ),
                                  );
                              },
                              icon: const Icon(Icons.add),
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
    );
  }
}


































