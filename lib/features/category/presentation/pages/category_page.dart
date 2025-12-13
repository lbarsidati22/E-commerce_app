import 'package:Ecommerce/core/di/di.dart';
import 'package:Ecommerce/features/home/domain/entities/category_entity.dart';
import 'package:Ecommerce/features/home/domain/entities/product_entity.dart';
import 'package:Ecommerce/features/category/presentation/cubit/category_intent.dart';
import 'package:Ecommerce/features/category/presentation/cubit/category_view_model.dart';
import 'package:Ecommerce/features/home/presentation/pages/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<CategoryViewModel>()..doIntent(LoadCategoryResultIntent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Category"),
          actions: [
            IconButton(icon: const Icon(Icons.search), onPressed: () {}),
            IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {}),
          ],
        ),
        body: BlocBuilder<CategoryViewModel, CategoryState>(
          builder: (context, state) {
            if (state is CategoryError) {
              return Center(child: Text(state.message));
            }

            final isLoading = state is CategoryLoading;
            // Access properties safely if state is Success
            final successState = state is CategorySuccess ? state : null;
            final isProductsLoading = successState?.isProductsLoading ?? false;

            // Mock data for Skeletonizer or when null
            final categories =
                successState?.categories ??
                List.generate(
                  5,
                  (index) => CategoryEntity(name: "Category", image: ""),
                );
            final products =
                successState?.products ??
                List.generate(
                  6,
                  (index) => ProductEntity(title: "Product Title", price: 1234),
                );

            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _buildSearchBar(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Skeletonizer(
                    enabled: isLoading,
                    child: _buildSectionTitle(context, "Categories"),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Skeletonizer(
                    enabled: isLoading,
                    child: _buildCategoriesList(
                      context,
                      categories,
                      successState?.selectedCategoryId,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Skeletonizer(
                    enabled: isLoading, // Only initial loading
                    child: _buildSectionTitle(context, "Products"),
                  ),
                ),
                if (isProductsLoading &&
                    successState?.products != null &&
                    successState!.products!.isNotEmpty)
                  // When filtering and we have old products to show while loading new ones?
                  // Usually we clear or show skeleton.
                  // Let's show skeleton grid.
                  SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Skeletonizer(
                        enabled: true,
                        child: _buildProductItem(context, products[index]),
                      );
                    }, childCount: products.length),
                  )
                else
                  Skeletonizer.sliver(
                    enabled: isLoading || isProductsLoading,
                    child: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return _buildProductItem(context, products[index]);
                      }, childCount: products.length),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
      ),
      child: const TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search what you want...",
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            "View All",
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.blue),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesList(
    BuildContext context,
    List<CategoryEntity> categories,
    String? selectedCategoryId,
  ) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length + 1, // +1 for "All"
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          String? currentId;
          String name;
          String? image;
          bool isSelected;

          if (index == 0) {
            currentId = null;
            name = "All";
            image = null;
            isSelected = selectedCategoryId == null;
          } else {
            final category = categories[index - 1];
            currentId = category.id;
            name = category.name ?? "";
            image = category.image;
            isSelected = category.id == selectedCategoryId;
          }

          return GestureDetector(
            onTap: () {
              if (selectedCategoryId != currentId) {
                context.read<CategoryViewModel>().doIntent(
                  SelectCategoryIntent(currentId),
                );
              }
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: isSelected
                    ? Border.all(color: Colors.blue, width: 2)
                    : Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10),
                color: isSelected ? Colors.blue.withOpacity(0.1) : null,
              ),
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == 0 ? Colors.grey[200] : null,
                      image: image != null
                          ? DecorationImage(
                              image: NetworkImage(image),
                              fit: BoxFit.contain,
                            )
                          : null,
                    ),
                    child: index == 0
                        ? const Icon(Icons.category, color: Colors.blue)
                        : null,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: isSelected ? Colors.blue : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, ProductEntity product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(product: product),
          ),
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(product.imageCover ?? ""),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 8,
                      right: 8,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 15,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(
                            Icons.favorite_border,
                            size: 20,
                            color: Colors.blue,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
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
                      Text("Review (${product.ratingsAverage})"),
                      const Icon(Icons.star, color: Colors.amber, size: 15),
                      const Spacer(),
                      const Icon(Icons.add_circle, color: Colors.blue),
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
