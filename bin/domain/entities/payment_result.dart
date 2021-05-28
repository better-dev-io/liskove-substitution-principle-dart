class PaymentResult {
  bool isActionable;
  String actionLink;

  // constructor used to pass the data
  PaymentResult(this.isActionable, this.actionLink);

  // helper function to get the data in json format
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['is_actionable'] = isActionable;
    data['action_link'] = actionLink;
    return data;
  }
}
