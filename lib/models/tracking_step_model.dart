/// Represents a single step in the order tracking timeline
class TrackingStep {
  final String id;
  final String title;
  final String date;
  final String time;
  final bool isCompleted;
  final bool isActive;
  final String? iconUrl;

  TrackingStep({
    required this.id,
    required this.title,
    required this.date,
    required this.time,
    required this.isCompleted,
    this.isActive = false,
    this.iconUrl,
  });
}
