abstract class Current {
  double value;
  double toBaht;
  Current(this.value, this.toBaht);
}

class Baht extends Current {
  Baht(double value) : super(value, 1);
}

class USD extends Current {
  USD(double value) : super(value, 1 / 0.028);
}

class WON extends Current {
  WON(double value) : super(value, 1 / 33.72);
}

class CurrentConverter {
  Baht convertToBaht<T extends Current>(T current) {
    return Baht(current.value * current.toBaht);
  }

  WON convertToWON<T extends Current>(T current) {
    return WON(current.value * current.toBaht * 33.72);
  }

  USD convertToUSD<T extends Current>(T current) {
    return USD(current.value * current.toBaht * 0.028);
  }
}

void main() {
  final baht = Baht(100000);
  final convert = CurrentConverter();
  final won = convert.convertToWON(baht);
  print(won.value);
}