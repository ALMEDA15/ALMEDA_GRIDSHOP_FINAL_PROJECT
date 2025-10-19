import 'package:flutter/material.dart';
import 'package:flutter_my_grocery_app_1/app_drawer.dart';

class Newstand extends StatefulWidget {
  const Newstand({super.key});

  @override
  State<Newstand> createState() => _NewstandState();
}

class _NewstandState extends State<Newstand> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final List<String> news = args?['news'] ?? ['No news available'];

    return Scaffold(
      backgroundColor: Colors.blue[50],

      appBar: AppBar(
        title: const Text('Newstand'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
          ),
        ],
       backgroundColor: Colors.blue[50],
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          // HEADER BAR
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 60, 112, 138),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  offset: Offset(0, 4),
                )
              ],
            ),
            child: Row(
              children: [
                const SizedBox(width: 20),
                const Expanded(
                  child: Text(
                    'Newstand',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('< Back', style: TextStyle(fontSize: 15,color: Colors.white)),
                ),
              ],
            ),
          ),

          // BODY: News Buttons
          Expanded(
            child: ListView.builder(
              itemCount: news.length,
              itemBuilder: (context, index) {
                final category = news[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Add navigation or logic here
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('You clicked $category')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: Colors.blueGrey),
                      ),
                      elevation: 2,
                    ),
                    child: Text(
                      category,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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










































