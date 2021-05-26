class Transaction {
  static int _count = 0;
  final String title;
  final int amount;
  final DateTime date;
  final String lable;

  Transaction({this.title, this.amount, this.date, this.lable}) {
    Transaction._count += 1;
  }

  static int getcount() => _count;
}

class ModelTransactions {
  static List<Transaction> transactions = [
    Transaction(
        amount: 10000000000,
        date: DateTime.now(),
        lable: 'UPI_SHIVAM',
        title: 'Pen'),
    Transaction(
        amount: 10, date: DateTime.now(), lable: 'UPI_SHIVAM', title: 'Pen'),
    Transaction(
        amount: 10, date: DateTime.now(), lable: 'UPI_SHIVAM', title: 'Pen'),
  ];
}
