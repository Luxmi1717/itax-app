import 'package:flutter/foundation.dart';

class NavProvider extends ChangeNotifier {
  String currentPage = '/';

  List<String> history = [

  ];

  navigate(String page) {
    history.add(currentPage);
    currentPage = page;
    print(page);
    notifyListeners();
  }

  pop() {
    if (history.isEmpty) {
      return;
    }

    final prevPage = history.removeLast();

    currentPage = prevPage;

    print(history);

    notifyListeners();
  }
}
