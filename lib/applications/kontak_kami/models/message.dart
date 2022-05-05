class Message {
  Message({
    required this.messageId,
    required this.fullname,
    required this.phone,
    required this.email,
    required this.message,
    required this.createdAt,
    required this.updatedAt,
  });

  final int messageId;
  final String fullname;
  final String phone;
  final String email;
  final String message;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Message.fromMap(Map<String, dynamic> json) => Message(
        messageId: json["Message_id"],
        fullname: json["Fullname"],
        phone: json["Phone"],
        email: json["Email"],
        message: json["Message"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "Message_id": messageId,
        "Fullname": fullname,
        "Phone": phone,
        "Email": email,
        "Message": message,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
