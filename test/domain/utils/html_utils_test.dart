import 'package:bookclub/domain/utils/html_utils.dart';
import 'package:test/test.dart';

void main() {
  group('HTMLUtils test', () {
    test('Remove html tags from string', () {
      String htmlContent = '<html><title>Test</title><body><h1> aaaa<h1><strong> bbbb</string><body></html>';

      String textContent = HtmlUtils.removeTags(htmlContent);
      expect(textContent, 'Test aaaa bbbb');
    });
  });
}
