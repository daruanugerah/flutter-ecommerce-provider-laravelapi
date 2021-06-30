import 'package:bwa_ecom_prov/models/category_model.dart';
import 'package:bwa_ecom_prov/models/gallery_model.dart';

class ProductModel {
  int id;
  String name;
  double price;
  String description;
  String tags;
  CategoryModel category;
  DateTime createdAt;
  DateTime updatedAt;
  List<GalleryModel> galleries;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.tags,
    this.category,
    this.createdAt,
    this.updatedAt,
    this.galleries,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    tags = json['tags'];
    category = CategoryModel.fromJson(json['category']);
    galleries = json['galleries']
        .map<GalleryModel>((e) => GalleryModel.fromJson(e))
        .toList();
    createdAt = DateTime.parse(json[
        'created_at']); // bcause data type in api is string, so parse datetime
    updatedAt = DateTime.parse(json[
        'updated_at']); // bcause data type in api is string, so parse datetime
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'tags': tags,
      'category': category
          .toJson(), // bcause this category will be reverted to json again
      'galleries': galleries.map((e) => e.toJson()).toList(),
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
    };
  }
}
