import 'dart:io';

class DotService {
  final Map<String, String> data = {};

  String removeComment(String value) {
    return value.replaceAll(RegExp(r'\#.*'), '');
  }

  Future<Map> readEnv() async {
    try {
      final file = File('lib/src/data/.env');

      final str = await file.readAsString();
      final lines = str.split('\n');
      lines.removeAt(0);
      lines.removeRange(4, 6);

      for (var line in lines) {
        line = removeComment(line);
        final column = line.split(RegExp(r'='));

        if (column.length > 2) {
          column[1] = column[1] + '=' + column[2];
          column.removeAt(2);
        }
        data[column[0]] = column[1];
      }
      print(data);
    } on FileSystemException catch (e) {
      if (e.message == 'Cannot open file') {
        print('Arquivo não Encontrado no diretorio');
      }
    }
    return data;
  }
}
