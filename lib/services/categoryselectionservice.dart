// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:icarus/models/cartitem.dart';
import 'package:icarus/models/category.dart';
import 'package:icarus/models/subcategory.dart';
import 'package:icarus/services/cartservice.dart';
import 'package:icarus/services/loginservice.dart';

class CategorySelectionService extends ChangeNotifier {

  FirebaseFirestore? _instance;
  Category? _selectedCategory;
  SubCategory? _selectedSubCategory;

  Category? get selectedCategory  => _selectedCategory;
  set selectedCategory(Category? value) {
    _selectedCategory = value;
    notifyListeners();
  }

  SubCategory? get selectedSubCategory  => _selectedSubCategory;
  set selectedSubCategory(SubCategory? value) {
    _selectedSubCategory = value;
    notifyListeners();
  }

  void incrementSubCategoryAmount(BuildContext context) {
    if (_selectedSubCategory != null) {

      LoginService loginService = Provider.of<LoginService>(context, listen: false);
      CartService cartService = Provider.of<CartService>(context, listen: false);
      
      if (cartService.isSubCategoryAddedToCart(_selectedSubCategory)) {
      
        _instance = FirebaseFirestore.instance;
        _instance!.collection('shoppers')
        .doc(loginService.loggedInUserModel!.uid)
        .update({ 'cartItems.${selectedSubCategory!.imgName!}': FieldValue.increment(1) })
        .then((value) {
          _selectedSubCategory!.amount++;
          notifyListeners();
        });
      }
      else {
        _selectedSubCategory!.amount++;
        notifyListeners();
      }
    }
  }

  void decrementSubCategoryAmount(BuildContext context) {
    if (_selectedSubCategory != null) {

       LoginService loginService = Provider.of<LoginService>(context, listen: false);
       CartService cartService = Provider.of<CartService>(context, listen: false);

      if (cartService.isSubCategoryAddedToCart(_selectedSubCategory)) {
        _instance = FirebaseFirestore.instance;
        _instance!.collection('shoppers')
        .doc(loginService.loggedInUserModel!.uid)
        .update({ 'cartItems.${selectedSubCategory!.imgName!}': FieldValue.increment(-1) })
        .then((value) {
          _selectedSubCategory!.amount--;
          notifyListeners();
        });
      }
      else {
        _selectedSubCategory!.amount--;
        notifyListeners();
      }
    }
  }

  int get subCategoryAmount {
    int subCatAmount = 0;
    if (_selectedSubCategory != null) {
      subCatAmount = _selectedSubCategory!.amount;
    }
    return subCatAmount;
  }
}
