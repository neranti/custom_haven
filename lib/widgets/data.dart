// import 'package:custom_haven/';

enum ShoeType {
  shoe,
}

class ShoeCardData{
  final String id;
  final String name;
  final String designerName;
  final String price;
  final String image;

  const ShoeCardData({
    this.id,
    this.name,
    this.designerName,
    this.price,
    this.image,
  });
}