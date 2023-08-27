class HtmlUtils {
  static removeTags(String content) {
    return content.replaceAll(RegExp(r'(<\w*>|<\/\w*>)'), '');
  }
}
