import 'package:Ecommerce/features/home/domain/entities/product_entity.dart';
import 'package:Ecommerce/features/home/presentation/widgets/add_to_cart_button.dart';
import 'package:Ecommerce/features/home/presentation/widgets/product_details_info.dart';
import 'package:Ecommerce/features/home/presentation/widgets/product_gallery.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductEntity product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductGallery(
                images: product.images ?? [product.imageCover ?? ""],
              ),
              const SizedBox(height: 24),
              ProductDetailsInfo(product: product),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AddToCartButton(
        price: product.price?.toDouble() ?? 0.0,
        onTap: () {},
      ),
    );
  }
}
