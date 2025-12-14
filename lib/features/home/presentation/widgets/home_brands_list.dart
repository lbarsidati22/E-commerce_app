import 'package:Ecommerce/core/extensions/project_extensions.dart';
import 'package:Ecommerce/core/utils/components/custom_network_image.dart';
import 'package:Ecommerce/features/home/domain/entities/brand_entity.dart';
import 'package:Ecommerce/features/home/presentation/cubit/home_intent.dart';
import 'package:Ecommerce/features/home/presentation/cubit/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBrandsList extends StatelessWidget {
  final List<BrandEntity> brands;
  final String? selectedBrandId;

  const HomeBrandsList({super.key, required this.brands, this.selectedBrandId});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: brands.length + 1, // +1 for "All" button
        padding: const EdgeInsets.symmetric(horizontal: 16),
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          String? currentId;
          String name;
          String? image;
          bool isSelected;

          if (index == 0) {
            currentId = null;
            name = context.l10n.all;
            image = null;
            isSelected = selectedBrandId == null;
          } else {
            final brand = brands[index - 1];
            currentId = brand.id;
            name = brand.name ?? "";
            image = brand.image;
            isSelected = brand.id == selectedBrandId;
          }

          return GestureDetector(
            onTap: () {
              if (selectedBrandId != currentId) {
                context.read<HomeViewModel>().doIntent(
                  SelectBrandIntent(currentId),
                );
              }
            },
            child: Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(2), // Border width
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected
                          ? Theme.of(context).colorScheme.secondary
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == 0
                          ? context.theme.colorScheme.secondary.withOpacity(0.1)
                          : context.theme.colorScheme.primaryContainer,
                    ),
                    child: index == 0
                        ? Icon(
                            CupertinoIcons.home,
                            color: context.theme.colorScheme.secondary,
                          )
                        : ClipOval(
                            child: CustomNetworkImage(
                              imageUrl: image,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: isSelected
                        ? context.theme.colorScheme.secondary
                        : context.theme.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
