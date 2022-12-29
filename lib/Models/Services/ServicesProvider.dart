import 'package:hive/hive.dart';

part 'ServicesProvider.g.dart';

@HiveType(typeId: 1)
class ServicesProvider {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? description;
  @HiveField(3)
  String? image;
  @HiveField(4)
  String? status;
  @HiveField(5)
  int? createdAt;
  @HiveField(6)
  String? creatorId;
  @HiveField(7)
  String? creatorName;
  @HiveField(8)
  String? creatorEmail;
  @HiveField(9)
  String? creatorPhone;
  @HiveField(10)
  String? creatorIdCard;
  @HiveField(11)
  String? creatorProfile;
  @HiveField(12)
  Map<String, dynamic>? contact;
  @HiveField(13)
  List<String>? services;
  @HiveField(14)
  List<String>? images;
  @HiveField(15)
  List<String>? videos;
  @HiveField(16)
  List<String>? certificates;
  @HiveField(17)
  double? rating;
  @HiveField(18)
  List<Map<String, dynamic>>? reviews;
  @HiveField(19)
  double? lat;
  @HiveField(20)
  double? lng;
  @HiveField(21)
  Map<String, dynamic>? location;

  ServicesProvider({
    this.id,
    this.title,
    this.description,
    this.image,
    this.status,
    this.createdAt,
    this.creatorId,
    this.creatorName,
    this.creatorEmail,
    this.creatorPhone,
    this.creatorIdCard,
    this.creatorProfile,
    this.contact,
    this.services,
    this.images,
    this.videos,
    this.certificates,
    this.rating,
    this.reviews,
    this.lat,
    this.lng,
    this.location,
  });

  factory ServicesProvider.fromJson(Map<String, dynamic> json) =>
      ServicesProvider(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        image: json['image'],
        status: json['status'],
        createdAt: json['created_at'],
        creatorId: json['creator_id'],
        creatorName: json['creator_name'],
        creatorEmail: json['creator_email'],
        creatorPhone: json['creator_phone'],
        creatorIdCard: json['creator_id_card'],
        creatorProfile: json['creator_profile'],
        contact: json['contact'],
        services: json['services'],
        images: json['images'],
        videos: json['videos'],
        certificates: json['certificates'],
        rating: json['rating'],
        reviews: json['reviews'],
        lat: json['lat'],
        lng: json['lng'],
        location: json['location'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'image': image,
        'status': status,
        'created_at': createdAt,
        'creator_id': creatorId,
        'creator_name': creatorName,
        'creator_email': creatorEmail,
        'creator_phone': creatorPhone,
        'creator_id_card': creatorIdCard,
        'creator_profile': creatorProfile,
        'contact': contact,
        'services': services,
        'images': images,
        'videos': videos,
        'certificates': certificates,
        'rating': rating,
        'reviews': reviews,
        'lat': lat,
        'lng': lng,
        'location': location,
      };
}
