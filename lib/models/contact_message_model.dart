/// Represents a contact message to be sent
class ContactMessage {
  final String name;
  final String subject;

  ContactMessage({
    required this.name,
    required this.subject,
  });

  bool isValid() {
    return name.isNotEmpty && subject.isNotEmpty;
  }
}
