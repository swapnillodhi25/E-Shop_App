import 'package:flutter/material.dart';

class StorePage extends StatelessWidget {
  // Sample list of products
  final List<Product> products = [
    Product("Smartphone", 48000, 20, "assets/tennis_racket.png"),
    Product("T-shirt", 1500, 10, "assets/tshirt_blue_collar.png"),
    Product("Laptop", 120000, 15, "assets/NikeAirJOrdonOrange.png"),
    Product("Headphones", 8000, 30, "assets/NikeAirMax.png"),
    Product("Smartwatch", 16000, 25, "assets/office_chair_1.png"),
    Product("Sneakers", 4000, 5, "assets/samsung_s9_mobile_withback.png"),
  ];

  StorePage({super.key}); // Correct constructor syntax

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Store"), // Adding the heading to the AppBar
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Notification banner
          // Container(
          //   color: Colors.green,
          //   padding: EdgeInsets.all(8),
          //   width: double.infinity,
          //   child: Center(
          //     child: Text(
          //       "You just added another item to the cart!",
          //       style: TextStyle(color: Colors.white),
          //     ),
          //   ),
          // ),
          // Category tabs
          Padding(
            padding: const EdgeInsets.all(8.0), // Adjusted padding
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Enable horizontal scrolling
              child: Row(
                children: [
                  CategoryTab(label: "All", selected: true),
                  SizedBox(width: 10), // Add space between tabs
                  CategoryTab(label: "Clothes", selected: false),
                  SizedBox(width: 10), // Add space between tabs
                  CategoryTab(label: "Phones", selected: false),
                  SizedBox(width: 10), // Add space between tabs
                  CategoryTab(label: "Electronics", selected: false),
                  SizedBox(width: 10), // Add space between tabs
                  CategoryTab(label: "Accessories", selected: false),
                  // Add more categories as needed
                ],
              ),
            ),
          ),
          // Product Grid
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.7,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  product: products[index],
                  onAddToCart: () {
                    // Handle adding to cart
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("${products[index].name} added to cart"),
                    ));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final int price;
  final int discount;
  final String imageUrl;

  Product(this.name, this.price, this.discount, this.imageUrl);
}

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onAddToCart;

  ProductCard({required this.product, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  image: DecorationImage(
                    image: AssetImage(product.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (product.discount > 0)
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    color: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                      "${product.discount}% OFF",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  "\$${product.price}",
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: ElevatedButton.icon(
              onPressed: onAddToCart,
              icon: Icon(Icons.add),
              label: Text("Add"),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.blueAccent, // Customize button color
                foregroundColor: Colors.white, // Customize text color
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 16), // Customize padding
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryTab extends StatelessWidget {
  final String label;
  final bool selected;

  CategoryTab({required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle category change
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.blue),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : Colors.blue,
          ),
        ),
      ),
    );
  }
}
