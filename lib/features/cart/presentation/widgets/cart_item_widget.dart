import 'package:Ecommerce/core/utils/components/custom_network_image.dart';
import 'package:Ecommerce/features/home/domain/entities/cart_entity.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final CartProductItemEntity cartItem;

  const CartItemWidget({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: 80,
                height: 80,
                child: CustomNetworkImage(
                  imageUrl: cartItem.product?.imageCover ?? "",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItem.product?.title ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${cartItem.price} EGP",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            // Quantity and Delete (Placeholder for now)
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    // TODO: Implement delete
                  },
                  icon: const Icon(Icons.delete_outline, color: Colors.red),
                ),
                Text(
                  "Count: ${cartItem.count}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
