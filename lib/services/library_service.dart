import 'package:bankly_task/models/book_entry.dart';
import 'package:bankly_task/models/gbooks_response.dart';
import 'package:bankly_task/services/network_helper.dart';

class LibraryService {
  NetworkHelper networkHelper = NetworkHelper();

  Future<List<BookEntry>> getSearchResult(String requestType, String query,
      String limit, String page, String sortType) async {
    try {
      var response = await networkHelper.getLibraryData(
          requestType, query.toLowerCase(), limit, page, sortType);

      GBooksResponse _results = GBooksResponse.fromJson(response);

      print(_results.items);
      return _results.items;
    } catch (e) {
      print(e.toString());
    }
  }
}
