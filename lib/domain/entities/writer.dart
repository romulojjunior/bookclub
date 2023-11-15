import 'package:bookclub/data/samples/writer_samples.dart';

class Writer {
  int? id;
  String name;
  String avatarUrl;
  String imageCoverUrl;
  String aboutMe;
  int followers = 0;

  Writer(
      {this.id,
      required this.name,
      required this.avatarUrl,
      required this.imageCoverUrl,
      required this.aboutMe,
      this.followers = 0});

  static List<Writer> getSamples() {
    return WriterSamples.getSamples().map((e) {
      return Writer(
          id: e['id'],
          name: e['name'],
          followers: e['followers'],
          avatarUrl: e['avatarUrl'],
          imageCoverUrl: e['imageCoverUrl'],
          aboutMe: e['aboutMe']);
    }).toList();
  }
}
