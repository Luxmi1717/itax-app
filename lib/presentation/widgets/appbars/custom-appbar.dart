import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String pageTitle; // Upper text
  final String subtitle; // Lower text
  final String title; // Text next to back icon
  final VoidCallback? onBackPressed; // Back button action
  final VoidCallback? onSearchPressed; // Search button action
  final VoidCallback? onSortPressed; // Sort button action
  final VoidCallback? onMorePressed; // More button action

  const CustomAppBar({
    super.key,
    required this.title,
    required this.subtitle,
    required this.pageTitle,
    this.onBackPressed,
    this.onSearchPressed,
    this.onSortPressed,
    this.onMorePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppGradients.mainGradient,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back Button and Text
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                        onPressed: onBackPressed,
                      ),
                      Text(
                        pageTitle,
                        style:
                             TextStyle(color: Colors.white, fontSize: 16.sp),
                      ),
                    ],
                  ),

                  // Trailing Icons
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.search, color: Colors.white),
                        onPressed: onSearchPressed,
                      ),
                      IconButton(
                        icon: const Icon(Icons.sort, color: Colors.white),
                        onPressed: onSortPressed,
                      ),
                      IconButton(
                        icon: const Icon(Icons.more_horiz, color: Colors.white),
                        onPressed: onMorePressed,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Spacer(),
            Center(
              child: Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(150.0); // Adjust as needed
}
