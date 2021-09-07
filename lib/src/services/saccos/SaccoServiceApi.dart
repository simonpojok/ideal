import 'package:ideal/src/models/sacco.dart';

abstract class SaccoServiceApi {
  Future<void> registerSacco(Sacco sacco);
}
