import 'package:collection/collection.dart';

import 'data.dart';

class ModelRefJurusan {
  bool? status;
  String? message;
  dynamic errors;
  Data? data;

  ModelRefJurusan({this.status, this.message, this.errors, this.data});

  @override
  String toString() {
    return 'ModelRefJurusan(status: $status, message: $message, errors: $errors, data: $data)';
  }

  factory ModelRefJurusan.fromJson(Map<String, dynamic> json) {
    return ModelRefJurusan(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      errors: json['errors'] as dynamic,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'errors': errors,
        'data': data?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ModelRefJurusan) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      status.hashCode ^ message.hashCode ^ errors.hashCode ^ data.hashCode;
}
