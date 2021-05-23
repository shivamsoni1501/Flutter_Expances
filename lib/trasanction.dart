class Transaction {
  static int _count = 0;
  final String title;
  final double amount;
  final DateTime date;

  Transaction({this.title, this.amount, this.date}) {
    Transaction._count += 1;
  }

  static int getcount() => _count;
}
