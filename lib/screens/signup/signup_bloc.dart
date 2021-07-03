import 'dart:async';

class SignUpBloc {
  StreamController<String> _nameController = StreamController.broadcast();
  Sink<String> get nameChanged => _nameController.sink;
  Stream<String> get name => _nameController.stream;

  StreamController<String> _emailController = StreamController.broadcast();
  Sink<String> get emailChanged => _emailController.sink;
  Stream<String> get email => _emailController.stream;

  StreamController<String> _phoneNumberController = StreamController.broadcast();
  Sink<String> get phoneNumberChanged => _phoneNumberController.sink;
  Stream<String> get phoneNumber => _phoneNumberController.stream;

  StreamController<String> _nationalityController = StreamController.broadcast();
  Sink<String> get nationalityChanged => _nationalityController.sink;
  Stream<String> get nationality => _nationalityController.stream;

  StreamController<String> _ninNumberController = StreamController.broadcast();
  Sink<String> get ninNumberChanged => _ninNumberController.sink;
  Stream<String> get ninNumber => _ninNumberController.stream;

  StreamController<String> _nextKinController = StreamController.broadcast();
  Sink<String> get nextKinChanged => _nextKinController.sink;
  Stream<String> get nextKin => _nextKinController.stream;

  StreamController<bool> _enableSignUpButtonController = StreamController.broadcast();
  Sink<bool> get enableSignUpButtonChanged => _enableSignUpButtonController.sink;
  Stream<bool> get enableSignUpButton => _enableSignUpButtonController.stream;


  void dispose() {
    _nameController.close();
    _emailController.close();
    _phoneNumberController.close();
    _nationalityController.close();
    _ninNumberController.close();
    _nextKinController.close();
    _enableSignUpButtonController.close();
  }
}