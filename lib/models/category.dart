// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:icarus/models/subcategory.dart';

class Category {
  String? name;
  String? icon;
  Color? color;
  String? imgName;
  List<Category>? subCategories;

  Category(
    {
      this.name,
      this.icon,
      this.color, 
      this.imgName,
      this.subCategories
    }
  );

  factory Category.fromJson(Map<String, dynamic> json) {

    return Category(
      color: Color(int.parse('0xFF' + json['color'])),
      icon: json['icon'],
      name: json['name'],
      imgName: json['imgName'],
      subCategories: SubCategory.fromJsonArray(json['subCategories'])
    );
  }
}
