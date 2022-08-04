class ResponseMessage {
  final String message;
  final bool status;
  final dynamic data;
  final int statusCode;

  ResponseMessage(
      {required this.statusCode,
      required this.message,
      required this.status,
      this.data});
}
