import 'package:learn_dart_together/240313/practice_1/tangible_asset.dart';

class Book extends TangibleAsset {
  String isbn;

  Book(
    super.weight, {
    required super.name,
    required super.price,
    required super.color,
    required super.warrantyExpiredYear,
    required super.warrantyExpiredMonth,
    required super.warrantyExpiredDay,
    required this.isbn,
  });
}
