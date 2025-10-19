import 'package:flutter/material.dart';
import 'package:flutter_my_grocery_app_1/app_drawer.dart';
import 'package:flutter_my_grocery_app_1/provider.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    // Using Consumer for dynamic updates
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        final cart = cartProvider.items.values.toList();

        // Calculate total payment
        double total = 0;
        for (var item in cart) {
          total += item.product.price * item.quantity;
        }

        return Scaffold(
          backgroundColor: Colors.blue[50],
          appBar: AppBar(
            title: const Text('Basket'),
            backgroundColor: Colors.blue[50],
            elevation: 2,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart, color: Colors.black),
              ),
            ],
          ),
          drawer: const AppDrawer(),
          body: Column(
            children: [
              // Header container
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 60, 112, 138), // header color
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Basket',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        '< Back',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Cart List Section
              Expanded(
                child: cart.isEmpty
                    ? const Center(
                        child: Text(
                          'Your cart is empty',
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    : ListView.builder(
                        itemCount: cart.length,
                        itemBuilder: (context, index) {
                          final cartItem = cart[index];

                          return Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            child: ListTile(
                              title: Text(cartItem.product.name),
                              subtitle:
                                  Text('Quantity: ${cartItem.quantity}'),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Item total price
                                  Text(
                                    '₱${(cartItem.product.price * cartItem.quantity).toStringAsFixed(2)}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 8),

                                  // Decrease button
                                  IconButton(
                                    icon: const Icon(
                                      Icons.remove_circle_outline,
                                      color: Colors.orange,
                                    ),
                                    onPressed: () {
                                      cartProvider.removeItem(
                                          cartItem.product.id);
                                    },
                                  ),

                                  // Delete button
                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      cartProvider
                                          .deleteItem(cartItem.product.id);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),

              // Total Payment Section
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Payment:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '₱${total.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}





































