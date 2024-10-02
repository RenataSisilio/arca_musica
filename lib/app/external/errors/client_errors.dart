import 'package:dio/dio.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import 'external_errors.dart';

final class ParseSdkClientError implements ClientError {
  ParseSdkClientError(this._parseError);

  final ParseError _parseError;

  @override
  // TODO: implement messages
  String get message => switch (_parseError.code) {
        ParseError.accountAlreadyLinked => '',
        ParseError.aggregateError => '',
        ParseError.cacheMiss => '',
        ParseError.commandUnavailable => '',
        ParseError.connectionFailed => '',
        ParseError.duplicateRequest => '',
        ParseError.duplicateValue => '',
        ParseError.emailMissing => '',
        ParseError.emailNotFound => '',
        ParseError.emailTaken => '',
        ParseError.exceededQuota => '',
        ParseError.fileDeleteError => '',
        ParseError.fileDeleteUnnamedError => '',
        ParseError.fileReadError => '',
        ParseError.fileSaveError => '',
        ParseError.fileTooLarge => '',
        ParseError.incorrectType => '',
        ParseError.internalServerError => '',
        ParseError.invalidAcl => '',
        ParseError.invalidChannelName => '',
        ParseError.invalidClassName => '',
        ParseError.invalidContentLength => '',
        ParseError.invalidEmailAddress =>
          'Por favor, insira um endereço de e-mail válido.',
        ParseError.invalidEventName => '',
        ParseError.invalidFileName => '',
        ParseError.invalidImageData => '',
        ParseError.invalidJson => '',
        ParseError.invalidKeyName => '',
        ParseError.invalidLinkedSession => '',
        ParseError.invalidNestedKey => '',
        ParseError.invalidPointer => '',
        ParseError.invalidPushTimeError => '',
        ParseError.invalidQuery => '',
        ParseError.invalidRoleName => '',
        ParseError.invalidSchemaOperation => '',
        ParseError.invalidSessionToken => '',
        ParseError.invalidValue => '',
        ParseError.mfaError => '',
        ParseError.mfaTokenRequired => '',
        ParseError.missingContentLength => '',
        ParseError.missingContentType => '',
        ParseError.missingObjectId => '',
        ParseError.mustCreateUserThroughSignup => '',
        ParseError.notInitialized => '',
        ParseError.objectNotFound => '',
        ParseError.objectTooLarge => '',
        ParseError.operationForbidden => '',
        ParseError.passwordMissing => '',
        ParseError.requestLimitExceeded => '',
        ParseError.scriptFailed => '',
        ParseError.sessionMissing => '',
        ParseError.timeout => '',
        ParseError.unsavedFileError => '',
        ParseError.unsupportedService => '',
        ParseError.usernameMissing => '',
        ParseError.usernameTaken =>
          'Já existe uma conta vinculada a este e-mail.',
        ParseError.validationError => '',
        ParseError.xDomainRequest => '',
        ParseError.otherCause ||
        _ =>
          'Erro do servidor não especificado.\nPor favor, tente novamente mais tarde.',
      };
}

final class InvalidSessionError implements ClientError {
  @override
  String get message => 'Sua sessão expirou. Por favor, faça login novamente.';
}

final class DioConnectionError implements ClientError {
  DioConnectionError(this.dioException);

  final DioException dioException;

  @override
  String get message => switch (dioException.type) {
        DioExceptionType.connectionTimeout =>
          'A conexão com o servidor está lenta.\nPor favor, verifique sua conexão e tente novamente.',
        DioExceptionType.sendTimeout =>
          'O envio de dados demorou mais que o esperado.\nPor favor, verifique sua conexão e tente novamente.',
        DioExceptionType.receiveTimeout =>
          'O recebimento de dados demorou mais que o esperado.\nPor favor, verifique sua conexão e tente novamente.',
        DioExceptionType.badCertificate =>
          'Certificado inválido.\nPor favor, entre em contato com o administrador do sistema.',
        DioExceptionType.badResponse =>
          'O servidor retornou uma resposta inválida.\nPor favor, entre em contato com o administrador do sistema.',
        DioExceptionType.cancel =>
          'A conexão com o servidor foi cancelada.\nPor favor, entre em contato com o administrador do sistema.',
        DioExceptionType.connectionError =>
          'Não foi possível conectar-se ao servidor.\nPor favor, verifique sua conexão e tente novamente.',
        DioExceptionType.unknown =>
          'Erro do Dio não especificado.\nPor favor, tente novamente mais tarde.',
      };
}

final class UnespecifiedClientError implements ClientError {
  UnespecifiedClientError(this.errorCause);

  final Object errorCause;

  @override
  String get message =>
      'Ocorreu um erro externo desconhecido:\n${errorCause.toString()}\nPor favor, entre em contato com o administrador do sistema.';
}

final class UserNotFoundClientError implements ClientError {
  UserNotFoundClientError(this.userNameOrEmail);

  final String userNameOrEmail;

  @override
  String get message =>
      'Não foi encontrado nenhum usuário correspondente a $userNameOrEmail';
}
