class NavigationItem {
  final int id;
  final String imageUrl;
  final String navigationPath;

  NavigationItem({
    required this.id,
    required this.imageUrl,
    required this.navigationPath,
  });
}


  // First list with 6 elements
  final List<NavigationItem> dashboardServicesList = [
    NavigationItem(
      id: 1,
      imageUrl: 'assets/images/dashboard/itr-logo.png',
      navigationPath: '/home',
    ),
    NavigationItem(
      id: 2,
      imageUrl: 'assets/images/dashboard/gstr-logo.png',
      navigationPath: '/itr',
    ),
    NavigationItem(
      id: 3,
      imageUrl: 'assets/images/dashboard/accounts-logo.png',
      navigationPath: '/profile',
    ),
    NavigationItem(
      id: 4,
      imageUrl: 'assets/images/dashboard/incom-tax-logo.png',
      navigationPath: '/settings',
    ),
    NavigationItem(
      id: 5,
      imageUrl: 'assets/images/dashboard/bill-logo.png',
      navigationPath: '/notifications',
    ),
    NavigationItem(
      id: 6,
      imageUrl: 'assets/images/dashboard/gstlink-logo.png',
      navigationPath: '/help',
    ),
  ];

  // Second list with 3 elements
  final List<NavigationItem> dashboardToolsList = [
    NavigationItem(
      id: 1,
      imageUrl: 'assets/images/dashboard/pdf-logo.png',
      navigationPath: '/about',
    ),
    NavigationItem(
      id: 2,
      imageUrl: 'assets/images/dashboard/ocr-logo.png',
      navigationPath: '/contact',
    ),
    NavigationItem(
      id: 3,
      imageUrl: 'assets/images/dashboard/startup-logo.png',
      navigationPath: '/feedback',
    ),
  ];

  