import 'package:estore/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false, // To avoid back button
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Good day for shopping',
                  style: TextStyle(fontSize: 16, color: Colors.white)),
              Text(
                'E-Store Shop',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search in Store',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),
            ),
            // Popular Categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Popular Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                children: [
                  CategoryIcon(icon: Icons.sports, label: 'Sports'),
                  CategoryIcon(icon: Icons.chair, label: 'Furniture'),
                  CategoryIcon(
                      icon: Icons.electrical_services, label: 'Electronics'),
                  CategoryIcon(icon: Icons.shopping_bag, label: 'Clothes'),
                  CategoryIcon(icon: Icons.pets, label: 'Animals'),
                  CategoryIcon(icon: Icons.shopping_cart, label: 'Shoes'),
                ],
              ),
            ),
            // Featured Product Carousel
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Sneakers of the Week',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: 200, // Height for the PageView
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    FeatureCard(imagePath: TImages.banner1),
                    FeatureCard(imagePath: TImages.banner2),
                    FeatureCard(imagePath: TImages.banner3),
                    FeatureCard(imagePath: TImages.banner4),
                  ],
                ),
              ),
            ),
            // Popular Products Section
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Products',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // View all action
                    },
                    child: Text(
                      'View all',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.7,
                ),
                itemCount: 8, // Update to the total number of images
                itemBuilder: (context, index) {
                  // List of image paths
                  List<String> imagePaths = [
                    TImages.productImage15,
                    TImages.productImage16,
                    TImages.productImage17,
                    TImages.productImage18,
                    TImages.productImage3,
                    TImages.productImage4,
                    TImages.productImage5,
                    TImages.productImage1,
                  ];

                  // Discount values for each product
                  List<int> discounts = [78, 14, 5, 10, 20, 15, 30, 12];

                  return ProductCard(
                    imagePath: imagePaths[index], // Use imagePaths[index]
                    discount: discounts[index], // Use discounts[index]
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Category Icon Widget
class CategoryIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  CategoryIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue[50],
            child: Icon(icon, size: 30, color: Colors.blue),
          ),
          SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

// Feature Card Widget
class FeatureCard extends StatelessWidget {
  final String imagePath;

  const FeatureCard({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[200],
          image: DecorationImage(
            image: AssetImage(imagePath), // Use AssetImage correctly
            fit: BoxFit.cover, // Ensure the image fits well
          ),
        ),
      ),
    );
  }
}

// Product Card Widget
class ProductCard extends StatelessWidget {
  final int discount;
  final String imagePath; // Add this line

  ProductCard(
      {required this.discount, required this.imagePath}); // Update constructor

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey[200],
                    image: DecorationImage(
                      image:
                          AssetImage(imagePath), // Use the provided imagePath
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 14,
                    child: Icon(
                      Icons.favorite_border,
                      size: 16,
                      color: Colors.red,
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '$discount% OFF',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Product Name',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('\$99.99', style: TextStyle(color: Colors.green)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
