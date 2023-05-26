class ItemModel {
  final String name;
  final int quantity;
  final bool hasBought;

  ItemModel(
      {required this.name, required this.quantity, required this.hasBought});

//반복 작업을 피하기 위한 copywith 만들기
  ItemModel copyWith({
    String? name,
    int? quantity,
    bool? hasBought,
  }) {
    return ItemModel(
        name: name ?? this.name,
        quantity: quantity ?? this.quantity,
        hasBought: hasBought ?? this.hasBought);
  }
}
