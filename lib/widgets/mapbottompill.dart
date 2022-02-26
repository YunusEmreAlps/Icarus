// Flutter imports:
import 'dart:math';
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:icarus/models/subcategory.dart';
import 'package:icarus/services/categoryselectionservice.dart';
import 'categoryicon.dart';

class MapBottomPill extends StatelessWidget {
  
  SubCategory? subCategory;

  @override
  Widget build(BuildContext context) {

    List<Map<String, dynamic>> farmers=[{"farmerName":"Burhan Altıntop", "farmerAvatar": "assets/imgs/farmer2.jpeg" }, {"farmerName":"Sinan Engin", "farmerAvatar": "assets/imgs/farmer3.jpeg" }] ;

    CategorySelectionService catSelection = Provider.of<CategorySelectionService>(context, listen: false);
    this.subCategory = catSelection.selectedSubCategory;
    
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset.zero
          )
        ]
      ),
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipOval(
                      child: Image.asset('assets/imgs/${this.subCategory!.imgName}.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover
                      ),
                    ),
                    Positioned(
                      bottom: -10,
                      right: -10,
                      child: CategoryIcon(
                        color: this.subCategory!.color,
                        iconName: this.subCategory!.icon,
                        size: 20,
                        padding: 5
                      ),
                    )
                  ],
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(this.subCategory!.name!,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                        )
                      ),
                      Text('Sale per Pound'),
                      Text('2km away',
                        style: TextStyle(
                          color: this.subCategory!.color
                        )
                      )
                    ],
                  ),
                ),
                Icon(Icons.location_pin, color: this.subCategory!.color, size: 50)
              ],
            )
          ),
          Container(
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                          image: AssetImage(farmers[0]["farmerAvatar"]),
                          fit: BoxFit.cover
                        ),
                        border: Border.all(color: this.subCategory!.color!, width: 4)
                      ),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(farmers[0]["farmerName"],
                          style: TextStyle(fontWeight: FontWeight.bold)
                        ),
                        Text('Idealtepe Mahallesi, Avrupa Apt.\nK:3-4 D:9-12, 81580 Maltepe')
                      ],
                    )
                  ],
                )
              ],
            )
          )
        ],
      )
    );
  }
}
