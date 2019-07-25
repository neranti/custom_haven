import 'package:custom_haven/widgets/data.dart';

List<ShoeCardData> getCustomCards(){
  return [
    ShoeCardData(
      id: '0',
      name: 'Red Bape Vans',
      designerName: 'Designer Name',
      price: '\$120',
      image: 'assets/redbapevans',
    ),

    ShoeCardData(
      id: '1',
      name: 'Red Bape Vans',
      designerName: 'Designer Name',
      price: '\$120',
      image: 'assets/redbapevans',
    )
  ];
}

List<String> getCartIDs() {
  return [
    '0',
    '1',
    //'2',
  ];
}