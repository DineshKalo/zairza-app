import 'package:flutter/material.dart';
import 'package:youtube/youtube.dart';
import 'package:zairza_app/constants/global_variables.dart';

import '../../models/video_model.dart';

class VideoCard extends StatelessWidget {
  final Video video;

  const VideoCard({super.key,required this.video});

  Future<String?> _fetchThumbnail() async {
    await Youtube.config(videoId: video.url);
    var thumbnails = Youtube.thumbnails;
    return thumbnails.hq; // Return the HQ thumbnail URL
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.73488372093,
      decoration: BoxDecoration(
          border: Border.all(width: 2), borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(6), topRight: Radius.circular(6)),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                  decoration: const BoxDecoration(
                      border: BorderDirectional(bottom: BorderSide(width: 2))),
                  child: Image.network(
                    _fetchThumbnail().toString(),
                    fit: BoxFit.fitWidth,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(video.name,
                    style: GlobalVariables.textBold_14),
                Text(
                  video.description,
                  style: GlobalVariables.textRegular_12,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
