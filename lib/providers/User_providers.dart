import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthProvider with ChangeNotifier {
  final _storage = FlutterSecureStorage();
  bool _isLoading = false;
  String _errorMessage = '';
  String? _userId;
  Map<String, dynamic>? _userProfile;

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  String? get userId => _userId;
  Map<String, dynamic>? get userProfile => _userProfile;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setErrorMessage(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  Future<void> signUp(String email, String password,
      String passwordConfirmation, String deviceToken) async {
    final url = Uri.parse('http://172.21.144.1:1479/api/user/register');

    _setLoading(true);
    _setErrorMessage('');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirmation,
          'deviceToken': deviceToken,
        }),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 201) {
        _userId = responseData['userId'];
        await _storage.write(key: 'auth_token', value: responseData['token']);
        notifyListeners();
      } else {
        _setErrorMessage(responseData['message'] ?? 'Failed to register user');
        throw Exception(responseData['message'] ?? 'Failed to register user');
      }
    } catch (error) {
      _setErrorMessage(error.toString());
      throw error;
    } finally {
      _setLoading(false);
    }
  }

  Future<void> signIn(String email, String password) async {
    final url = Uri.parse('http://172.21.144.1:1479/api/user/login');

    _setLoading(true);
    _setErrorMessage('');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final token = responseData['token'];
        _userId = responseData['userId'];
        await _storage.write(key: 'auth_token', value: token);
        notifyListeners();
      } else {
        throw Exception('Failed to authenticate user');
      }
    } catch (error) {
      _setErrorMessage(error.toString());
      throw error;
    } finally {
      _setLoading(false);
    }
  }

  Future<void> fetchUserProfile(String userId) async {
    final url = Uri.parse('http://172.21.144.1:1479/api/user/$userId');

    _setLoading(true);
    _setErrorMessage('');

    try {
      final response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        _userProfile = jsonDecode(response.body);
        notifyListeners();
      } else {
        final responseData = jsonDecode(response.body);
        _setErrorMessage(
            responseData['message'] ?? 'Failed to fetch user profile');
        throw Exception(
            responseData['message'] ?? 'Failed to fetch user profile');
      }
    } catch (error) {
      _setErrorMessage(error.toString());
      throw error;
    } finally {
      _setLoading(false);
    }
  }

  Future<void> updateUserProfile(
      String userId, Map<String, dynamic> userProfileData) async {
    final url = Uri.parse('http://172.21.144.1:1479/api/user/update');

    _setLoading(true);
    _setErrorMessage('');

    try {
      // Print request details for debugging
      print('Request URL: $url');
      print('Request Headers: ${{'Content-Type': 'application/json'}}');
      print('Request Body: ${jsonEncode(userProfileData)}');

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(userProfileData),
      );

      // Print response details for debugging
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        try {
          final responseData = jsonDecode(response.body);
          _userProfile = responseData;
          notifyListeners();
        } catch (jsonError) {
          _setErrorMessage('Failed to parse JSON response');
          throw Exception('Failed to parse JSON response');
        }
      } else {
        // Check if response is JSON
        if (response.headers['content-type']?.contains('application/json') ==
            true) {
          try {
            final responseData = jsonDecode(response.body);
            _setErrorMessage(
                responseData['message'] ?? 'Failed to update profile');
            throw Exception(
                responseData['message'] ?? 'Failed to update profile');
          } catch (jsonError) {
            _setErrorMessage('Failed to parse error response');
            throw Exception('Failed to parse error response');
          }
        } else {
          // Handle non-JSON error response
          _setErrorMessage('Server responded with non-JSON error');
          throw Exception(
              'Server responded with non-JSON error: ${response.body}');
        }
      }
    } catch (error) {
      _setErrorMessage(error.toString());
      throw error;
    } finally {
      _setLoading(false);
    }
  }
}
