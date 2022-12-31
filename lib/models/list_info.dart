class ListItemModel {
  static final list = [
    ListItem(
        date: 'Feb 12, 2022 04:51 PM', cabId: '2345BTCE', text: 'completed')
  ];
}

class ListItem {
  final String date;
  final String cabId;
  final String text;

  ListItem({required this.date, required this.cabId, required this.text});
}
