import 'package:bookclub/data/samples/user_samples.dart';

class User {
  int? id;
  String name;
  String avatarUrl;
  String imageCoverUrl;
  String aboutMe;
  int followers = 0;

  User(
      {this.id,
      required this.name,
      required this.avatarUrl,
      required this.imageCoverUrl,
      required this.aboutMe,
      this.followers = 0});

  static List<User> getSamples() {
    return UserSamples.getSamples().map((e) {
      return User(
          id: e['id'],
          name: e['name'],
          followers: e['followers'],
          avatarUrl: e['avatarUrl'],
          imageCoverUrl: e['imageCoverUrl'],
          aboutMe: e['aboutMe']);
    }).toList();
  }
}
