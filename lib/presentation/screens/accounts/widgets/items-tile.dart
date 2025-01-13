import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemsTile extends StatelessWidget {
  final String productName;
  final double salesPrice;
  final double purchasePrice;
  final int currentStock;
  final void Function()? onTap;

  ItemsTile({
    required this.productName,
    required this.salesPrice,
    required this.purchasePrice,
    required this.currentStock, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 19.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/box.png', // Replace with your image asset
                      width: 40.w,
                      height: 40.h,
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        productName,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                     
                      child: Row(
                        children: [
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.green, width: 0.8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                            ),
                            child: Text(
                              '+IN',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                               
                                 fontSize: 16.sp,
                              ),
                            ),
                          ),
                          SizedBox(width: 6.w),
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.red, width: 0.8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                            child: Text(
                              '+OUT',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sales Price',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[500],
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          '₹$salesPrice',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Purchase Price',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[500],
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          '₹$purchasePrice',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Current Stock',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[500],
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          '$currentStock',
                          style: _getStockTextStyle(currentStock)
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            thickness: 0.4,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
TextStyle _getStockTextStyle(int stock) {
  return TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: stock <= 0 ? Colors.red : Colors.green,
  );
}