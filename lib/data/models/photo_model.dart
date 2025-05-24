class Photo {
  final int albumId;
  final String title; // <-- Add this
  final String thumbnailUrl;
  final String url;

  Photo({
    required this.albumId,
    required this.title, // <-- Include in constructor
    required this.thumbnailUrl,
    required this.url,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'],
      title: json['title'], // <-- Parse from JSON
      thumbnailUrl: json['thumbnailUrl'],
      url: json['url'],
    );
  }
}
