import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Поиск в списке возвращает корректные результаты', () {
    final List<String> newsTitles = [
      "Flutter для начинающих",
      "Новости технологий",
      "Разработка мобильных приложений",
      "Flutter и Dart: лучшие практики"
    ];

    String searchQuery = "Flutter";
    List<String> searchResults = newsTitles.where((title) => title.toLowerCase().contains(searchQuery.toLowerCase())).toList();

    expect(searchResults, ["Flutter для начинающих", "Flutter и Dart: лучшие практики"]);
  });
}
