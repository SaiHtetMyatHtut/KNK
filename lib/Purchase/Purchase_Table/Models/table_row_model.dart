class RecordRow {
  final int no;
  final String category;
  final DateTime date;
  final String name;
  final String net;
  final String vendor;
  final int quentity;
  final int unitPrice;
  final int totalPrice;
  final String edit = 'Edit';
  final String delete = 'Delete';

  RecordRow({
    required this.no,
    required this.category,
    required this.date,
    required this.name,
    required this.net,
    required this.vendor,
    required this.quentity,
    required this.unitPrice,
    required this.totalPrice,
  });
  RecordRow copy({
    int? no,
    String? category,
    DateTime? date,
    String? name,
    String? net,
    String? vendor,
    int? quentity,
    int? unitPrice,
    int? totalPrice,
    String? edit,
    String? delete,
  }) =>
      RecordRow(
        no: no ?? this.no,
        category: category ?? this.category,
        date: date ?? this.date,
        name: name ?? this.name,
        net: net ?? this.net,
        vendor: vendor ?? this.vendor,
        quentity: quentity ?? this.quentity,
        unitPrice: unitPrice ?? this.unitPrice,
        totalPrice: totalPrice ?? this.totalPrice,
      );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecordRow &&
          runtimeType == other.runtimeType &&
          no == other.no &&
          category == other.category &&
          date == other.date &&
          name == other.name &&
          net == other.net &&
          vendor == other.vendor &&
          quentity == other.quentity &&
          unitPrice == other.unitPrice &&
          totalPrice == other.totalPrice;

  @override
  int get hashCode =>
      no.hashCode ^
      category.hashCode ^
      date.hashCode ^
      name.hashCode ^
      net.hashCode ^
      vendor.hashCode ^
      quentity.hashCode ^
      unitPrice.hashCode ^
      totalPrice.hashCode;
}
