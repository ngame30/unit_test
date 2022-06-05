abstract class AdderInterface {
  int get number;
}

class Adder implements AdderInterface {
  @override
  int get number => 1;
}
