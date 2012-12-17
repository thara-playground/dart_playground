
abstract class Service {
  factory Service() => new ServiceImpl();
}

class ServiceImpl implements Service {
}

abstract class View {
  View._();
  factory View() => new ViewImpl();
}

class ViewImpl extends View {
  ViewImpl() : super._();
}

class N {
  const N();
}

class C {
  final x; final y; final z;
  const C(p, q): x = q, y = p + 100, z = p + q;
}

class D {
  final w;
  const D.makeList(): w = const [10];
  factory D() => new D.makeList();
}

void main() {
  var s = new Service();
  var v = new View();
  
  var d = new D();
}