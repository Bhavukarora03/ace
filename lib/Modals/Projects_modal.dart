



class Projects {
  List<Card>? card;

  Projects({this.card});

  Projects.fromJson(Map<String, dynamic> json) {
    if (json['Card'] != null) {
      card = <Card>[];
      json['Card'].forEach((v) {
        card!.add(new Card.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.card != null) {
      data['Card'] = this.card!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Card {
  String? images;
  String? tools;
  String? title;
  String? content;
  String? madeby;

  Card({this.images, this.tools, this.title, this.content, this.madeby});

  Card.fromJson(Map<String, dynamic> json) {
    images = json['images'];
    tools = json['tools'];
    title = json['title'];
    content = json['content'];
    madeby = json['Madeby'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['images'] = this.images;
    data['tools'] = this.tools;
    data['title'] = this.title;
    data['content'] = this.content;
    data['Madeby'] = this.madeby;
    return data;
  }
}
