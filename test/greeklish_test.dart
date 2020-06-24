import 'package:greeklish/greeklish.dart';
import 'package:test/test.dart';

void main() {
  test('tests', () {
    expect(GreeklishGenerator.generate("αυτοκινητο"), [
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
      GreeklishGenerator.generate("ομπρΈΛα"),
      [
        "omprela",
        "obrela",
      ],
    );

    expect(
      GreeklishGenerator.generate("ξεσκεπαστοσ"),
      [
        "kseskepastos",
        "xeskepastos",
      ],
    );

    expect(GreeklishGenerator.generate("ομορφος"), [
      "omorfos",
      "omorphos",
    ]);

    expect(GreeklishGenerator.generate("ομorφos"), [
      "omorfos",
      "omorphos",
    ]);

    expect(GreeklishGenerator.generate("hello"), [
      "hello",
    ]);

    expect(GreeklishGenerator.generate("εντεχνο"), [
      "entexno",
      "edexno",
      "entehno",
      "edehno",
      "entechno",
      "edechno",
    ]);

    expect(GreeklishGenerator.generate("έντεχνο"), [
      "entexno",
      "edexno",
      "entehno",
      "edehno",
      "entechno",
      "edechno",
    ]);

    expect(GreeklishGenerator.generate("eε"), ["ee"]);

    expect(GreeklishGenerator.generate("ee"), ["ee"]);

    expect(GreeklishGenerator.generate("ντ"), ['nt', 'd']);

    expect(GreeklishGenerator.generate("τζαζ"), ['tzaz']);
  });
}
