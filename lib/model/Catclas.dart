class CatFact {
  String? fact;
  int? length;

  CatFact({this.fact, this.length});

  CatFact.fromJson(Map<String, dynamic> json) {
    fact = json['fact'].toString();
    length =int.parse( json['length'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fact'] = this.fact;
    data['length'] = this.length;
    return data;
  }
}

class CatFacttwo {
  String? activity;
  String? type;
  int? participants;
  int? price;
  String? link;
  String? key;
  double? accessibility;

  CatFacttwo(
      {
        this.activity,
        this.type,
        this.participants,
        this.price,
        this.link,
        this.key,
        this.accessibility});

  CatFacttwo.fromJson(Map<String, dynamic> json) {
    activity = json['activity'].toString();
    type = json['type'].toString();
    participants = int.parse(json['participants'].toString());
    price = int.parse(json['price'].toString());
    link = json['link'].toString();
    key = json['key'].toString();
    accessibility =double.parse( json['accessibility'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activity'] = this.activity;
    data['type'] = this.type;
    data['participants'] = this.participants;
    data['price'] = this.price;
    data['link'] = this.link;
    data['key'] = this.key;
    data['accessibility'] = this.accessibility;
    return data;
  }
}
class Age {
  int? count;
  String? name;
  int? age;

  Age({this.count, this.name, this.age});

  Age.fromJson(Map<String, dynamic> json) {
    count = int.parse(json['count'].toString());
    name = json['name'].toString();
    age = int.parse(json['age'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['name'] = this.name;
    data['age'] = this.age;
    return data;
  }
}