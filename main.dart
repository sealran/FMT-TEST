import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  final url = await http.get(Uri.parse("https://api.publicapis.org/entries"));
  //print(response.body);                                 //show inputdata all
  // print(response.body.runtimeType);

  RawData rawData = RawData.fromJson(jsonDecode(url.body));

  print(rawData.toJson());

  //print(rawData.runtimeType);
}

class RawData {
  int? count;
  List<Entries>? entries;

  RawData({this.count, this.entries});

  RawData.fromJson(Map<String, dynamic> json) {
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
    aPI = json['API'];
    description = json['Description'];
    auth = json['Auth'];
    hTTPS = json['HTTPS'];
    cors = json['Cors'];
    link = json['Link'];
    category = json['Category'];
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

    if (hTTPS == false) {
      print("{");
      print(data["API"]);
      print(data["Description"]);
      print(data["Auth"]);
      print(data["HTTPS"]);
      print(data["Link"]);
      print(data["Category"]);
      print("};");
    }

    return data;
  }
}
