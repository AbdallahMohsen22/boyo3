class Ad {
  final String? fullName;
  final int? id;
  final String? title;
  final String? description;
  final String? type1;
  final String? type2;
  final String? type3;
  final String? image1;
  final String? image2;
  final String? image3;
  final String? city;
  final String? country;
  final String? createdDate;
  final String? longitude;
  final String? latitude;
  final String? phoneNumber;
  final int? price;
  final int? countDay;
  final String? toCountry;
  final String? warranty;
  final String? fromCountry;
  final int? countPerson;
  final String? whatsAppNumber;
  final bool? isApproved;
  final String? userid;

  Ad({
     this.fullName,
     this.id,
     this.title,
     this.description,
     this.type1,
     this.type2,
     this.type3,
     this.image1,
     this.image2,
     this.image3,
     this.city,
     this.country,
     this.createdDate,
     this.longitude,
     this.latitude,
     this.phoneNumber,
     this.price,
     this.countDay,
     this.toCountry,
     this.warranty,
     this.fromCountry,
     this.countPerson,
     this.whatsAppNumber,
     this.isApproved,
    this.userid
  });

  factory Ad.fromJson(Map<String, dynamic> json) {
    return Ad(
      fullName: json['fullName'],
      id: json['id'],
      title: json['title'],
      description: json['description'],
      type1: json['type1'],
      type2: json['type2'],
      type3: json['type3'],
      image1: json['image1'],
      image2: json['image2'],
      image3: json['image3'],
      city: json['city'],
      country: json['country'],
      createdDate: json['createdDate'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      phoneNumber: json['phoneNumber'],
      price: json['price'],
      countDay: json['countDay'],
      toCountry: json['toCountry'],
      warranty: json['warranty'],
      fromCountry: json['fromCountry'],
      countPerson: json['countPerson'],
      whatsAppNumber: json['whatsAppNumber'],
      isApproved: json['isApproved'],
      userid: json['userId'],
    );
  }
}
