class VideoModel {
  final String videoId;
  final String videoName;
  final String videoPath;

  VideoModel({
    required this.videoId,
    required this.videoName,
    required this.videoPath,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      videoId: json['video_id'],
      videoName: json['video_name'],
      videoPath: json['video_path'],
    );
  }
}
