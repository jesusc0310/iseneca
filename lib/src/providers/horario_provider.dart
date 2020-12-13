import 'package:http/http.dart' as http;
import 'package:iseneca/src/model/Horarios.dart';


class _HorarioProvider {
  final api =
      'https://iseneca.herokuapp.com/index.php/Horario/Horas';

  Future<Horarios> getHorarios() async {
    final resp = await http.get(api);
    final horarios = horariosFromJson(resp.body);
    return horarios;
  }
}

final horariosProvider = new _HorarioProvider();
