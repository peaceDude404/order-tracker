class Custom {
  String id;
  final String name;
  final String order;
  final String price;
  final String phone;
  final String token;
  Custom({this.id = '', required this.name, required this.order, required this.price, required this.token, required this.phone});
  Map<String , dynamic> toJson () => {
      'id': id,
      'name': name,
      'order': order,
      'token': token,
      'phone': phone,
      'price': price
    };


  static Custom fromJson(Map<String, dynamic> json) => Custom(
    name: json['name'], 
    order: json['order'],
    token: json['token'],
    price: json['price'],
    phone: json['phone']
  );
}