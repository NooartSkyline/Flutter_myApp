class ICheckNull {
  void CheckIsnull() {
    String a;
    print(a ?? "Hi a");
    print(a);
    print(a ??= "Hi a2");
    print(a);

    EName eName;
    eName?.emp(); //ถ้าเป็น Null มันจะข้าม
  }
}

class EName {
  void emp() {
    print("art");
  }
}
