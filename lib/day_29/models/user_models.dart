// To parse this JSON data, do
//
//     final getUser = getUserFromJson(jsonString);

import 'dart:convert';

GetUser getUserFromJson(String str) => GetUser.fromJson(json.decode(str));

String getUserToJson(GetUser data) => json.encode(data.toJson());

class GetUser {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<GetUserData>? data;
  Support? support;
  Meta? meta;

  GetUser({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
    this.meta,
  });

  factory GetUser.fromJson(Map<String, dynamic> json) => GetUser(
    page: json["page"],
    perPage: json["per_page"],
    total: json["total"],
    totalPages: json["total_pages"],
    data: json["data"] == null
        ? []
        : List<GetUserData>.from(
            json["data"]!.map((x) => GetUserData.fromJson(x)),
          ),
    support: json["support"] == null ? null : Support.fromJson(json["support"]),
    meta: json["_meta"] == null ? null : Meta.fromJson(json["_meta"]),
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "per_page": perPage,
    "total": total,
    "total_pages": totalPages,
    "data": data == null
        ? []
        : List<dynamic>.from(data!.map((x) => x.toJson())),
    "support": support?.toJson(),
    "_meta": meta?.toJson(),
  };
}

class GetUserData {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  GetUserData({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory GetUserData.fromJson(Map<String, dynamic> json) => GetUserData(
    id: json["id"],
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "avatar": avatar,
  };
}

class Meta {
  String? poweredBy;
  String? docsUrl;
  String? upgradeUrl;
  String? exampleUrl;
  String? variant;
  String? message;
  Cta? cta;
  String? context;

  Meta({
    this.poweredBy,
    this.docsUrl,
    this.upgradeUrl,
    this.exampleUrl,
    this.variant,
    this.message,
    this.cta,
    this.context,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    poweredBy: json["powered_by"],
    docsUrl: json["docs_url"],
    upgradeUrl: json["upgrade_url"],
    exampleUrl: json["example_url"],
    variant: json["variant"],
    message: json["message"],
    cta: json["cta"] == null ? null : Cta.fromJson(json["cta"]),
    context: json["context"],
  );

  Map<String, dynamic> toJson() => {
    "powered_by": poweredBy,
    "docs_url": docsUrl,
    "upgrade_url": upgradeUrl,
    "example_url": exampleUrl,
    "variant": variant,
    "message": message,
    "cta": cta?.toJson(),
    "context": context,
  };
}

class Cta {
  String? label;
  String? url;

  Cta({this.label, this.url});

  factory Cta.fromJson(Map<String, dynamic> json) =>
      Cta(label: json["label"], url: json["url"]);

  Map<String, dynamic> toJson() => {"label": label, "url": url};
}

class Support {
  String? url;
  String? text;

  Support({this.url, this.text});

  factory Support.fromJson(Map<String, dynamic> json) =>
      Support(url: json["url"], text: json["text"]);

  Map<String, dynamic> toJson() => {"url": url, "text": text};
}
