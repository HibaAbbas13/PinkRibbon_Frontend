import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pink_ribbon/model/Vedio.dart';
class VideoProvider with ChangeNotifier {
  List<Video> _videos = [];

  List<Video> get videos => _videos;

  Future<void> fetchVideos() async {
    try {
      final response = await http.get(Uri.parse('https://pinkribbon-afb2f3b6e998.herokuapp.com/api/video/videos'));
      if (response.statusCode == 200) {
        Iterable list = json.decode(response.body);
        _videos = list.map((model) => Video.fromJson(model)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load videos');
      }
    } catch (e) {
      print('Error fetching videos: $e');
      throw Exception('Failed to load videos');
    }
  }
}
