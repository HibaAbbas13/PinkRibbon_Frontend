import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pink_ribbon/model/Transaction.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TransactionProvider with ChangeNotifier {
  final String _baseUrl = 'http://172.21.144.1:1479/api';
  final _storage = FlutterSecureStorage();

  Future<String> getToken() async {
    return await _storage.read(key: 'auth_token') ?? '';
  }
  


  Future<void> uploadTransaction({
    required String userId,
    required int amount,
    required String username,
    required String useraccount,
    required String imagePath,
  }) async {
    final url = Uri.parse('$_baseUrl/transaction/upload');
    final token = await getToken();
    final request = http.MultipartRequest('POST', url);

    request.fields['user'] = userId;
    request.fields['amount'] = amount.toString();
    request.fields['username'] = username;
    request.fields['useraccount'] = useraccount;

    File imageFile = File(imagePath);
    if (!imageFile.existsSync()) {
      throw Exception('Image file does not exist at the provided path');
    }

    request.files.add(await http.MultipartFile.fromPath('TransactionImage', imagePath));

    // Add the authorization token to the request headers
    request.headers['Authorization'] = 'Bearer $token';

    try {
      final response = await request.send();
      if (response.statusCode == 201) {
        notifyListeners();
      } else {
        final responseBody = await http.Response.fromStream(response);
        throw Exception('Failed to upload transaction: ${responseBody.body}');
      }
    } catch (error) {
      throw Exception('Error uploading transaction: $error');
    }
  }

  Future<List<Transaction>> getTransactions() async {
    final url = Uri.parse('$_baseUrl/transaction');
    final token = await getToken();
    try {
      final response = await http.get(url, headers: {
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        final List<dynamic> transactionJson = jsonDecode(response.body);
        return transactionJson.map((json) => Transaction.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch transactions');
      }
    } catch (error) {
      throw Exception('Error fetching transactions: $error');
    }
  }
}