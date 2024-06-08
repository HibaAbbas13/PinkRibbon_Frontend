import 'package:flutter/material.dart';
import 'package:pink_ribbon/data/App_colors.dart';
import 'package:pink_ribbon/data/Typography.dart';
import 'package:pink_ribbon/providers/Youtube_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeVideoScreen extends StatefulWidget {
  @override
  State<YouTubeVideoScreen> createState() => _YouTubeVideoScreenState();
}

class _YouTubeVideoScreenState extends State<YouTubeVideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "All About Pinkribbon",
            style:
                AppTypography.kSemiBold18.copyWith(color: AppColors.kPrimary),
          ),
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) => VideoModel(), // Provide VideoModel instance
        child: Consumer<VideoModel>(
          builder: (context, videoModel, _) {
            final videoLinks = videoModel.videoLinks;
            if (videoLinks.isEmpty) {
              return Center(
                child: Text('No video links available.'),
              );
            } else {
              return ListView.builder(
                itemCount: videoLinks.length,
                itemBuilder: (context, index) {
                  final controller = YoutubePlayerController(
                    initialVideoId:
                        YoutubePlayer.convertUrlToId(videoLinks[index]) ?? '',
                    flags: const YoutubePlayerFlags(
                      autoPlay: true,
                      mute: false,
                    ),
                  );
                  return Card(
                    child: Column(
                      children: [
                        YoutubePlayer(
                          aspectRatio: 16 / 9,
                          controller: controller,
                          showVideoProgressIndicator: true,
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
