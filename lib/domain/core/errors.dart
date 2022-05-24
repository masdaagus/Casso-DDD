// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:casso/domain/core/failures.dart';

class UnExpetedValueError extends Error {
  final ValueFailure valueFailure;
  UnExpetedValueError(this.valueFailure);

  @override
  String toString() =>
      Error.safeToString('UnExpetedValueError(valueFailure: $valueFailure)');
}
