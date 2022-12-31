class NotificationModel {
  static final items = [
    NotificationList(date: 'Feb 12, 2022', text: 'Book a ride and get offers')
  ];
}

class NotificationList {
  final String text;
  final String date;

  NotificationList({required this.date, required this.text});
}
