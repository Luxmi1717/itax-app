import 'package:flutter/material.dart';
import 'dart:async';

class BannerSlider extends StatefulWidget {
  final List<String> imagePaths;

  const BannerSlider({super.key, required this.imagePaths});

  @override
  BannerSliderState createState() => BannerSliderState();
}

class BannerSliderState extends State<BannerSlider> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentIndex < widget.imagePaths.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemCount: widget.imagePaths.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(widget.imagePaths[index]),
                fit: BoxFit.contain,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
