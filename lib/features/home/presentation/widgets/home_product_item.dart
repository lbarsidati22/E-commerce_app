import 'package:Ecommerce/core/extensions/project_extensions.dart';
import 'package:Ecommerce/core/utils/components/custom_network_image.dart';
import 'package:Ecommerce/core/utils/shared_blured_container.dart';
import 'package:Ecommerce/features/home/domain/entities/product_entity.dart';
import 'package:Ecommerce/features/home/presentation/pages/product_details_page.dart';
import 'package:Ecommerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeProductItem extends StatelessWidget {
  final ProductEntity product;

  const HomeProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(product: product),
          ),
        );
      },
      child: SharedBluredContainer(
        borderRadius: 15,
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(15),
                      ),
                      child: CustomNetworkImage(
                        imageUrl: product.imageCover,
                        fit: BoxFit.cover,
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
                  Text(
                    product.title ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        "${product.price} EGP",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(width: 5),
                      if (product.priceAfterDiscount != null)
                        Text(
                          "${product.priceAfterDiscount} EGP",
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "${context.l10n.review} (${product.ratingsAverage})",
                      ),
                      const Icon(Icons.star, color: Colors.amber, size: 15),
                      const Spacer(),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(
                            Icons.add_shopping_cart,
                            size: 20,
                            color: Colors.blue,
                          ),
                          onPressed: () {
                            context.read<CartCubit>().addProductToCart(
                              product.id ?? "",
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(context.l10n.addingToCart),
                                duration: Duration(milliseconds: 500),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
