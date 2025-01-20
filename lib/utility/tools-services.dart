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


final List<NavigationItem> toolsServiceList = [
  NavigationItem(
      id: 1,
      imageUrl: 'assets/images/tools/merge-pdf.png',
      navigationPath: '/pdf-merge',
      name: 'Merge PDF'),
  NavigationItem(
      id: 2,
      imageUrl: 'assets/images/tools/split-pdf.png',
      navigationPath: '/pdf-split',
      name: 'Split PDF'),
       NavigationItem(
      id: 3,
      imageUrl: 'assets/images/tools/compress-pdf.png',
      navigationPath: '/pdf-compress',
      name: 'Compress PDF'),
      //  NavigationItem(
      // id: 4,
      // imageUrl: 'assets/images/tools/pdf-to-image.png',
      // navigationPath: '/',
      // name: 'PDF to Image'),
       NavigationItem(
      id: 5,
      imageUrl: 'assets/images/tools/image-to-pdf.png',
      navigationPath: '/image-to-pdf',
      name: 'Image to PDF'),
      //  NavigationItem(
      // id: 6,
      // imageUrl: 'assets/images/tools/shrink-image.png',
      // navigationPath: '/image-shrink',
      // name: 'Shrink Image'),
    
       NavigationItem(
      id: 7,
      imageUrl: 'assets/images/tools/rotate-pdf.png',
      navigationPath: '/pdf-rotate',
      name: 'Rotate  PDF'),
    
];
