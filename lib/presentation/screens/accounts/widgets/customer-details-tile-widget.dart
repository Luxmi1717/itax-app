import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerDetailsTile extends StatelessWidget {
  final String leadingText1;
  final String leadingText2;
  final String leadingText3;
  final String trailingText;
  final bool ifPaid;
  final bool ifEInvoice;
  final bool ifEWay;

  const CustomerDetailsTile({
    super.key,
    required this.leadingText1,
    required this.leadingText2,
    required this.leadingText3,
    required this.trailingText, required this.ifPaid, required this.ifEInvoice, required this.ifEWay,
   
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    Text(
                      leadingText1,
                      style:
                          const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 3.w,),
                    
                         Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 187, 187, 187)
                                  .withOpacity(0.3),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              ifPaid?'Paid':'Unpaid',
                              style: TextStyle(
                                  fontSize: 12.sp, color: Colors.grey[500]),
                            ),
                          )
                        
                    
                  ],
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                leadingText2,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 4.0),
              Text(
                leadingText3,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          trailing: SizedBox(
            width: 140.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  trailingText,
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                 SizedBox(height: 5.h),
                Row(
                  children: [
                    ifEInvoice? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 176, 222, 241).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'e-Invoice',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.blue),
                      ),
                    ): Container(),
                     SizedBox(width: 2.w),
                    ifEWay? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(247, 134, 0, 1.0)
                            .withOpacity(0.2),        
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'e-Way',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Color.fromRGBO(247, 134, 0, 1.0)),
                      ),
                    ): Container(),
                    
                  ],
                )
              ],
            ),
          ),
        ),
        const Divider(
          thickness: 1,
        ),
      ],
    );
  }
}
