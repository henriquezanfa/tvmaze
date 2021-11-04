abstract class ClientException implements Exception {
  final String error;

  ClientException({this.error = "Ops! We had a problem with your request."});
}

class BadRequestException extends ClientException {
  BadRequestException({
    erro = "Ops! We were unable to complete your request.",
  }) : super(error: erro);
}

class UnauthorizedException extends ClientException {
  UnauthorizedException({
    erro = "Ops! You are not authorized to complete this request.",
  }) : super(error: erro);
}

class NotFoundException extends ClientException {
  NotFoundException({
    erro = "Ops! We couldn't find your request.",
  }) : super(error: erro);
}

class ServerException extends ClientException {
  ServerException({erro}) : super(error: erro);
}
