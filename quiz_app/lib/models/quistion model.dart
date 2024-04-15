class Quistion {
  final String id;
  final String title;
  final Map<String, bool> options;
  Quistion({required this.id, required this.options, required this.title});
  @override
  String toString() {
    return 'Quistion(id:$id,title:$title,options:$options)';
  }
}
