class UserModel {
  late int userId;
  late String mobile;
  late String password;

//<editor-fold desc="Data Methods">

  UserModel({
    required this.userId,
    required this.mobile,
    required this.password,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserModel &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          mobile == other.mobile &&
          password == other.password);

  @override
  int get hashCode => userId.hashCode ^ mobile.hashCode ^ password.hashCode;

  @override
  String toString() {
    return 'UserModel{' +
        ' userId: $userId,' +
        ' mobile: $mobile,' +
        ' password: $password,' +
        '}';
  }


  String toJson() {
    return '{' +

        ' "userId": "$userId",' +
        ' "mobile": "$mobile",' +
        ' "password": "$password" ' +
        '}';
  }

  UserModel copyWith({
    int? userId,
    String? mobile,
    String? password,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      mobile: mobile ?? this.mobile,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': this.userId,
      'mobile': this.mobile,
      'password': this.password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] as int,
      mobile: map['mobile'] as String,
      password: map['password'] as String,
    );
  }

//</editor-fold>
}