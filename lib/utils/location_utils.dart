import 'dart:convert';
import 'package:http/http.dart' as http;

class LocationService {

  Future<List<String>> fetchStates() async {
    try {
      final response = await http.get(Uri.parse('https://nga-states-lga.onrender.com/fetch'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        print('results from state is $data');
        return data.map((state) => state.toString()).toList();
      } else {
        print('no result for states');
        return [];
      }
    } catch (e) {
      return [];
    }
  }



  // Function to fetch LGAs for a specific state from the API
  Future<List<String>> fetchLGAs(String state) async {
    try {
      final response = await http.get(Uri.parse('https://nga-states-lga.onrender.com/?state=$state'));
      if (response.statusCode == 200) {
        List<dynamic> lgaList = json.decode(response.body);
        return lgaList.map((l) => l.toString()).toList();
      } else {
        // Handle error or display message
        return [];
      }
    } catch (e) {
      // Handle error or display message
      return [];
    }
  }
}
