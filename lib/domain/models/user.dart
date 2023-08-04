class User {
  int? id;
  String name;
  String avatarUrl;

  User({this.id, required this.name, required this.avatarUrl});

  static sample() {
    return [
      User(
          id: 1,
          name: 'Jane',
          avatarUrl:
              'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
      User(
          id: 2,
          name: 'Caroline',
          avatarUrl:
              'https://thumbs.dreamstime.com/b/surprised-female-person-confused-isolated-surprised-female-person-confused-isolated-168304856.jpg'),
      User(id: 3, name: 'Olga', avatarUrl: 'https://engineering.unl.edu/images/staff/Kayla-Person.jpg'),
      User(
          id: 4,
          name: 'Maria',
          avatarUrl:
              'https://media.glamourmagazine.co.uk/photos/623b3612980be8aafb01a665/3:4/w_1440,h_1920,c_limit/The%20Worst%20Person%20In%20The%20World%20230322GettyImages-1385537039_SQ.jpg'),
      User(
          id: 5,
          name: 'Bob',
          avatarUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNbL3Db8jRmaHbhvB87xESXr5iZspSRShOtIJRhhSFZAKgbaZ-NdOGBSzZ-ai3RDxFwuo&usqp=CAU'),
      User(
          id: 6,
          name: 'Tony',
          avatarUrl: 'https://m0.her.ie/wp-content/uploads/2018/01/07093633/GettyImages-887815620.jpg'),
      User(
          id: 7,
          name: 'Paula',
          avatarUrl:
              'https://media.king5.com/assets/BUZZ60/images/5aa92dff-e79d-41b1-9127-85fccb8214df/5aa92dff-e79d-41b1-9127-85fccb8214df_1920x1080.jpg'),
    ];
  }
}