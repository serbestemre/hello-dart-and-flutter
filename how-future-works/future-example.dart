import 'dart:math';

main(List<String> args) {
  
int sayi = Random().nextInt(2); // 0 veya 1 sayısı üretilir
print("Üretilen sayı: $sayi"); 

var sonuc = sayi % 2 == 0 ? true : false; // eğer sayı çift ise true tek ise false değeri döndür ve sonuc değişkenine ata
print("Çift mi?: $sonuc");

var future = new Future.delayed(new Duration(seconds: 1),() { // İŞLEM SÜRESİ 1 saniye olarak tanımlandı

if(sonuc){
  return "**İşlem Başarılı**"; //sayı çift ise işlem başarılı
}else{
  throw 'İŞLEM HATALI..!!'; //sayı tek ise hata döndür!
}

}).timeout(Duration (seconds: 2));// Eğer işlem 2 saniyeden uzun sürerse timeout hatası döndürür.!!!


/*
future.then((value){
  print("Tamamlanan değer $value");

  //return Future.error("BOOM! CALLBACK İÇİNDE HATA OLUŞTU!"); // BU Hata onError tarafından yakalanmaz.

},onError: (error){ // Sadece ilgili future daki oluşan hatayı yakalar (callback üzerinde bir hata çıkarsa yakalanmaz)
  print("Tamamlanan hata =>> $error");
});
*/



// catchError tüm hataları yakalayabiliyor
future.then((value){
  print("Tamamlanan değer $value");
  return Future.error("BOOM! CALLBACK İÇİNDE HATA OLUŞTU!");
}).catchError((error){

print("Benden HATA KAÇMAZ! $error");

}).whenComplete((){

print("::İŞLEM SÜRECİ ÖYLE YA DA BÖYLE BİTTİ::"); // İşlem başarılı olsa da olmasa da bu blok içindeki kodlar çalıştırılır!

});


//----------SAYI ÇİFT İSE OUTPUT-----------

/* 

Üretilen sayı: 0
Çift mi?: true
Tamamlanan değer **İşlem Başarılı**
Benden HATA KAÇMAZ! BOOM! CALLBACK İÇİNDE HATA OLUŞTU!
::İŞLEM SÜRECİ ÖYLE YA DA BÖYLE BİTTİ:: 
Exited
*/


//----------SAYI TEK İSE OUTPUT-----------

/*

Üretilen sayı: 1
Çift mi?: false
Benden HATA KAÇMAZ! İŞLEM HATALI..!!
::İŞLEM SÜRECİ ÖYLE YA DA BÖYLE BİTTİ::
Exited

 */

}
