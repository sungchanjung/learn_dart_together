class Book implements Comparable<Book> {
  String title;
  DateTime publishDate;
  String comment;

  Book({
    required this.title,
    required this.comment,
    DateTime? publishDate,
  }) : publishDate = publishDate ??
            DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day);

  String getDatetoString(DateTime date) {
    return '${publishDate.year}-${publishDate.month}-${publishDate.day}';
  } //출간일을 문자열로 변환 'yy-mm-dd'

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book && // Book 형 인지 확인 name is var
          runtimeType == other.runtimeType && //
          title == other.title &&
          getDatetoString(publishDate) == getDatetoString(other.publishDate);

  @override
  String toString() {
    return '제목 : $title 코멘트 : $comment 출간일 $publishDate }';
  }

  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     other is Book && publishDate == other.publishDate && title == other.title;

  @override
  int get hashCode =>
      title.hashCode ^
      publishDate.year.hashCode ^
      publishDate.month.hashCode ^
      publishDate.day.hashCode; //^ 연산자는 두 비트가 서로 다를 때 = 1, 같을 때 = 0을 반환
  // 년 월 일 까지만 hashcode

  @override
  int compareTo(Book other) {
    return publishDate.compareTo(other.publishDate);
  } // 오래된 책들부터 비교하여 정렬해주는 코드

  Book copyWith({
    String? title,
    DateTime? publishDate,
    String? comment,
  }) {
    return Book(
      //book 클래스 타입 반환
      title: title ?? this.title, //타이틀이 널이 아니면 디스타이틀 타이틀이 없으면 그놈의 타이틀 넣을거다.
      comment: comment ?? this.comment,
      publishDate: publishDate ?? this.publishDate,
    );
  }
}

void main() {
  Book book1 = Book(
      title: '신승찬', comment: '코멘트', publishDate: DateTime.parse('2024-05-16'));
  Book book2 = Book(
      title: '신승찬2', comment: '코멘트', publishDate: DateTime.parse('2024-05-17'));
  Book book3 = Book(
      title: '신승찬', comment: '코멘트', publishDate: DateTime.parse('2024-05-16'));
  Book book4 = Book(
      title: '신승찬', comment: '코멘트', publishDate: DateTime.parse('2024-05-18'));
  Book book5;
  print(book1 == book2);
  print(book1 == book3);

  List<Book> bookList = []; //book형 리스트 생성 초기화
  bookList.add(book1);
  bookList.add(book2);
  bookList.add(book3);
  bookList.add(book4);
  bookList.sort(); //출간일 순서대로 정렬됨
  for (var book in bookList) {
    print(book.toString());
  }
  book5 = book1.copyWith();
  print(book5);
}
