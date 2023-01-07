import 'package:hive/hive.dart';

part 'Users.g.dart';

@HiveType(typeId: 0)
class Users {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? email;
  @HiveField(3)
  String? phone;
  @HiveField(4)
  String? idCard;
  @HiveField(5)
  String? profile;
  @HiveField(6)
  String? role;
  @HiveField(7)
  String? status;
  @HiveField(8)
  int? createdAt;
  @HiveField(9)
  String? address;

  Users({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.idCard,
    this.profile,
    this.role,
    this.status,
    this.createdAt,
    this.address,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        idCard: json['id_card'],
        profile: json['profile'],
        role: json['role'],
        status: json['status'],
        createdAt: json['created_at'],
        address: json['address'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'id_card': idCard,
        'profile': profile,
        'role': role,
        'status': status,
        'created_at': createdAt,
        'address': address,
      };

  Map<String, dynamic> updateToJson() => {
        'name': name,
        'phone': phone,
        'profile': profile,
        'address': address,
      };
}
