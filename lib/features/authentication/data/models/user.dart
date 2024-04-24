class User {
  String? id;
  String? displayName;
  String fullName;
  bool? isActive;
  String? phone;
  String? userType;
  String email;
  String? registerationDate;
  String? lastLoginDate;
  String? password;
  String? userImage;
  String? deviceToken;
  dynamic districtId;
  dynamic categoryId;
  User({
    this.id,
    this.displayName,
    required this.fullName,
    this.isActive,
    this.phone,
    this.userType,
    required this.email,
    this.registerationDate,
    this.lastLoginDate,
    this.password,
    this.userImage,
    this.deviceToken,
    this.districtId,
    this.categoryId,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      displayName: json['displayName'],
      fullName: json['fullname'],
      isActive: json['is_active'],
      phone: json['phone'],
      userType: json['userType'],
      email: json['email'],
      registerationDate: json['registerationDate'],
      lastLoginDate: json['lastLoginDate'],
      password: json['password'],
      userImage: json['image'],
      deviceToken: json['deviceToken'],
      districtId: json['districtId'],
      categoryId: json['categoryId'],
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'displayName': displayName,
        'fullname': fullName,
        'is_active': isActive,
        'phone': phone,
        'userType': userType,
        'email': email,
        'registerationDate': registerationDate, // convert DateTime to string
        'lastLoginDate': lastLoginDate, // convert DateTime to string
        'password': password,
        'image': userImage,
        'deviceToken': deviceToken,
        "districtId": districtId,
        "categoryId": categoryId,
      };
}
