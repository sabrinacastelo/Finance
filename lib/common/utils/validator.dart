class Validator{
  Validator._();

    static String? validateName(String? value) {
      final condition = RegExp(r"\b([A-ZÀ-ÿ][-,a-z. ']+[ ]*)+");
    if (value != null && value.isEmpty) {
      return 'Por favor, preencha o campo com seu nome';
    }
    if(value != null && !condition.hasMatch(value)){
      return 'Nome inválido. Digite um nome válido';
    }
    return null;
  }

  static String? validateEmail(String? value) {
      final condition = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    if (value != null && value.isEmpty) {
      return 'Por favor, preencha o campo com seu email';
    }
    if(value != null && !condition.hasMatch(value)){
      return 'Email inválido. Digite um email válido';
    }
    return null;
  }

  static String? validatePassword(String? value) {
      final condition = RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$");
    if (value != null && value.isEmpty) {
      return 'Por favor, digite uma senha';
    }
    if(value != null && !condition.hasMatch(value)){
      return 'Senha inválida. Digite uma senha válida';
    }
    return null;
  }

  static String? validateConfirmPassword(String? first, String? second) {
    if (first != second) {
      return 'As senhas não coincidem, repita a mesma senha';
    }
    return null;
  }

}