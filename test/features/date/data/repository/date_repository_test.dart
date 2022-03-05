import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/features/date/data/repository/date_repository.dart';

void main() {
  late DateRepository dateRepository;

  setUp(() {
    dateRepository = DateRepository();
  });

  test("checks if geMonth() works as intended", () {
    expect(dateRepository.getMonth(), "March");         // TODO: change month while running test
  });
}
