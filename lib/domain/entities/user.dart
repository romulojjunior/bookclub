class User {
  int? id;
  String name;
  String avatarUrl;
  String aboutMe;
  int followers = 0;

  User({this.id, required this.name, required this.avatarUrl, required this.aboutMe, this.followers = 0});

  static sample() {
    return [
      User(
          id: 1,
          name: 'Maria',
          followers: 500,
          avatarUrl:
              'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80',
          aboutMe:
              'Latin words, consectetur, from a Lorem Ipsum sage, and going through the cites of the word in classical literature, discns 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil)'),
    ];
  }
}
