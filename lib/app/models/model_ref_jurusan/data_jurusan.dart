import 'package:collection/collection.dart';

class DataJurusan {
  int? idJurusan;
  String? nmJurusan;
  DateTime? createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  DataJurusan({
    this.idJurusan,
    this.nmJurusan,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  @override
  String toString() {
    return 'DataJurusan(idJurusan: $idJurusan, nmJurusan: $nmJurusan, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  factory DataJurusan.fromJson(Map<String, dynamic> json) => DataJurusan(
        idJurusan: json['id_jurusan'] as int?,
        nmJurusan: json['nm_jurusan'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] as dynamic,
        deletedAt: json['deleted_at'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id_jurusan': idJurusan,
        'nm_jurusan': nmJurusan,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! DataJurusan) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      idJurusan.hashCode ^
      nmJurusan.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      deletedAt.hashCode;
}
