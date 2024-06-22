import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://localhost:3000/items'));
    if (response.statusCode == 200) {
      // Parse and process the response data
      final data = json.decode(response.body);
      // Handle the data accordingly
    } else {
      // Handle error
      print('Failed to fetch data');
    }
  }
}
