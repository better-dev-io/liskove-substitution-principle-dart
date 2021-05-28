import 'app/services/payment_service.dart';
import 'domain/entities/purchase_order.dart';

Future<void> main(List<String> arguments) async {
  var purchaseOrderMock = PurchaseOrder('Mango 1KG', 1, 1.2, 1241, 1);

  var attemptPaymentResult =
      await PaymentService().attemptProcessingPayment(purchaseOrderMock);

  attemptPaymentResult.fold(
      (paymentFailure) => print(paymentFailure.toJson()),
      (paymentResult) => print(paymentResult.toJson()));
}
