extension timex on DateTime {
  String toHumanString() {
    var d = DateTime.now().difference(this);

    if (d.inSeconds < 60) {
      return "${d.inSeconds}秒前";
    }
    if (d.inMinutes < 100) {
      return "${d.inMinutes}分钟前";
    }
    if (d.inHours < 48) {
      return "${d.inHours}小时前";
    }
    if (d.inDays < 90) {
      return "${d.inDays}天前";
    }
    if (d.inDays < 365) {
      return "${d.inDays ~/ 30}个月前";
    }
    return "${d.inDays ~/ 365}年前";
  }
}
