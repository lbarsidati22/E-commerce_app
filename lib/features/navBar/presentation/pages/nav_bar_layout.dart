import 'package:Ecommerce/core/extensions/project_extensions.dart';
import 'package:Ecommerce/core/theme/colors/colors_dark.dart';
import 'package:Ecommerce/features/navBar/presentation/cubit/navbar_cubit.dart';
import 'package:Ecommerce/features/navBar/presentation/cubit/navbar_state.dart';
import 'package:Ecommerce/features/navBar/presentation/widgets/nav_bar_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBarLayout extends StatefulWidget {
  final int initialIndex;
  const NavBarLayout({super.key, this.initialIndex = 0});

  @override
  State<NavBarLayout> createState() => _NavBarLayoutState();
}

class _NavBarLayoutState extends State<NavBarLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutViewModel(widget.initialIndex),
      child: BlocBuilder<LayoutViewModel, LayoutState>(
        builder: (context, state) {
          final viewModel = context.read<LayoutViewModel>();
          return Scaffold(
            body: SafeArea(child: viewModel.tabs[viewModel.currentIndex]),
            bottomNavigationBar: Container(
              margin: EdgeInsets.all(24),
              padding: EdgeInsets.symmetric(horizontal: 25),
              height: 80,
              decoration: BoxDecoration(
                color: ColorsDark.containerColor,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TabBarItemWidget(
                    currentIndex: viewModel.currentIndex,
                    index: 0,
                    icon: CupertinoIcons.home,
                    label: context.l10n.home,
                    onTap: () =>
                        viewModel.doIntent(LayoutChangeBottomNavIntent(0)),
                  ),
                  TabBarItemWidget(
                    currentIndex: viewModel.currentIndex,
                    index: 1,
                    icon: Icons.category_outlined,
                    label: context.l10n.categories,
                    onTap: () {
                      viewModel.doIntent(LayoutChangeBottomNavIntent(1));
                    },
                  ),
                  TabBarItemWidget(
                    currentIndex: viewModel.currentIndex,
                    index: 2,
                    icon: CupertinoIcons.cart,
                    label: context.l10n.cart,
                    onTap: () =>
                        viewModel.doIntent(LayoutChangeBottomNavIntent(2)),
                  ),
                  TabBarItemWidget(
                    currentIndex: viewModel.currentIndex,
                    index: 3,
                    icon: CupertinoIcons.person,
                    label: context.l10n.profile,
                    onTap: () =>
                        viewModel.doIntent(LayoutChangeBottomNavIntent(3)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
