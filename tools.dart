bool isStringNOTEmpty(String s){
  try {
    if (s != null){
      if (s
          .toString()
          .length > 0) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  } catch (e) {
    print(e.toString());
    return false;
  }
}
