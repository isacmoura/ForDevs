
import 'package:fordev/domain/entities/entities.dart';

abstract class Authentication {
  Future<AccountEntity> auth({
    String email,
    String password
    });
}