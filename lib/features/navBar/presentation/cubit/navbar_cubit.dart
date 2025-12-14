import 'package:Ecommerce/features/cart/presentation/pages/cart_page.dart';
import 'package:Ecommerce/features/category/presentation/pages/category_page.dart';
import 'package:Ecommerce/features/home/presentation/pages/home_page.dart';
import 'package:Ecommerce/features/navBar/presentation/cubit/navbar_state.dart';
import 'package:Ecommerce/features/profile/presentation/pages/profile_page.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutViewModel extends Cubit<LayoutState> {
  LayoutViewModel(this.currentIndex) : super(LayoutInitialState());
  int currentIndex = 0;

  void doIntent(LayoutIntent layoutIntent) {
    switch (layoutIntent) {
      case LayoutChangeBottomNavIntent():
        _changeBottomNav(layoutIntent.index);
    }
  }

  List<Widget> tabs = [
    // MultiBlocProvider(
    //   providers: [
    //   BlocProvider(
    //     create: (context) => getIt.get<WorkoutCubit>()..fetchWorkout(),
    //   ),
    //   BlocProvider(
    //     create: (context) => getIt.get<RecommendationCubit>()..fetchWorkout(),
    //   ),
    //     BlocProvider(
    //       create: (context) => getIt.get<GetHomeMealsCategoriesCubit>()..getHomeMealsCategories(),
    //     ),
    //     BlocProvider(
    //       create: (context) => getIt.get<ProfileViewModel>()..doIntent(ProfileClickedIntent()),
    //     ),

    //   ],

    //    child:
    HomePage(),
    CategoryPage(),
    CartPage(),
    ProfilePage(),
  ];

  void _changeBottomNav(int index) {
    emit(LayoutInitialState());
    currentIndex = index;
    emit(LayoutChangeBottomNavState());
  }
}

sealed class LayoutIntent {}

class LayoutChangeBottomNavIntent extends LayoutIntent {
  int index;

  LayoutChangeBottomNavIntent(this.index);
}
