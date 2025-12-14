// lib/features/cart/domain/entities/cart_entity.dart

// الكيان الرئيسي للاستجابة
import 'package:Ecommerce/features/home/domain/entities/brand_entity.dart';
import 'package:Ecommerce/features/home/domain/entities/category_entity.dart';
import 'package:Ecommerce/features/home/domain/entities/sub_category_entity.dart';

class CartResponseEntity {
  final String? status;
  final int? numOfCartItems;
  final String? cartId;
  final CartDataEntity? data;

  const CartResponseEntity({
    this.status,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });
}

// كيان بيانات السلة الداخلية
class CartDataEntity {
  final String? id;
  final String? cartOwner;
  final List<CartProductItemEntity>? products;
  final String? createdAt;
  final String? updatedAt;
  final int? totalCartPrice;

  const CartDataEntity({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.totalCartPrice,
  });
}

// كيان كل منتج داخل السلة
class CartProductItemEntity {
  final int? count;
  final String? id;
  final CartProductDetailsEntity? product;
  final int? price;

  const CartProductItemEntity({this.count, this.id, this.product, this.price});
}

// كيان تفاصيل المنتج داخل السلة (يستخدم كيانات المنتج الفرعية الموجودة لديك)
class CartProductDetailsEntity {
  final List<SubCategoryEntity>? subcategory; // من كيانات المنتج
  final String? id;
  final String? title;
  final int? quantity;
  final String? imageCover;
  final CategoryEntity? category; // من كيانات المنتج
  final BrandEntity? brand; // من كيانات المنتج
  final num? ratingsAverage;

  const CartProductDetailsEntity({
    this.subcategory,
    this.id,
    this.title,
    this.quantity,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
  });
}

// ملاحظة: الكيانات الفرعية (SubCategoryEntity, CategoryEntity, BrandEntity)
// يجب أن تكون مستوردة من ملف كيانات المنتج (product_entity.dart).
