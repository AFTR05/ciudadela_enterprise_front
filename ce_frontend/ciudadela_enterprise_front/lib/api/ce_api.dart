
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:ciudadela_enterprise_front/services/local_storage.dart';

class CEApi {
  static const String baseUrl = 'https://api.ciudadelaenterprise.com';
  //static const String baseUrl = 'http://127.0.0.1:8080';


  static Future<dynamic> get(String path) async {
    try {
      final url = Uri.parse('$baseUrl/$path');
      final token = LocalStorage.prefs.getString('token');
      final authHeader = token != null && token.isNotEmpty ? 'Bearer $token' : '';
      final headers = {
        'content-type': 'application/json',
        'Authorization': authHeader,
        'Accept': '*/*',
      };
      final response = await http.get(url, headers: headers);
      if (response.statusCode >= 200 && response.statusCode < 500) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  static Future<dynamic> post(String path, Map<String, dynamic> data) async {
    try {
      final url = Uri.parse('$baseUrl/$path');
      final token = LocalStorage.prefs.getString('token');
      final authHeader = token != null && token.isNotEmpty ? 'Bearer $token' : '';
      final headers = {
        'content-type': 'application/json',
        'Authorization': authHeader,
        'Accept': '*/*',
      };
      
      final body = jsonEncode(data);
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode >= 200 && response.statusCode < 500) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  static Future<dynamic> put(String path, Map<String, dynamic> data) async {
    try {
      final url = Uri.https('$baseUrl/$path');
      final token = LocalStorage.prefs.getString('token');
      final authHeader = token != null && token.isNotEmpty ? 'Bearer $token' : '';
      final headers = {
        'content-type': 'application/json',
        'Authorization': authHeader,
        'Accept': '*/*',
      };
      final body = jsonEncode(data);
      final response = await http.put(url, headers: headers, body: body);

      if (response.statusCode >= 200 && response.statusCode < 500) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  static Future<dynamic> delete(String path, Map<String, dynamic> data) async {
    try {
      final url = Uri.parse('$baseUrl/$path');
      final token = LocalStorage.prefs.getString('token');
      final authHeader = token != null && token.isNotEmpty ? 'Bearer $token' : '';
      final headers = {
        'content-type': 'application/json',
        'Authorization': authHeader,
        'Accept': '*/*',
      };
      final body = jsonEncode(data);
      final response = await http.delete(url, headers: headers, body: body);

      if (response.statusCode >= 200 && response.statusCode < 500) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  static Future<dynamic> updateFile(String path, Uint8List bytes) async {
    try {
      final url = Uri.parse('$baseUrl/$path');
      final token = LocalStorage.prefs.getString('token');
      final authHeader = token != null && token.isNotEmpty ? 'Bearer $token' : '';
      final headers = {
        'content-type': 'application/json',
        'Authorization': authHeader,
        'Accept': '*/*',
      };
      final formData = http.MultipartRequest('PUT', url);
      formData.headers.addAll(headers);
      formData.files.add(http.MultipartFile.fromBytes('archivo', bytes));
      final response = await formData.send();

      if (response.statusCode >= 200 && response.statusCode < 500) {
        final data = jsonDecode(await response.stream.bytesToString());
        return data;
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
