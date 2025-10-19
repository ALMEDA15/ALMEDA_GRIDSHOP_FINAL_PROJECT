import 'package:flutter/material.dart';
import 'package:flutter_my_grocery_app_1/app_drawer.dart';
import 'package:flutter_my_grocery_app_1/cart.dart';
import 'package:flutter_my_grocery_app_1/info.dart';
import 'package:flutter_my_grocery_app_1/newstand.dart';
import 'package:flutter_my_grocery_app_1/profile.dart';
import 'package:flutter_my_grocery_app_1/shop.dart';
import 'package:flutter_my_grocery_app_1/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gadget Hub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(title: 'Gadget Hub'),
      routes: {
        '/shop': (context) => const Shop(),
        '/newstand': (context) => const Newstand(),
        '/info': (context) => const Info(),
        '/profile': (context) => const Profile(),
        '/cart': (context) => const Cart(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.blue[50],
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildLogoSection(),
            const SizedBox(height: 20),
            _buildSearchBar(),
            const SizedBox(height: 20),
            _buildCarousel(),
            const SizedBox(height: 20),
            _buildFeatureGrid(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Logo Section with gradient background
  Widget _buildLogoSection() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.teal.shade600, Colors.blue.shade400],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50), // modern rounded logo
            child: Image.asset(
              'assets/logo.png',
              height: 180,
              width: 180,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Discover the Latest Gadgets!',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Search Bar
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search gadgets...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey.shade200,
        ),
      ),
    );
  }

  // Modernized Banner Carousel
  Widget _buildCarousel() {
    return SizedBox(
      height: 200,
      child: PageView(
        controller: PageController(viewportFraction: 0.85),
        children: [
          
          _buildModernBanner('Smartphones', 'Latest & Fast', Colors.blue),
          
        ],
      ),
    );
  }

  Widget _buildModernBanner(String title, String subtitle, Color color) {
    
   return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Container(
      height: 150,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 0, 122, 236).withOpacity(0.5),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
        image: DecorationImage(
          image: AssetImage('assets/banner_placeholder.png'), // replace with real image
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(color.withOpacity(0.3), BlendMode.darken),
        ),
      ),
      child: Center( // <-- Center the content
        child: Column(
          mainAxisSize: MainAxisSize.min, // center only the content
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    ),
  );


  }

  // Modernized Feature Grid
  Widget _buildFeatureGrid() {
    final features = [
      {'title': 'Shop', 'icon': Icons.devices, 'route': '/shop', 'color': Colors.teal},
      {'title': 'Newstand', 'icon': Icons.new_releases, 'route': '/newstand', 'color': Colors.blueAccent},
      {'title': 'Profile', 'icon': Icons.person, 'route': '/profile', 'color': Colors.blue},
      {'title': 'Cart', 'icon': Icons.shopping_cart, 'route': '/cart', 'color': Colors.lightBlueAccent},
      {'title': 'Info', 'icon': Icons.info, 'route': '/info', 'color': const Color.fromARGB(255, 13, 119, 168)},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: features.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.1,
        ),
        itemBuilder: (context, index) {
          final feature = features[index];
          return _buildModernFeatureCard(
            feature['title'] as String,
            feature['icon'] as IconData,
            feature['route'] as String,
            feature['color'] as Color,
          );
        },
      ),
    );
  }

  Widget _buildModernFeatureCard(String title, IconData icon, String route, Color color) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      borderRadius: BorderRadius.circular(24),
      splashColor: color.withOpacity(0.3),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color.withOpacity(0.3)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.white),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}





