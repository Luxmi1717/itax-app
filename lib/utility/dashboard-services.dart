class NavigationItem {
  final int id;
  final String imageUrl;
  final String navigationPath;
  final String name;

  NavigationItem({
    required this.id,
    required this.imageUrl,
    required this.navigationPath,
    required this.name,
  });
}


  // First list with 6 elements
  final List<NavigationItem> dashboardServicesList = [
    NavigationItem(      
      id: 1,
      imageUrl: 'assets/images/dashboard/itr-logo.png',
      navigationPath: '/itr',
      name:'ITR'
    ),
    NavigationItem(
      id: 2,
      imageUrl: 'assets/images/dashboard/gstr-logo.png',
      navigationPath: '/gst',
      name: 'GSTR'
    ),
    NavigationItem(
      id: 3,
      imageUrl: 'assets/images/dashboard/accounts-logo.png',
      navigationPath: '/account-dashboard',
      name: 'Bill-Shill'
    ),
    NavigationItem(
      id: 4,
      imageUrl: 'assets/images/dashboard/incom-tax-logo.png',
      navigationPath: '/services',
      name: 'Easy Services'
    ),
    NavigationItem(
      id: 5,
      imageUrl: 'assets/images/dashboard/bill-logo.png',
      // navigationPath: '/e-way-login',
      navigationPath: '/pick-media-ocr',
      
      name: 'E Invoice'
    ),
    NavigationItem(
      id: 6,
      imageUrl: 'assets/images/dashboard/gstlink-logo.png',
      navigationPath: '',
      name: 'Invoice'
    ),
  ];

  // Second list with 3 elements
  final List<NavigationItem> dashboardToolsList = [
    NavigationItem(
      id: 1,
      imageUrl: 'assets/images/dashboard/pdf-logo.png',
      navigationPath: '/pdf/base',
      name: 'Converter'
    ),

    NavigationItem(
      id: 2,
      imageUrl: 'assets/images/dashboard/ocr-logo.png',
      navigationPath: '/ocr',
      name: 'OCR'
    ),
    NavigationItem(
      id: 3,
      imageUrl: 'assets/images/dashboard/startup-logo.png',
      navigationPath: '/balance-sheet',
      name: 'Startup'
    ),
  ];


  final List<NavigationItem> calculatorsList = [
  NavigationItem(
      id: 1,
      imageUrl: 'assets/images/dashboard/hra.svg',
      navigationPath: 'new-calculator-hra',
      name: 'HRA'),
  NavigationItem(
      id: 2,
      imageUrl: 'assets/images/dashboard/it-cal.svg',
      navigationPath: '/new-calculator-tax-advance',
      name: 'Advance Tax'),
  NavigationItem(
      id: 3,
      imageUrl: 'assets/images/dashboard/calc.svg',
      navigationPath: '/new-calculator-tax-new',
      name: 'Tax Calculator'),
];

  
