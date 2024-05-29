class InputValidators {
  static String? emptyValidator(String? val) {
    if (val == null || val.isEmpty) {
      return 'Поле обязательно для заполнения';
    }
    return null;
  }

  static String? phoneValidator(String? val) {
    if (val!.isEmpty) {
      return 'Поле обязательно для заполнения';
    }
    if (val.length != 9) {
      return 'Введите корректный номер телефона';
    } else {
      return null;
    }
  }

  static String? innValidator(String? val) {
    var regexp = RegExp(r'^[0-9]*$');
    if (val!.isEmpty) {
      return 'Поле обязательно для заполнения';
    }
    if (val.length != 14 || (!val.startsWith('1') && !val.startsWith('2'))) {
      return 'Введите корректный ИНН';
    } else if (!regexp.hasMatch(val)) {
      return 'Введите корректный ИНН';
    } else {
      return null;
    }
  }

  static String? fioValidator(String? val) {
    if (val!.isEmpty) {
      return 'Поле обязательно для заполнения';
    }
    var regexp = RegExp(r'^[а-яА-Я\s]*$');
    if (!regexp.hasMatch(val)) {
      return "Введите корректное имя";
    }
    return null;
  }
}
