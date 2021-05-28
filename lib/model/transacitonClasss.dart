class Transaction {
  static int _count = 0;
  final String title;
  final int amount;
  final DateTime date;
  final String from;
  final String to;
  final String methord;

  Transaction({
    this.from,
    this.to,
    this.methord,
    this.title,
    this.amount,
    this.date,
  }) {
    Transaction._count += 1;
  }

  static int getcount() => _count;
}

class ModelTransactions {
  static List<Transaction> transactions = [];
  static final List<String> methords = [
    'UPI',
    'Credit Card',
    'NetBanking',
    'Wallet',
    'Cash',
  ];
  static String pickedMethord = methords[0];

  static addTransaction(
      String title, DateTime date, int amount, String from, String to) {
    ModelTransactions.transactions.add(Transaction(
      amount: amount,
      date: date,
      title: title,
      from: from,
      to: to,
      methord: ModelTransactions.pickedMethord,
    ));

    ModelTransactions.transactions.sort((b, a) => a.date.compareTo(b.date));

    addAtM(date.month - 1, amount);
  }

  static deleteTransaction(Transaction tx) {
    ModelTransactions.transactions.remove(tx);
    ModelTransactions.history[tx.date.month - 1] -= tx.amount;
    ModelTransactions.maxMonth = 1;
    ModelTransactions.history.forEach((element) {
      if (element > ModelTransactions.maxMonth) {
        ModelTransactions.maxMonth = element;
      }
    });
  }

  static const List<String> months = [
    'January',
    'Febuary',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  static int maxMonth = 0;

  static addAtM(int index, int val) {
    ModelTransactions.history[index] += val;
    if (maxMonth < ModelTransactions.history[index]) {
      maxMonth = ModelTransactions.history[index];
    }
  }

  static List<int> history = List.generate(12, (index) => 0);
}
