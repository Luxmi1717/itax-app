


import 'package:flutter/material.dart';




class CalculatorTabPage extends StatefulWidget {
  const CalculatorTabPage({super.key});

  @override
  _CalculatorTabPageState createState() => _CalculatorTabPageState();
}

class _CalculatorTabPageState extends State<CalculatorTabPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    // Initialize fade-in animation
    _fadeInAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation
    _animationController.forward();
  }

  @override
  void dispose() {
    // Dispose of the animation controller
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Material(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: const Color(0xFFC4BFF9),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: AnimatedBuilder(
                    animation: _fadeInAnimation,
                    builder: (context, child) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Opacity(
                            opacity: _fadeInAnimation.value,
                            child: const Padding(
                              padding: EdgeInsets.only(top: 12),
                              child: Text(
                                'Details',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Opacity(
                            opacity: 0.8 * _fadeInAnimation.value,
                            child: const Divider(
                              thickness: 3,
                              indent: 9,
                              endIndent: 9,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
