import 'package:movies_app/core/Network/ErrorMassegemodel.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException({required this.errorMessageModel});



}
