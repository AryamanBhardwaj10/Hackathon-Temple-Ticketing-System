class Ticket {
  final String id;
  final String emailId;
  final String date;
  final List<String> memberNames;
  final String qrCode;

  const Ticket({
    required this.id,
    required this.emailId,
    required this.date,
    required this.memberNames,
    required this.qrCode,
  });
  Map<String, dynamic> toMap() => {
        'id': id,
        'userId': emailId,
        'date': date,
        'memberNames': memberNames,
        'qrCode': qrCode,
      };

  factory Ticket.fromMap(Map<String, dynamic> map) => Ticket(
        id: map['_id'] as String,
        emailId: map['emailId'] as String,
        date: map['date'] as String,
        memberNames: (map['memberNames'] as List<dynamic>).cast<String>(),
        qrCode: map['qrCode'] as String,
      );
}
