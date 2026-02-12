/// Represents a notification in the app
class NotificationModel {
  final String id;
  final String title;
  final String message;
  final String time;
  final NotificationType type;
  bool isRead;
  final bool hasDelete;
  final bool hasMarkAsRead;

  NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    required this.time,
    this.type = NotificationType.general,
    this.isRead = false,
    this.hasDelete = false,
    this.hasMarkAsRead = false,
  });
}

enum NotificationType {
  order,
  delivery,
  promotion,
  system,
  general,
}
