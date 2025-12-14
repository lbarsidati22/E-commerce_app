import 'package:Ecommerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:Ecommerce/core/extensions/project_extensions.dart';
import 'package:Ecommerce/features/cart/presentation/cubit/cart_state.dart';
import 'package:Ecommerce/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    // Fetch cart data using the global CartCubit instance
    context.read<CartCubit>().getCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is GetCartLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetCartError) {
            return Center(child: Text(state.message));
          } else if (state is GetCartSuccess) {
            final products = state.cartResponseEntity.data?.products ?? [];
            if (products.isEmpty) {
              return Center(child: Text(context.l10n.yourCartIsEmpty));
            }
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return CartItemWidget(cartItem: products[index]);
              },
            );
          } else if (state is AddToCartSuccess || state is AddToCartLoading) {
            context.read<CartCubit>().getCart();
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
