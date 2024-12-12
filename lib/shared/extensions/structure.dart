import 'package:flutter/material.dart';
import 'package:structures_api/structures_api.dart';

extension StructureX on Structure {
  Color get color => Color.fromARGB(
        255,
        colorRed,
        colorGreen,
        colorBlue,
      );
}
