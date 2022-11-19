import 'package:dotenv/src/service/dot_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  final result = await DotService().readEnv();
  test('Deve retornar um map', () async {
    expect(result, isA<Map>());
  });

  test('Não pode estar vazia', () async {
    expect(result, isNotEmpty);
  });
}
