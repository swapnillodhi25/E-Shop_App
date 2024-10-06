import 'package:flutter/material.dart';

class WishlistPage extends StatefulWidget {
  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  // List of items in the wishlist
  List<Product> products = [
    Product("Oraimo smartwatch", 16400,
        "assets/images/products/leather_jacket_1.png", false),
    Product("Converse Chuck Taylor", 21600,
        "assets/images/products/kitchen_refrigerator.png", true),
    Product("Adidas core sneakers", 46000,
        "assets/images/products/NikeBasketballShoeGreenBlack.png", false),
    Product("Airpods pro", 125000, "assets/images/products/tracksuit_red.png",
        true),
    Product("Balenciaga T-shirt", 27000,
        "assets/images/products/Adidas_Football.png", false),
    Product("Google Pixels 6", 250000,
        "assets/images/products/iphone_14_pro.png", true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Wishlist"),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: CategorySelector(),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.8,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  product: products[index],
                  onFavoriteToggle: () {
                    setState(() {
                      products[index].isFavorite = !products[index].isFavorite;
                    });
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
  final String imageUrl;
  bool isFavorite;

  Product(this.name, this.price, this.imageUrl, this.isFavorite);
}

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onFavoriteToggle;

  ProductCard({required this.product, required this.onFavoriteToggle});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
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
              Positioned(
                right: 8,
                top: 8,
                child: GestureDetector(
                  onTap: onFavoriteToggle,
                  child: Icon(
                    product.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: product.isFavorite ? Colors.red : Colors.grey,
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
                  "NGN ${product.price}",
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategorySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CategoryButton(label: "All", selected: true),
        CategoryButton(label: "Shoes", selected: false),
        CategoryButton(label: "Phones", selected: false),
        CategoryButton(label: "Bags", selected: false),
      ],
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String label;
  final bool selected;

  CategoryButton({required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
