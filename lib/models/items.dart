import 'package:cloud_firestore/cloud_firestore.dart';

class Items
{
  String? productID;
  String? sellerUID;
  String? itemID;
  String? title;
  String? shortInfo;
  Timestamp? publishedDate;
  String? thumbnailUrl;
  String? longDescription;
  String? status;
  int? price;

  Items({
    this.productID,
    this.sellerUID,
    this.itemID,
    this.title,
    this.shortInfo,
    this.publishedDate,
    this.thumbnailUrl,
    this.longDescription,
    this.status,
  });

  Items.fromJson(Map<String, dynamic> json)
  {
    productID = json['productID'];
    sellerUID = json['sellerUID'];
    itemID = json['itemID'];
    title = json['title'];
    shortInfo = json['shortInfo'];
    publishedDate = json['publishedDate'];
    thumbnailUrl = json['thumbnailUrl'];
    longDescription = json['longDescription'];
    status = json['status'];
    price = json['price'];
  }

  Map<String, dynamic> toJson()
  {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['productID'] = productID;
    data['sellerUID'] = sellerUID;
    data['itemID'] = itemID;
    data['title'] = title;
    data['shortInfo'] = shortInfo;
    data['price'] = price;
    data['publishedDate'] = publishedDate;
    data['thumbnailUrl'] = thumbnailUrl;
    data['longDescription'] = longDescription;
    data['status'] = status;

    return data;
  }
}