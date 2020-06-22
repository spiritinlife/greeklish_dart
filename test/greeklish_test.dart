import 'package:flutter_test/flutter_test.dart';
import 'package:greeklish/greeklish.dart';

void main() {
  test('tests', () {
    expect(Greeklish.generate("αυτοκινητο"), [
      "autokinhto",
      "aftokinhto",
      "avtokinhto",
      "aytokinhto",
      "autokinito",
      "aftokinito",
      "avtokinito",
      "aytokinito",
    ]);

    expect(
      Greeklish.generate("ομπρΈΛα"),
      [
        "omprela",
        "obrela",
      ],
    );

    expect(
      Greeklish.generate("ξεσκεπαστοσ"),
      [
        "kseskepastos",
        "xeskepastos",
      ],
    );

    expect(Greeklish.generate("ομορφος"), [
      "omorfos",
      "omorphos",
    ]);

    expect(Greeklish.generate("ομorφos"), [
      "omorfos",
      "omorphos",
    ]);

    expect(Greeklish.generate("hello"), [
      "hello",
    ]);

    expect(Greeklish.generate("εντεχνο"), [
      "entexno",
      "edexno",
      "entehno",
      "edehno",
      "entechno",
      "edechno",
    ]);
    expect(Greeklish.generate("έντεχνο"), [
      "entexno",
      "edexno",
      "entehno",
      "edehno",
      "entechno",
      "edechno",
    ]);
    expect(Greeklish.generate("eε"), ["ee"]);
    expect(Greeklish.generate("ee"), ["ee"]);
    expect(Greeklish.generate("ντ"), ['nt', 'd']);
    expect(Greeklish.generate("τζαζ"), ['tzaz']);
  });
}
