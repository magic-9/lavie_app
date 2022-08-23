class Product {

  late final String type;
  late final String message;
  late final List<ProductData> data;

  Product.fromJson(Map<String, dynamic> json){
    type = json['type'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>ProductData.fromJson(e)).toList();
  }
}

class ProductData {

  late final String productId;
  late final String name;
  late final String description;
  late final String imageUrl;
  late final String type;
  late final int price;
  late final bool available;
  late final ProductSeed? seed;
  late final ProductPlant? plant;
  late final ProductTool? tool;

  ProductData.fromJson(Map<String, dynamic> json){
    productId = json['productId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    type = json['type'];
    price = json['price'];
    available = json['available'];
    seed = ProductSeed.fromJson(json['data']['seed']);
    plant = ProductPlant.fromJson(json['data']['plant']);
    tool = ProductTool.fromJson(json['data']['tool']);
  }

}

class ProductSeed {

  late final String seedId;
  late final String name;
  late final String description;
  late final String imageUrl;

  ProductSeed.fromJson(Map<String, dynamic> json){
    seedId = json['seedId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }


}

class ProductPlant {

  late final String plantId;
  late final String name;
  late final String description;
  late final String imageUrl;
  late final int waterCapacity;
  late final int sunLight;
  late final int temperature;

  ProductPlant.fromJson(Map<String, dynamic> json){
    plantId = json['plantId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    waterCapacity = json['waterCapacity'];
    sunLight = json['sunLight'];
    temperature = json['temperature'];
  }


}

class ProductTool {

  late final String toolId;
  late final String name;
  late final String description;
  late final String imageUrl;

  ProductTool.fromJson(Map<String, dynamic> json){
    toolId = json['toolId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }


}