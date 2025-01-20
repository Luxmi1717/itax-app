import 'package:flutter/material.dart';

class GridMenu extends StatelessWidget {
  const GridMenu({
    super.key,
    required List<DashMenuItem> menuItems,
  }) : _menuItems = menuItems;

  final List<DashMenuItem> _menuItems;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                width: width / 4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[200]!,
                      blurRadius: 2,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/aadhar.png",),
                    Text(
                      "aadhar",
                      style: TextStyle(
                        fontSize: height / 50,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )),
            Container(
                width: width / 4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[200]!,
                      blurRadius: 2,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/pan.png", fit: BoxFit.contain),
                    Text(
                      "aadhar",
                      style: TextStyle(
                        fontSize: height / 50,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )),
            Container(
                width: width / 4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[200]!,
                      blurRadius: 2,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/invoice.png",
                      fit: BoxFit.contain,
                    ),
                    Text(
                      "aadhar",
                      style: TextStyle(
                        fontSize: height / 50,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ],
    );
    /*GridView.builder(
      itemCount: _menuItems.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final item = _menuItems[index];

        return Container(

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[200]!,
                blurRadius: 2,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(8),
            child: GestureDetector(
              onTap: () {
                if (item.upcoming) {
                  return;
                }

                final path = item.path;

                if (path != null) {
                  context.push(path);
                  print('hellow');
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    item.icon,
                    color: item.color,
                    size: height/20,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    item.title,
                    style: TextStyle(
                      fontSize: height/50,
                      color: item.color,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );*/
  }
}

class DashMenuItem {
  final String title;
  final String? path;
  final IconData icon;
  final Color color;
  final bool upcoming;

  DashMenuItem({
    required this.title,
    required this.icon,
    required this.color,
    this.path,
    this.upcoming = false,
  });
}
