class UsersModel {
  UsersModel({
    required this.name,
    required this.email,
    required this.password,
    required this.profilePic,
    required this.pushToken,
    required this.id,
    required this.myTours,
  });

  late final String name;
  late final String email;
  late final String password;
  late final String profilePic;
  late final String pushToken;
  late final String id;
  late final List<String>? myTours;

  UsersModel.fromJson(Map<String, dynamic> json) {
    name = json['name'].toString();
    email = json['email'].toString();
    password = json['password'].toString();
    profilePic = json['profilePic'].toString();
    pushToken = json['pushToken'].toString();
    id = json['id'].toString();

    // Cast the myTours field to List<String>
    myTours = (json['myTours'] as List<dynamic>?)
        ?.map((item) => item.toString())
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['profilePic'] = profilePic;
    data['pushToken'] = pushToken;
    data['myTours'] = myTours;
    data['id'] = id;
    return data;
  }

  void fromJson() {}
}
