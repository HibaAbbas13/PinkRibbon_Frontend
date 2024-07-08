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

  AuthProvider() {
    _loadUserProfileFromStorage();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setErrorMessage(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  Future<void> _loadUserProfileFromStorage() async {
    _setLoading(true);
    try {
      final userProfileString = await _storage.read(key: 'user_profile');
      if (userProfileString != null) {
        _userProfile = jsonDecode(userProfileString);
        notifyListeners();
      }
    } catch (error) {
      _setErrorMessage(error.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> signUp(String email, String password,
      String passwordConfirmation, String deviceToken) async {
    final url = Uri.parse(
        'https://pinkribbon-afb2f3b6e998.herokuapp.com/api/user/register');

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
    final url = Uri.parse(
        'https://pinkribbon-afb2f3b6e998.herokuapp.com/api/user/login');

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
        await _storage.write(key: 'user_id', value: _userId);
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
    final url = Uri.parse(
        'https://pinkribbon-afb2f3b6e998.herokuapp.com/api/user/$userId');

    _setLoading(true);
    _setErrorMessage('');

    try {
      final response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final userProfile = jsonDecode(response.body);
        if (userProfile != null) {
          _userProfile = userProfile;
          await _storage.write(
              key: 'user_profile', value: jsonEncode(userProfile));
          notifyListeners();
        } else {
          _setErrorMessage('User profile data is null');
          throw Exception('User profile data is null');
        }
      } else {
        final errorMessage = response.body ?? 'Failed to fetch user profile';
        _setErrorMessage(errorMessage);
        throw Exception(errorMessage);
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
    final url = Uri.parse(
        'https://pinkribbon-afb2f3b6e998.herokuapp.com/api/user/update');

    _setLoading(true);
    _setErrorMessage('');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(userProfileData),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        _userProfile = responseData;
        await _storage.write(
            key: 'user_profile', value: jsonEncode(responseData));
        notifyListeners();
      } else {
        if (response.headers['content-type']?.contains('application/json') ==
            true) {
          final responseData = jsonDecode(response.body);
          _setErrorMessage(
              responseData['message'] ?? 'Failed to update profile');
          throw Exception(
              responseData['message'] ?? 'Failed to update profile');
        } else {
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
