import 'package:bankly_task/models/book_entry.dart';
import 'package:flutter/material.dart';

class GBookProvider with ChangeNotifier {
  // GoogleBooksService googleBooksService;

  BookEntry _item;
  BookEntry get bookItem => _item;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  void setLoading(bool b) {
    _isLoading = b;
    notifyListeners();
  }

  void clearBook() {
    _item = null;
  }
}
