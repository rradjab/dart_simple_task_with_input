void main() {
  print("----" * 6 + "Task 2 - Simple Example");

  var mehsulSiyahisi = ["Kitab", "Dəftər"];
  double totalPrice = 94.5;
  double balance = 25697.8;
  bool isLogged = true;
  String payingMethod = "Kapital Bank";
  int payingPart = 3;
  int comission = 0;

  if (!mehsulSiyahisi.isEmpty) {
    if (isLogged) {
      if (payingMethod == "ünvana") {
        print("Ünvana göndəriş, məbləğ: $totalPrice Azn");
      } else if (balance >= totalPrice) {
        if (payingPart == 1) {
          print("$payingMethod ilə tam ödəmə, məbləğ: $totalPrice Azn");
        } else {
          switch (payingMethod.toLowerCase()) {
            case "kapital bank":
              comission = 10;
              break;
            case "xalq bank":
              comission = 30;
              break;
          }
          totalPrice = totalPrice + (totalPrice * comission) / 100;
          print(
              "$payingMethod ilə $payingPart ay ərzində, ilkin ödəniş: ${totalPrice / payingPart}");
        }
      } else {
        print("Balansda kifayət qədər məbləğ yoxdur");
      }
    } else {
      print("Sistemə daxil olun və yenidən ödənişi təkrarlaya bilərsiniz");
    }
  } else {
    print("Səbət boşdur");
  }

  /* 
    1 Səbətdə məhsul olmalıdır
    2 İstifadəçi login olub
    3 Bank seçimi (Xalq, Kapital)
    4 Kapital - 6 ay, 3 ay, nagd
    5 Xalq - 3 hisseye, nagd
    6 Kapital seçimində məhsulun qiymətinin üzərinə 10% faizi gəlməlidir. 
    7 Birinci ayın odenişi cixilir (Eger hesabda pul varsa)
    8 Xalq bankda 3 hisseye bolunen zaman ümumi məhsulun qiymətinin 30%-ini üzərinə gəlir
    9 Qapıda odeme + əlavə qiymət.
  */
}
