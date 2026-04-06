class Expense {
  int? id;
  String noiDung;
  double soTien;
  String ghiChu;

  Expense({
    this.id,
    required this.noiDung,
    required this.soTien,
    required this.ghiChu,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'noiDung': noiDung,
      'soTien': soTien,
      'ghiChu': ghiChu,
    };
  }

  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'],
      noiDung: map['noiDung'],
      soTien: map['soTien'],
      ghiChu: map['ghiChu'],
    );
  }
}