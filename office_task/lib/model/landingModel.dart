// import 'dart:convert';

// HomeResponse homeResponseFromJson(String str) =>
//     HomeResponse.fromJson(json.decode(str));

// String homeResponseToJson(HomeResponse data) => json.encode(data.toJson());

// class HomeResponse {
//   Data data;
//   List<Item> items;

//   HomeResponse({
//     required this.data,
//     required this.items,
//   });

//   factory HomeResponse.fromJson(Map<String, dynamic> json) => HomeResponse(
//         data: Data.fromJson(json["data"]),
//         items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "data": data.toJson(),
//         "items": List<dynamic>.from(items.map((x) => x.toJson())),
//       };
// }

// class Data {
//   List<Item> momo;
//   List<Item> burger;

//   Data({
//     required this.momo,
//     required this.burger,
//   });

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         momo: List<Item>.from(json["MOMO"].map((x) => Item.fromJson(x))),
//         burger: List<Item>.from(json["Burger"].map((x) => Item.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "MOMO": List<dynamic>.from(momo.map((x) => x.toJson())),
//         "Burger": List<dynamic>.from(burger.map((x) => x.toJson())),
//       };
// }

// class Item {
//   int id;
//   String? title;
//   String image;
//   String? status;
//   String? categoryId;
//   String? typeId;
//   String? currentPrice;
//   String? previousPrice;
//   DateTime createdAt;
//   DateTime updatedAt;
//   String? description;
//   List<Addon> variants;
//   List<Addon> addons;
//   Categories categories;

//   Item({
//     required this.id,
//     required this.title,
//     required this.image,
//     required this.status,
//     required this.categoryId,
//     required this.typeId,
//     required this.currentPrice,
//     required this.previousPrice,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.description,
//     required this.variants,
//     required this.addons,
//     required this.categories,
//   });

//   factory Item.fromJson(Map<String, dynamic> json) => Item(
//         id: json["id"],
//         title: json["title"],
//         image: json["image"],
//         status: json["status"],
//         categoryId: json["category_id"],
//         typeId: json["type_id"],
//         currentPrice: json["current_price"],
//         previousPrice: json["previous_price"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         description: json["description"],
//         variants:
//             List<Addon>.from(json["variants"].map((x) => Addon.fromJson(x))),
//         addons: List<Addon>.from(json["addons"].map((x) => Addon.fromJson(x))),
//         categories: Categories.fromJson(json["categories"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "image": image,
//         "status": status,
//         "category_id": categoryId,
//         "type_id": typeId,
//         "current_price": currentPrice,
//         "previous_price": previousPrice,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "description": description,
//         "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
//         "addons": List<dynamic>.from(addons.map((x) => x.toJson())),
//         "categories": categories.toJson(),
//       };
// }

// class Addon {
//   int id;
//   String? title;
//   String image;
//   String? status;
//   String? currentPrice;
//   String? previousPrice;
//   String? itemId;
//   DateTime createdAt;
//   DateTime updatedAt;

//   Addon({
//     required this.id,
//     required this.title,
//     required this.image,
//     required this.status,
//     required this.currentPrice,
//     required this.previousPrice,
//     required this.itemId,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory Addon.fromJson(Map<String, dynamic> json) => Addon(
//         id: json["id"],
//         title: json["title"],
//         image: json["image"],
//         status: json["status"],
//         currentPrice: json["current_price"],
//         previousPrice: json["previous_price"],
//         itemId: json["item_id"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "image": image,
//         "status": status,
//         "current_price": currentPrice,
//         "previous_price": previousPrice,
//         "item_id": itemId,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//       };
// }

// class Categories {
//   int? id;
//   Name? name;
//   DateTime createdAt;
//   DateTime updatedAt;

//   Categories({
//     required this.id,
//     required this.name,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory Categories.fromJson(Map<String, dynamic> json) => Categories(
//         id: json["id"],
//         name: nameValues.map[json["name"]]!,
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": nameValues.reverse[name],
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//       };
// }

// enum Name { BURGER, MOMO }

// final nameValues = EnumValues({"Burger": Name.BURGER, "MOMO": Name.MOMO});

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
