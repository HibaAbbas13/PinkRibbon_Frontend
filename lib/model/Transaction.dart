class Transaction {
  final String user;
  final int amount;
  final String username;
  final String useraccount;

  Transaction({
    required this.user,
    required this.amount,
    required this.username,
    required this.useraccount,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      user: json['user'],
      amount: json['amount'],
      username: json['username'],
      useraccount: json['useraccount'],
    );
  }
}