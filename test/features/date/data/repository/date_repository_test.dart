import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/features/date/data/repository/date_repository.dart';

void main() {
  late DateRepository dateRepository;

  setUp(() {
    dateRepository = DateRepository();
  });

  test("checks if geMonth() works as intended", () {
    final List<String> monthNames = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];

    expect(dateRepository.getMonth(),monthNames[DateTime.now().month - 1]);
  });
}
