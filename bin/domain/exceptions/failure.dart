import 'package:intl/intl.dart';

class Failure {

  String failureMessage;
  List<String> failureDetails;
  String failureDateTime =
      DateFormat('y/MMMM/d hh:mm:ss').format(DateTime.now());

  // constructor with failure message only
  Failure(this.failureMessage);
  // constructor with failure message only and details
  Failure.withDetails(this.failureMessage, this.failureDetails);

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['failure_message'] = failureMessage;
    data['timestamp'] = failureDateTime;
    // ensures the list in not null nor empty
    if (failureDetails != null && failureDetails.isNotEmpty) {
      data['failure_details'] = failureDetails;
    }
    return data;
  }
}
