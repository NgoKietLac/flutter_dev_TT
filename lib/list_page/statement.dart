class Statement {
  final int id;
  final String tiltle;
  final String description;
  final String money;
  final String date;

  Statement({
    required this.id,
    required this.tiltle,
    required this.description,
    required this.money,
    required this.date,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tiltle': tiltle,
      'description': description,
      'money': money,
      'date': date,
    };
  }

  // Chuyển từ Map sang Object (để hiển thị lên màn hình)
  factory Statement.fromMap(Map<String, dynamic> map) {
    return Statement(
      id: map['id'],
      tiltle: map['tiltle'],
      description: map['description'],
      money: map['money'],
      date: map['date'],
    );
  }
}
