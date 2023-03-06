class CartItem {
  int prodctId, quantity, variationId;
  List<int> addonIds;
  double total;

  CartItem({
    required this.prodctId,
    required this.quantity,
    required this.variationId,
    required this.addonIds,
    required this.total,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      prodctId: json['product_id'],
      quantity: json['quantity'],
      variationId: json['variation_id'],
      addonIds: json['addon_ids'] != null
          ? List<int>.from(json['addon_ids'].map((x) => x))
          : [],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': prodctId,
      'quantity': quantity,
      'variation_id': variationId,
      'addon_ids': addonIds,
      'total': total,
    };
  }
}
