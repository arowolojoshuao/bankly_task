import 'package:bankly_task/models/book_entry.dart';
import 'package:bankly_task/services/library_service.dart';
import 'package:bankly_task/util/constants.dart';
import 'package:flutter/material.dart';

class ApiProvider with ChangeNotifier {
  LibraryService libraryService;

  List<BookEntry> _bookList = [];
  List<BookEntry> get bookList => _bookList;

  int _pageNumber;

  bool _isLoading;
  bool get isLoading => _isLoading;

  ApiProvider() {
    libraryService = LibraryService();
    _pageNumber = 0;
    getResults();
  }

  void getResults() async {
    // '' is passed to sort type for unsorted results
    setLoading(true);
    pageIncrement();
    List<BookEntry> resultList = await libraryService.getSearchResult(
        SearchType.TITLE, '', '12', '$_pageNumber', '');

    _bookList.addAll(resultList);
    setLoading(false);
  }

  void setLoading(bool b) {
    _isLoading = b;
    notifyListeners();
  }

  void pageIncrement() {
    _pageNumber = _pageNumber + 1;
  }
}
