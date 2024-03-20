import 'dart:convert';
import 'dart:io';

import 'package:learn_dart_together/240319/exam/employee.dart';
import 'package:test/test.dart';

void main() {
  test('employee test', () {
    final department = Department('총무부', Employee('홍길동', 41));

    String jsonString = jsonEncode(department.toJson());

    File('company.txt').writeAsStringSync(jsonString);


    jsonString = File('company.txt').readAsStringSync();
    final json = jsonDecode(jsonString) as Map<String, dynamic>;

    Department decodedDepartment = Department.fromJson(json);

    expect(decodedDepartment.name, '총무부');
    expect(decodedDepartment.leader.name, '홍길동');
    expect(decodedDepartment.leader.age, 41);
  });
}
