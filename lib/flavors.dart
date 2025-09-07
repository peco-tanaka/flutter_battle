enum Flavor {
  develop,
  production,
}

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.develop:
        return 'Flutter Settings Dev';
      case Flavor.production:
        return 'Flutter Settings';
    }
  }

}
