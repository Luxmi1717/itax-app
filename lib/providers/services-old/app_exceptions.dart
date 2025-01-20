class AppException implements Exception
{
  final _message;
  final _prefix;
  AppException([this._message,this._prefix]);

  @override
  String toString(){
    return '$_prefix$_message';
  }

}

class FatchDataException extends AppException{
  FatchDataException([String? message]):super(message,'error During communition');
}

class BadRequestException extends AppException{
  BadRequestException([String? message]):super(message,'Invalid request');
}
class UnathorisedException extends AppException{
  UnathorisedException([String? message]):super(message,'Unauthorised request');
}
class  Invalidinput extends AppException{
  Invalidinput([String? message]):super(message,'Invalid input');
}
