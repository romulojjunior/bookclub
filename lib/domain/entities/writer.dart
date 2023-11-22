class Writer {
  Writer(
      {this.id,
      required this.name,
      required this.avatarUrl,
      required this.imageCoverUrl,
      required this.aboutMe,
      this.followers = 0});

  int? id;
  String name;
  String avatarUrl;
  String imageCoverUrl;
  String aboutMe;
  int followers = 0;

  static Writer fromMap(Map<String, dynamic> object) {
    return Writer(
        id: object['id'],
        name: object['name'],
        followers: object['followers'],
        avatarUrl: object['avatarUrl'],
        imageCoverUrl: object['imageCoverUrl'],
        aboutMe: object['aboutMe']);
  }
}
