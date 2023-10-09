import 'package:flutter/material.dart';
import 'package:simple_id/src/components/core/core_component_models.dart';
import 'package:simple_id/src/components/input/input_components.dart';

enum ComponentType {
  inputText,
  elevatedButton,
}

abstract class ComponentFactory {
  static final ComponentFactory _instance = ComponentFactoryImpl._();

  factory ComponentFactory() {
    return _instance;
  }

  void init(ComponentTheme theme);

  Widget getComponent(ComponentType type, ComponentTheme theme);
}

class ComponentFactoryImpl implements ComponentFactory {
  final Map<ComponentType, Widget> _components = {};
  final Map<ComponentType, ComponentFactory> _factories = {};

  ComponentFactoryImpl._() {
    _register();
  }

  _register() {
    _factories[ComponentType.inputText] = InputComponentFactory();
  }

  @override
  void init(ComponentTheme theme) {
    _components[ComponentType.inputText] = _factories[ComponentType.inputText]!
        .getComponent(ComponentType.inputText, theme);
  }

  @override
  Widget getComponent(ComponentType type, ComponentTheme theme) {
    switch (type) {
      case ComponentType.inputText:
        return const MaterialInputComponent();
      case ComponentType.elevatedButton:
        return ElevatedButton(
          onPressed: () {},
          child: const Text('Elevated Button'),
        );
      default:
        throw Exception('Component type not found');
    }
  }
}

class InputComponentFactory implements ComponentFactory {
  @override
  Widget getComponent(ComponentType type, ComponentTheme theme) {
    switch (type) {
      case ComponentType.inputText:
        return const MaterialInputComponent();
      default:
        throw Exception('Component type not found');
    }
  }

  @override
  void init(ComponentTheme theme) {}
}
