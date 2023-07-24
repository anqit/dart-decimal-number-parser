import 'package:dart_decimal_number_parser/dart_decimal_number_parser.dart';
import 'package:decimal/decimal.dart';
import 'package:intl/intl.dart';
import 'package:test/test.dart';

void main() {
  Decimal? parse(NumberFormat format, String text) => DartDecimalNumberParser(format, text).value;

  Decimal rationalPi = Decimal.parse("3.14");
  NumberFormat plainFormatter = NumberFormat();
  NumberFormat currencyFormatter = NumberFormat.simpleCurrency(name: "USD");

  group('Parses plain decimals', () {

    test('Can parse plain decimal', () {
      expect(parse(plainFormatter, "3.14"), equals(rationalPi));
      expect(parse(plainFormatter, "03.14"), equals(rationalPi));
      expect(parse(plainFormatter, "-3.14"), equals(-rationalPi));
    });
  });

  group('Parses currency decimals', () {
    test('Can parse currencies decimal', () {
      expect(parse(currencyFormatter, "\$3.14"), equals(rationalPi));
      expect(parse(currencyFormatter, "\$03.14"), equals(rationalPi));
      expect(parse(currencyFormatter, "-\$3.14"), equals(-rationalPi));
    });
  });
}
