import 'package:Ecommerce/core/di/di.dart';
import 'package:Ecommerce/core/extensions/project_extensions.dart';
import 'package:Ecommerce/features/home/domain/entities/brand_entity.dart';
import 'package:Ecommerce/features/home/domain/entities/product_entity.dart';
import 'package:Ecommerce/features/home/presentation/cubit/home_intent.dart';
import 'package:Ecommerce/features/home/presentation/cubit/home_state.dart';
import 'package:Ecommerce/features/home/presentation/cubit/home_view_model.dart';
import 'package:Ecommerce/features/home/presentation/widgets/home_brands_list.dart';
import 'package:Ecommerce/features/home/presentation/widgets/home_product_item.dart';
import 'package:Ecommerce/features/home/presentation/widgets/home_search_bar.dart';
import 'package:Ecommerce/features/home/presentation/widgets/home_section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<HomeViewModel>()..doIntent(LoadHomeDataIntent()),
      child: Scaffold(
        body: BlocBuilder<HomeViewModel, HomeState>(
          builder: (context, state) {
            if (state is HomeError) {
              return Center(child: Text(state.message));
            }

            final isLoading = state is HomeLoading;
            final isProductsLoading =
                (state is HomeSuccess && state.isProductsLoading);

            // Mock data for Skeletonizer
            final brands = (state is HomeSuccess && state.brands != null)
                ? state.brands!
                : List.generate(
                    5,
                    (index) =>
                        BrandEntity(name: context.l10n.brands, image: ""),
                  );
            final products = (state is HomeSuccess && state.products != null)
                ? state.products!
                : List.generate(
                    6,
                    (index) =>
                        ProductEntity(title: "Product Title", price: 1234),
                  );

            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: HomeSearchBar(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Skeletonizer(
                    enabled: isLoading,
                    child: HomeSectionTitle(
                      title: context.l10n.brands,
                      onViewAllTap: () {},
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: HomeBrandsList(
                    brands: brands,
                    selectedBrandId: state is HomeSuccess
                        ? state.selectedBrandId
                        : null,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Skeletonizer(
                    enabled: isLoading || isProductsLoading,
                    child: HomeSectionTitle(
                      title: context.l10n.products,
                      onViewAllTap: () {},
                    ),
                  ),
                ),
                if (isProductsLoading && state.products != null)
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
                        child: HomeProductItem(product: products[index]),
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
                        return HomeProductItem(product: products[index]);
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
}
