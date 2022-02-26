// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:icarus/helpers/utils.dart';
import 'package:icarus/models/category.dart';
import 'package:icarus/models/subcategory.dart';
import 'package:icarus/services/cartservice.dart';
import 'package:icarus/services/categoryselectionservice.dart';
import 'package:icarus/widgets/categoryicon.dart';
import 'package:icarus/widgets/mainappbar.dart';

class SelectedCategoryPage extends StatelessWidget {

  Category? selectedCategory;

  @override
  Widget build(BuildContext context) {

    CategorySelectionService catSelection = Provider.of<CategorySelectionService>(context, listen: false);
    selectedCategory = catSelection.selectedCategory;
    CartService cartService = Provider.of<CartService>(context, listen: false);
    
    return Scaffold(
      appBar: MainAppBar(),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CategoryIcon(
                  color: this.selectedCategory!.color,
                  iconName: this.selectedCategory!.icon
                ),
                SizedBox(width: 10),
                Text(this.selectedCategory!.name!,
                  style: TextStyle(color: this.selectedCategory!.color, fontSize: 20)
                )
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                  this.selectedCategory!.subCategories!.length,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        var subCat = this.selectedCategory!.subCategories![index];
                        catSelection.selectedSubCategory = cartService.getCategoryFromCart(subCat as SubCategory);
                        Utils.mainAppNav.currentState!.pushNamed('/detailspage');
                      },
                      child: Container(
                        child: Column(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                'assets/imgs/' + this.selectedCategory!.subCategories![index].imgName! + '.png',
                                fit: BoxFit.cover, width: 100, height: 100
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(this.selectedCategory!.subCategories![index].name!,
                              style: TextStyle(color: this.selectedCategory!.color
                            ))
                          ],
                        )
                      ),
                    );
                  }
                ),
              ),
            )
          ],
        )
      )
    );
  }
}
