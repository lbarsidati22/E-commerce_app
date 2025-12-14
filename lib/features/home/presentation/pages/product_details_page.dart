import 'package:Ecommerce/core/extensions/project_extensions.dart';
import 'package:Ecommerce/features/home/domain/entities/product_entity.dart';
import 'package:Ecommerce/features/home/presentation/widgets/add_to_cart_button.dart';
import 'package:Ecommerce/features/home/presentation/widgets/product_details_info.dart';
import 'package:Ecommerce/features/home/presentation/widgets/product_gallery.dart';
import 'package:Ecommerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductEntity product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Icon(Icons.arrow_back_ios, size: 24),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      context.l10n.productDetails,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
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
        onTap: () {
          context.read<CartCubit>().addProductToCart(product.id ?? "");
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Adding to cart...'),
              duration: Duration(milliseconds: 500),
            ),
          );
        },
      ),
    );
  }
}
