import 'package:http/http.dart' as http;
import 'dart:convert';

/// A utility class to handle API GET requests.
///
/// Returns the decoded JSON response on success or prints the status code
/// on failure.
class NetworkHelper {
  NetworkHelper({required this.url});

  /// The API endpoint to query with parameters included.
  final Uri url;

  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
