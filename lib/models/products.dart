import 'package:cloud_firestore/cloud_firestore.dart';

class Products
{
  String? productID;
  String? sellerUID;
  String? productTitle;
  String? productInfo;
  Timestamp? publishedDate;
  String? thumbnailUrl;
  String? status;

  Products({
    this.productID,
    this.sellerUID,
    this.productTitle,
    this.productInfo,
    this.publishedDate,
    this.thumbnailUrl,
    this.status,
  });

  Products.fromJson(Map<String, dynamic> json)
  {
    productID = json["productID"];
    sellerUID = json['productUID'];
    productTitle = json['productTitle'];
    productInfo = json['productInfo'];
    publishedDate = json['publishedDate'];
    thumbnailUrl = json['thumbnailUrl'];
    status = json['status'];
  }

  get sellerName => null;

  Map<String, dynamic> toJson()
  {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["productID"] = productID;
    data['sellerUID'] = sellerUID;
    data['productTitle'] = productTitle;
    data['productInfo'] = productInfo;
    data['publishedDate'] = publishedDate;
    data['thumbnailUrl'] = thumbnailUrl;
    data['status'] = status;

    return data;
  }
}
