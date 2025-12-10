import 'package:Ecommerce/core/extensions/project_extensions.dart';
import 'package:Ecommerce/core/theme/colors/colors_dark.dart';
import 'package:Ecommerce/features/home/presentation/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class NavBarLayout extends StatelessWidget {
//   const NavBarLayout({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(child: Text('NavBar Layout')));
//   }
// }
class NavBarLayout extends StatefulWidget {
  const NavBarLayout({super.key});

  @override
  State<NavBarLayout> createState() => _NavBarLayoutState();
}

class _NavBarLayoutState extends State<NavBarLayout> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const CategoryPage(),
    const FavoritePage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildFloatingNavBar() {
    return Container(
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
          _buildNavIcon(CupertinoIcons.home, 0),
          _buildNavIcon(Icons.category, 1),
          _buildNavIcon(CupertinoIcons.heart, 2),
          _buildNavIcon(CupertinoIcons.person, 3),
        ],
      ),
    );
  }

  Widget _buildNavIcon(IconData path, int index) {
    final isSelected = _selectedIndex == index;
    final List<String> labels = [
      context.l10n.home,
      context.l10n.categories,
      context.l10n.cart,
      context.l10n.profile,
    ];

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 1.0, end: isSelected ? 1.2 : 1.0),
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutBack,
        builder: (context, scale, child) {
          return Transform.scale(
            scale: scale,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  path,
                  size: 25,
                  color: isSelected
                      ? Theme.of(context).colorScheme.secondary
                      : Colors.grey.shade600,
                ),
                SizedBox(height: 4),
                if (isSelected)
                  Text(
                    labels[index],
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: context.colorScheme.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _pages[_selectedIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildFloatingNavBar(),
          ),
        ],
      ),
    );
  }
}

// create 3 pages
// 1- category page
// 2- favorite page
// 3- profile page
// like this
class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Favorite Page'));
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Profile Page'));
  }
}

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Category Page'));
  }
}
