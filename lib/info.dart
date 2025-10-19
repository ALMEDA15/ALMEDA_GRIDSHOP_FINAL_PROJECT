import 'package:flutter/material.dart';
import 'package:flutter_my_grocery_app_1/app_drawer.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text('Who We Are'),
        backgroundColor: Colors.blue[50],
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header bar
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
                      'Who We Are',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child:
                        const Text('< Back', style: TextStyle(fontSize: 15,color: Colors.white)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Logo or image
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage(  'assets/logo.png' ),
            ),

            const SizedBox(height: 20),

            // Title
            const Text(
              'About Our App',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 10),

            // App description
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
               'Welcome to My Grid Shop your one-stop shop for the latest tech, '
                'innovative devices, and trending electronics. Our goal is to make shopping '
                'simpler and smarter by bringing quality gadgets and useful tech updates '
                'together in one platform.'
                ,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
              ),
            ),

            const SizedBox(height: 30),

            // Mission
            const Text(
              'Our Mission',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Text(
                'To make everyday shopping easy, fast, and enjoyable while keeping our users '
                'informed about the latest world events.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),

            const SizedBox(height: 30),

            // Developer info
            const Text(
              'Developed by:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              'CIARYL JOEULZ ALMEDA',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),

            const SizedBox(height: 20),

            // Contact info
           
            const Text(
              'Contact us:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.email, color: Colors.blueGrey),
                SizedBox(width: 8),
                Text('mygroceryapp@email.com'),
              ],
            ),

            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.phone, color: Colors.blueGrey),
                SizedBox(width: 8),
                Text('+63 912 345 6789'),
              ],
            ),

            const SizedBox(height: 40),

            // Version info
            const Text(
              'App Version 1.0.0',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

















