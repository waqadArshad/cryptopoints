
usernameValidator(String username) {
  if((username).trim() == ""){
    return "Username is required";
  }else{
    return null;
  }
}

emailValidator(String email) {
  const pattern =
      r"[a-z0-9!#$%&'+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'+/=?^_`{|}~-]+)@(?:[a-z0-9](?:[a-z0-9-][a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
  final regExp = RegExp(pattern);

  if ((email).trim() == "") {
    return 'Email is Required';
  } else if (!regExp.hasMatch((email))) {
    return 'Please enter a valid email address';
  } else {
    return null;
  }
}

passwordValidator(String password) {
  if ((password).trim().isEmpty) {
    return 'Password is Required';
  } else if ((password).trim().length < 6) {
    return 'Password must have at least 6 elements';
  }

  return null;
}