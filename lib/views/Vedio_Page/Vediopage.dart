import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/data/typography.dart';
import 'package:pink_ribbon/model/Vedio.dart';
import 'package:pink_ribbon/providers/Vedio_Provider.dart';
import 'package:pink_ribbon/views/Components/Customappbar.dart';

import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoListScreen extends StatefulWidget {
  @override
  State<VideoListScreen> createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    final videoProvider = Provider.of<VideoProvider>(context, listen: false);
    videoProvider.fetchVideos();
    _controller = YoutubePlayerController(
      initialVideoId: '',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final videoProvider = Provider.of<VideoProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.kBackgroundPink1.withOpacity(0.4),
      appBar: const CustomAppBar(
        title: 'PinkRibbon',
        main: true,
      ),
      body: Consumer<VideoProvider>(
        builder: (context, provider, child) {
          if (provider.videos.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return SafeArea(
              child: ListView.separated(
                padding: EdgeInsets.only(
                    bottom: 80.h), // Padding to avoid bottom navigation bar
                shrinkWrap: true,
                itemCount: provider.videos.length,
                itemBuilder: (context, index) {
                  Video video = provider.videos[index];
                  String videoId =
                      YoutubePlayer.convertUrlToId(video.url) ?? '';
                  return ListTile(
                    subtitle: Center(
                      child: Text(
                        video.title,
                        style: AppTypography.kBold14
                            .copyWith(color: AppColors.kPrimary),
                      ),
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(top: 4.h, bottom: 4.h),
                      child: Container(
                        width: double.infinity,
                        height: 200.h, // Adjust the height as needed
                        child: YoutubePlayer(
                          controller: YoutubePlayerController(
                            initialVideoId: videoId,
                            flags: YoutubePlayerFlags(
                              autoPlay: false,
                              mute: false,
                            ),
                          ),
                          showVideoProgressIndicator: true,
                          progressIndicatorColor: AppColors.kPrimary,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 10.h,
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
