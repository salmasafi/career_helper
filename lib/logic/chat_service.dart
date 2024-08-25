import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatService {

  Future<String> sendMessage(String userMessage) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:5000/get_development_plan'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'input': userMessage,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData['response'];
    } else {
      throw Exception('Failed to get response from server');
    }
  }
}
