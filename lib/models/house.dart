class House {
  String? image;
  int? amount;
  String? address;
  int? bedrooms;
  int? bathrooms;
  int? area;
  int? garage;
  String? description;

  House({ this.image, this.amount, this.address, this.bedrooms, this.bathrooms, this.area, this.garage, this.description });

  House.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    amount = json['amount'];
    address = json['address'];
    bedrooms = json['bedrooms'];
    bathrooms = json['bathrooms'];
    area = json['area'];
    garage = json['garage'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['image'] = this.image;
    data['amount'] = this.amount;
    data['address'] = this.address;
    data['bedrooms'] = this.bedrooms;
    data['bathrooms'] = this.bathrooms;
    data['area'] = this.area;
    data['garage'] = this.garage;
    data['description'] = this.description;
    return data;
  }
}