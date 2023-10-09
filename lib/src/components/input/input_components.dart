import 'package:flutter/material.dart';
import 'package:simple_id/src/components/core/core_component_models.dart';

class MaterialInputComponent extends InputComponent {
  const MaterialInputComponent({super.key});

  @override
  Widget buildInput(BuildContext context) {
    return const TextField();
  }
}

abstract class InputComponent extends BaseStatelessComponent {
  const InputComponent({super.key});

  Widget buildInput(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return buildInput(context);
  }
}