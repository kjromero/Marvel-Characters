// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Response responseFromJson(String str) => Response.fromJson(json.decode(str));

String responseToJson(Response data) => json.encode(data.toJson());

class Response {
  Response({
    required this.code,
    required this.status,
    required this.copyright,
    required this.attributionText,
    required this.attributionHtml,
    required this.etag,
    required this.data,
  });

  int code;
  String status;
  String copyright;
  String attributionText;
  String attributionHtml;
  String etag;
  Data data;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    code: json["code"],
    status: json["status"],
    copyright: json["copyright"],
    attributionText: json["attributionText"],
    attributionHtml: json["attributionHTML"],
    etag: json["etag"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "copyright": copyright,
    "attributionText": attributionText,
    "attributionHTML": attributionHtml,
    "etag": etag,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  int offset;
  int limit;
  int total;
  int count;
  List<Character> results;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    offset: json["offset"],
    limit: json["limit"],
    total: json["total"],
    count: json["count"],
    results: List<Character>.from(json["results"].map((x) => Character.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "offset": offset,
    "limit": limit,
    "total": total,
    "count": count,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Character {
  Character({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.thumbnail,
    required this.resourceUri,
    required this.comics,
    required this.series,
    required this.stories,
    required this.events,
    required this.urls,
  });

  int id;
  String name;
  String description;
  String modified;
  Thumbnail thumbnail;
  String resourceUri;
  Comics comics;
  Comics series;
  Stories stories;
  Comics events;
  List<Url> urls;

  factory Character.fromJson(Map<String, dynamic> json) => Character(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    modified: json["modified"],
    thumbnail: Thumbnail.fromJson(json["thumbnail"]),
    resourceUri: json["resourceURI"],
    comics: Comics.fromJson(json["comics"]),
    series: Comics.fromJson(json["series"]),
    stories: Stories.fromJson(json["stories"]),
    events: Comics.fromJson(json["events"]),
    urls: List<Url>.from(json["urls"].map((x) => Url.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "modified": modified,
    "thumbnail": thumbnail.toJson(),
    "resourceURI": resourceUri,
    "comics": comics.toJson(),
    "series": series.toJson(),
    "stories": stories.toJson(),
    "events": events.toJson(),
    "urls": List<dynamic>.from(urls.map((x) => x.toJson())),
  };
}

class Comics {
  Comics({
    required this.available,
    required this.collectionUri,
    required this.items,
    required this.returned,
  });

  int available;
  String collectionUri;
  List<ComicsItem> items;
  int returned;

  factory Comics.fromJson(Map<String, dynamic> json) => Comics(
    available: json["available"],
    collectionUri: json["collectionURI"],
    items: List<ComicsItem>.from(json["items"].map((x) => ComicsItem.fromJson(x))),
    returned: json["returned"],
  );

  Map<String, dynamic> toJson() => {
    "available": available,
    "collectionURI": collectionUri,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "returned": returned,
  };
}

class ComicsItem {
  ComicsItem({
    required this.resourceUri,
    required this.name,
  });

  String resourceUri;
  String name;

  factory ComicsItem.fromJson(Map<String, dynamic> json) => ComicsItem(
    resourceUri: json["resourceURI"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "resourceURI": resourceUri,
    "name": name,
  };
}

class Stories {
  Stories({
    required this.available,
    required this.collectionUri,
    required this.items,
    required this.returned,
  });

  int available;
  String collectionUri;
  List<StoriesItem> items;
  int returned;

  factory Stories.fromJson(Map<String, dynamic> json) => Stories(
    available: json["available"],
    collectionUri: json["collectionURI"],
    items: List<StoriesItem>.from(json["items"].map((x) => StoriesItem.fromJson(x))),
    returned: json["returned"],
  );

  Map<String, dynamic> toJson() => {
    "available": available,
    "collectionURI": collectionUri,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "returned": returned,
  };
}

class StoriesItem {
  StoriesItem({
    required this.resourceUri,
    required this.name,
    required this.type,
  });

  String resourceUri;
  String name;
  ItemType type;

  factory StoriesItem.fromJson(Map<String, dynamic> json) => StoriesItem(
    resourceUri: json["resourceURI"],
    name: json["name"],
    type: itemTypeValues.map[json["type"]]!,
  );

  Map<String, dynamic> toJson() => {
    "resourceURI": resourceUri,
    "name": name,
    "type": itemTypeValues.reverse[type],
  };
}

enum ItemType { COVER, INTERIOR_STORY, EMPTY }

final itemTypeValues = EnumValues({
  "cover": ItemType.COVER,
  "": ItemType.EMPTY,
  "interiorStory": ItemType.INTERIOR_STORY
});

class Thumbnail {
  Thumbnail({
    required this.path,
    required this.extension,
  });

  String path;
  Extension extension;

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
    path: json["path"],
    extension: extensionValues.map[json["extension"]]!,
  );

  Map<String, dynamic> toJson() => {
    "path": path,
    "extension": extensionValues.reverse[extension],
  };
}

enum Extension { JPG, GIF }

final extensionValues = EnumValues({
  "gif": Extension.GIF,
  "jpg": Extension.JPG
});

class Url {
  Url({
    required this.type,
    required this.url,
  });

  UrlType type;
  String url;

  factory Url.fromJson(Map<String, dynamic> json) => Url(
    type: urlTypeValues.map[json["type"]]!,
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "type": urlTypeValues.reverse[type],
    "url": url,
  };
}

enum UrlType { DETAIL, WIKI, COMICLINK }

final urlTypeValues = EnumValues({
  "comiclink": UrlType.COMICLINK,
  "detail": UrlType.DETAIL,
  "wiki": UrlType.WIKI
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
