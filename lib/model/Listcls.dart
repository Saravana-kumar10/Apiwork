class CheckList {
  int? count;
  List<Entries>? entries;

  CheckList({this.count, this.entries});

  CheckList.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['entries'] != null) {
      entries = <Entries>[];
      json['entries'].forEach((v) {
        entries!.add(new Entries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.entries != null) {
      data['entries'] = this.entries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Entries {
  String? aPI;
  String? description;
  String? auth;
  bool? hTTPS;
  String? cors;
  String? link;
  String? category;

  Entries(
      {this.aPI,
        this.description,
        this.auth,
        this.hTTPS,
        this.cors,
        this.link,
        this.category});

  Entries.fromJson(Map<String, dynamic> json) {
    aPI = json['API'].toString();
    description = json['Description'].toString();
    auth = json['Auth'].toString();
    hTTPS = bool.parse(json['HTTPS'].toString());
    cors = json['Cors'].toString();
    link = json['Link'].toString();
    category = json['Category'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['API'] = this.aPI;
    data['Description'] = this.description;
    data['Auth'] = this.auth;
    data['HTTPS'] = this.hTTPS;
    data['Cors'] = this.cors;
    data['Link'] = this.link;
    data['Category'] = this.category;
    return data;
  }
}