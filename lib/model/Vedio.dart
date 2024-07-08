// lib/models/video_model.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Video {
  final String id;
  final String title;
  final String url;

  Video({required this.id, required this.title, required this.url});

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['_id'],
      title: json['title'],
      url: json['url'],
    );
  }
}
