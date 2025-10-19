import 'package:flutter/material.dart';
import 'package:flutter_my_grocery_app_1/app_drawer.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text('Profile'),
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
          // HEADER
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color:Color.fromARGB(255, 60, 112, 138),
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
                    'My Profile',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('< Back', style: TextStyle(fontSize: 15 ,color: Colors.white)),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // PROFILE INFO
          Center(
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage('https://i.pinimg.com/736x/62/5e/9e/625e9e39df4955bbdd4433262cfc57e3.jpg'),
                ),
                SizedBox(height: 15),
                Text(
                  'Zane Almeda',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  'ZaneAlmeda@email.com',
                  style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 49, 162, 255),decoration: TextDecoration.underline, decorationColor: Colors.blueAccent),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          // ACTION BUTTONS
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              children: [
                ListTile(
                  leading: const Icon(Icons.edit, color: Colors.blueGrey),
                  title: const Text('Edit Profile'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // TODO: Navigate to edit profile screen
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.history, color: Colors.blueGrey),
                  title: const Text('Order History'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // TODO: Navigate to order history
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.settings, color: Colors.blueGrey),
                  title: const Text('Settings'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // TODO: Open settings
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.redAccent),
                  title: const Text('Logout'),
                  onTap: () {
                    // TODO: Implement logout logic
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}








































