class Writer {
  int? id;
  String name;
  String avatarUrl;
  String aboutMe;
  int followers = 0;

  Writer({this.id, required this.name, required this.avatarUrl, required this.aboutMe, this.followers = 0});

  static sample() {
    return [
      Writer(
          id: 1,
          name: 'Jane',
          followers: 143,
          avatarUrl:
              'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80',
          aboutMe:
              'Latin words, consectetur, from a Lorem Ipsum sage, and going through the cites of the word in classical literature, discns 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil)'),
      Writer(
          id: 2,
          name: 'Caroline',
          followers: 0,
          avatarUrl:
              'https://thumbs.dreamstime.com/b/surprised-female-person-confused-isolated-surprised-female-person-confused-isolated-168304856.jpg',
          aboutMe:
              'Latin words, consectetur, from a Lorem Ipsum sage, and going through the cites of the word in classical literature, discns 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil)'),
      Writer(
          id: 3,
          name: 'Olga',
          followers: 1,
          avatarUrl: 'https://engineering.unl.edu/images/staff/Kayla-Person.jpg',
          aboutMe:
              'Latin words, consectetur, from a Lorem Ipsum sage, and going through the cites of the word in classical literature, discns 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil)'),
      Writer(
          id: 4,
          name: 'Maria',
          followers: 233,
          avatarUrl:
              'https://media.glamourmagazine.co.uk/photos/623b3612980be8aafb01a665/3:4/w_1440,h_1920,c_limit/The%20Worst%20Person%20In%20The%20World%20230322GettyImages-1385537039_SQ.jpg',
          aboutMe:
              'Latin words, consectetur, from a Lorem Ipsum sage, and going through the cites of the word in classical literature, discns 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil)'),
      Writer(
          id: 5,
          name: 'Bob',
          followers: 23,
          avatarUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNbL3Db8jRmaHbhvB87xESXr5iZspSRShOtIJRhhSFZAKgbaZ-NdOGBSzZ-ai3RDxFwuo&usqp=CAU',
          aboutMe:
              'Latin words, consectetur, from a Lorem Ipsum sage, and going through the cites of the word in classical literature, discns 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil)'),
      Writer(
          id: 6,
          name: 'Tony',
          followers: 243,
          avatarUrl: 'https://m0.her.ie/wp-content/uploads/2018/01/07093633/GettyImages-887815620.jpg',
          aboutMe:
              'Latin words, consectetur, from a Lorem Ipsum sage, and going through the cites of the word in classical literature, discns 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil)'),
      Writer(
          id: 7,
          name: 'Paula',
          followers: 313,
          avatarUrl:
              'https://media.king5.com/assets/BUZZ60/images/5aa92dff-e79d-41b1-9127-85fccb8214df/5aa92dff-e79d-41b1-9127-85fccb8214df_1920x1080.jpg',
          aboutMe:
              'Latin words, consectetur, from a Lorem Ipsum sage, and going through the cites of the word in classical literature, discns 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil)'),
    ];
  }
}
