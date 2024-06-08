import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class VideoModel extends ChangeNotifier {
  List<String> _videoLinks = [
    'https://youtu.be/m6ihFqL4cjo?si=oMx6sNIpZaYPiR5W',
    "https://youtu.be/yOU0hR769cA?si=F_2IovnkxPadnImh",
    "https://youtu.be/ulV2YUnzOb0?si=oguNTBloL1oVHRPf",
    "https://youtu.be/Zx_UTIPSC90?si=KslpIO6rF3rZ2bw0"
  ];

  List<String> get videoLinks => _videoLinks;

  void addVideoLink(String link) {
    _videoLinks.add(link);
    notifyListeners();
  }

  void removeVideoLink(int index) {
    _videoLinks.removeAt(index);
    notifyListeners();
  }
}
