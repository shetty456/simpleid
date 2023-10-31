import 'package:flutter/widgets.dart';

mixin BaseComponent on Widget {
}

abstract class BaseStatelessComponent extends StatelessWidget with BaseComponent {
  const BaseStatelessComponent({super.key});


}

abstract class BaseStatefulComponent extends StatefulWidget with BaseComponent {
  const BaseStatefulComponent({super.key});
}


class ComponentTheme {
  final String name;

  ComponentTheme({
    required this.name,
  });
}
