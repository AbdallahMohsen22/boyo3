class ServiceApprovModel {
  final int? id;
  final List<String>? userAds;
  final String? title;
  final String? type1;
  final String? type2;
  final String? type3;
  final String? country;
  final String? city;
  final DateTime? createdDate;
  final String? description;
  final double? price;
  final String? image1;
  final String? image2;
  final String? image3;
  final double? latitude;
  final double? longitude;
  final String? phoneNumber;
  final String? warranty;
  final String? whatsAppNumber;
  final int? countDay;
  final int? countPerson;
  final String? fromCountry;
  final String? toCountry;
  final bool? isApproved;

  ServiceApprovModel({
    this.id,
    this.userAds,
    this.title,
    this.type1,
    this.type2,
    this.type3,
    this.country,
    this.city,
    this.createdDate,
    this.description,
    this.price,
    this.image1,
    this.image2,
    this.image3,
    this.latitude,
    this.longitude,
    this.phoneNumber,
    this.warranty,
    this.whatsAppNumber,
    this.countDay,
    this.countPerson,
    this.fromCountry,
    this.toCountry,
    this.isApproved,
  });

  factory ServiceApprovModel.fromJson(Map<String, dynamic> json) {
    return ServiceApprovModel(
      id: json['id'],
      userAds: List<String>.from(json['userAds']),
      title: json['title'],
      type1: json['type1'],
      type2: json['type2'],
      type3: json['type3'],
      country: json['country'],
      city: json['city'],
      createdDate: DateTime.parse(json['createdDate']),
      description: json['description'],
      price: json['price'].toDouble(),
      image1: json['image1'],
      image2: json['image2'],
      image3: json['image3'],
      latitude: json['latitude'].toDouble(),
      longitude: json['longitude'].toDouble(),
      phoneNumber: json['phoneNumber'],
      warranty: json['warranty'],
      whatsAppNumber: json['whatsAppNumber'],
      countDay: json['countDay'],
      countPerson: json['countPerson'],
      fromCountry: json['fromCountry'],
      toCountry: json['toCountry'],
      isApproved: json['isApproved'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userAds': userAds,
      'title': title,
      'type1': type1,
      'type2': type2,
      'type3': type3,
      'country': country,
      'city': city,
      'createdDate': createdDate!.toIso8601String(),
      'description': description,
      'price': price,
      'image1': image1,
      'image2': image2,
      'image3': image3,
      'latitude': latitude,
      'longitude': longitude,
      'phoneNumber': phoneNumber,
      'warranty': warranty,
      'whatsAppNumber': whatsAppNumber,
      'countDay': countDay,
      'countPerson': countPerson,
      'fromCountry': fromCountry,
      'toCountry': toCountry,
      'isApproved': isApproved,
    };
  }
}
