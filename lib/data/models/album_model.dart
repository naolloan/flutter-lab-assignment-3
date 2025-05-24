class Album {
  final int id;
  final String title;
  final String thumbnailUrl; // ✅ for showing cover image

  Album({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
  });

  factory Album.fromJson(Map<String, dynamic> json, {required String thumbnailUrl}) {
    return Album(
      id: json['id'],
      title: json['title'],
      thumbnailUrl: thumbnailUrl,
    );
  }
}
