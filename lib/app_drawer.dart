import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    final List<String> news = [
      'Top Stories',
      'World',
      'Business',
      'Technology',
      'Entertainment',
      'Sports',
      'Science',
      'Health'
    ];
    return Drawer(
      child: ListView(
        children: [
          //  Blue Header Section
                      Container(
              color: Colors.blue[50], //  blue background
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Row(
                children: [
                  // Profile Icon
                  const CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.blueGrey,
                    backgroundImage: NetworkImage('https://i.pinimg.com/736x/62/5e/9e/625e9e39df4955bbdd4433262cfc57e3.jpg'),
                    
                  ),
                  const SizedBox(width: 15),

                  // Name and Email
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Zane Almeda',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'ZaneAlmeda@email.com',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.lightBlueAccent,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),


          //  Drawer Menu Items
          ListTile(
            leading: const Icon(Icons.store),
            title: const Text('Shop'),
            onTap: () {
              Navigator.pushNamed(context, '/shop');
            },
          ),
          ListTile(
            leading: const Icon(Icons.newspaper),
            title: const Text('Newstand'),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/newstand',
                arguments: {'news': news},
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Who we are'),
            onTap: () {
              Navigator.pushNamed(context, '/info');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('My Profile'),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_basket),
            title: const Text('Basket'),
            onTap: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        
        
        ],
      ),
    );
  }
}

