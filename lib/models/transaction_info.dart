class TransactionModel{
  static final items = [
    TransactionList(
        date: 'Feb 12, 2022 04:51 PM', method: 'Gpay', rupees: '1000')
  ];
}

class TransactionList {
  final String date;
  final String method;
  final String rupees;

  TransactionList({required this.date, required this.method, required this.rupees});
}
