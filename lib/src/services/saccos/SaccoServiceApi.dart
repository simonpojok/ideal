import 'package:ideal/src/models/sacco.dart';

abstract class SaccoServiceApi {
  Future<String> registerSacco(Sacco sacco);
}
