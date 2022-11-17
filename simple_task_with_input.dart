import 'dart:io';

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
void main() {
  print("Onlayn mağazaya xoş gəlmisiniz!");
  var productList = ["Klaviatura", "Mouse", "Veb Kamera", "Flash Kart"];
  var payingMethodList = ["Kapital Bank", "Xalq Bank", "Ünvana", "Şəxsən"];
  String noMoney = "Balansda kifayət qədər məbləğ yoxdur";
  String noSuchPayment = "Ödəmə növü mövcud deyil";
  String productName;
  String payingMethod;
  String userName;
  double? productPrice;
  double totalPrice;
  double balance;
  bool isLogged;
  int productCount;
  int payingPart = 0;
  int comission = 0;

  print("Nə almaq istədiyini seçin:");
  for (int i = 0; i < productList.length; i++) {
    print("${i + 1}) ${productList[i]}");
  }

  switch (stdin.readLineSync().toString()) {
    case "1":
      productName = productList[0];
      productPrice = 15.70;
      break;
    case "2":
      productName = productList[1];
      productPrice = 10.20;
      break;
    case "3":
      productName = productList[2];
      productPrice = 25.90;
      break;
    case "4":
      productName = productList[3];
      productPrice = 30;
      break;
    default:
      productName = "";
      print("Mal mövcud deyil");
      break;
  }

  if (productPrice != null) {
    print("Neçə ədəd?:");
    productCount = int.parse(stdin.readLineSync().toString());
    totalPrice = productPrice * productCount;
    print("Sistemə daxil olun:");
    userName = stdin.readLineSync().toString();
    isLogged = userName.trim().length >= 1;
    if (isLogged) {
      print("Ödəmə üsulunu seçin:");
      for (int i = 0; i < payingMethodList.length; i++) {
        print("${i + 1}) ${payingMethodList[i]}");
      }
      payingMethod =
          payingMethodList[int.parse(stdin.readLineSync().toString()) - 1]
              .toLowerCase();
      if (payingMethod == "ünvana") {
        print("*" * 50 + "\nHörmətli $userName!");
        print("$productCount ədəd $productName");
        print("Ümumi məbləğ: ${(totalPrice).toStringAsFixed(2)}");
        print("Göndəriş xidməinin məbləği: 5");
        print(
            "Ünvana göndəriş, məbləğ:  ${(totalPrice + 5).toStringAsFixed(2)} Azn");
      } else if (payingMethod == "şəxsən") {
        print("*" * 50 + "\nHörmətli $userName!");
        print("$productCount ədəd $productName");
        print(
            "Gəlib götürə bilərsiniz, məbləğ:  ${(totalPrice).toStringAsFixed(2)} Azn");
      } else {
        switch (payingMethod.toLowerCase()) {
          case "kapital bank":
            comission = 10;
            print("Ödəmə üsulu:");
            print("1) 6 ay\n2) 3 ay\n3) Nağd");
            switch (stdin.readLineSync().toString()) {
              case "1":
                payingPart = 6;
                break;
              case "2":
                payingPart = 3;
                break;
              case "3":
                payingPart = 1;
                break;
              default:
                print(noSuchPayment);
                break;
            }
            break;
          case "xalq bank":
            comission = 30;
            print("Ödəmə üsulu:");
            print("1) 3 hissəyə\n2) Nağd");
            switch (stdin.readLineSync().toString()) {
              case "1":
                payingPart = 3;
                break;
              case "2":
                payingPart = 1;
                break;
              default:
                print(noSuchPayment);
                break;
            }
            break;
        }
        if (payingPart > 0) {
          print("Balans:");
          balance = double.parse(stdin.readLineSync().toString());
          print("*" * 50 + "\nHörmətli $userName!");
          print("$productCount ədəd $productName");
          if (payingPart == 1) {
            if (balance >= totalPrice) {
              print("$payingMethod ilə tam ödəmə, məbləğ: $totalPrice Azn");
              print("Balans: ${(balance - totalPrice).toStringAsFixed(2)}");
            } else {
              print(noMoney);
            }
          } else {
            print("Ümumi məbləğ: ${(totalPrice).toStringAsFixed(2)}");
            totalPrice = totalPrice + (totalPrice * comission) / 100;
            print("Faizlə: ${(totalPrice).toStringAsFixed(2)}");
            if (balance >= totalPrice) {
              print("$payingMethod ilə $payingPart ay ərzində, ilkin ödəniş:" +
                  "${(totalPrice / payingPart).toStringAsFixed(2)}");
              print(
                  "Balans: ${(balance - totalPrice / payingPart).toStringAsFixed(2)}");
            } else {
              print(noMoney);
            }
          }
        }
      }
    } else {
      print("İstifadəçi sistemə daxil olmayib");
    }
  }
}
