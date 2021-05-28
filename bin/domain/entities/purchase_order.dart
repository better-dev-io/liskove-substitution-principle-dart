
class PurchaseOrder {
  // private variables for this class
  final String productName;
  final int quantity;
  final double price;
  final int userId;
  final int paymentType;

  // PurchaseOrder constructor used to pass the values
  PurchaseOrder(this.productName, this.quantity, this.price, this.userId,
      this.paymentType);

  // toJson helper method to print the values in json format
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['product_name'] = productName;
    data['quantity'] = quantity;
    data['price'] = price;
    data['userId'] = userId;
    data['payment_type'] = paymentType;
    return data;
  }
}
