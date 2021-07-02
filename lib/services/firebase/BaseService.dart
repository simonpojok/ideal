import 'package:firebase_auth/firebase_auth.dart';

class BaseService {
  static BaseService? _baseService;
  static FirebaseAuth? _auth;
  BaseService._internal();

  BaseService(){
    if (_baseService == null) {
      _baseService = BaseService._internal();
      _auth  = FirebaseAuth.instance;
    }
    _baseService!;
  }

  FirebaseAuth get authentication => _auth!;
}