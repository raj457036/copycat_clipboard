import 'package:form_validator/form_validator.dart';

extension CustomValidationBuilder on ValidationBuilder {
  integer([int? min, int? max]) => add((value) {
        if (value == null) return null;
        final number = int.tryParse(value);
        if (number == null) {
          return 'Enter a valid number.';
        }
        if (min != null && number < min) {
          return 'Enter a number greater than $min.';
        }
        if (max != null && number > max) {
          return 'Enter a number less than $max.';
        }
        return null;
      });
}
