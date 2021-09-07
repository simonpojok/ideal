import 'package:ideal/src/models/sacco.dart';
import 'package:ideal/src/services/saccos/SaccoServiceApi.dart';

class SaccoRegistrationBloc {
  final SaccoServiceApi saccoServiceApi;

  SaccoRegistrationBloc(this.saccoServiceApi);

  Future<void> register(Sacco sacco) {
    return saccoServiceApi.registerSacco(sacco);
  }
}
