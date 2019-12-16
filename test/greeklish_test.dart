import 'package:flutter_test/flutter_test.dart';

import 'package:greeklish/greeklish.dart';

void main() {
  test('adds one to input values', () {
    expect(Greeklish.generate("εντεχνο"), ["entexno", "edexno", "entehno", "edehno", "entechno", "edechno"]);
    expect(Greeklish.generate("έντεχνο"), ["entexno", "edexno", "entehno", "edehno", "entechno", "edechno"]);
    expect(Greeklish.generate("eε"), ["ee"]);
    expect(Greeklish.generate("ντ"), ['nt', 'd']);
    expect(Greeklish.generate("τζαζ"), ['tzaz']);
  });
}
