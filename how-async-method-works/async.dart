import 'dart:async';

void main(List<String> args) {

print("Program başlatıldı Main method başlatıldı");
dosyaIceriginiGoster();
print("Main methoda geri dönüldü bitti!!!");

}

/* Aynı sonucu verir 
dosyaIceriginiGoster() {  
print("Dosya içeriği gösterilecek");

Future <String> dosyaIcerigi =  dosyaIndir(); 
dosyaIcerigi.then((sonuc) => print("$sonuc")); //callback function sayesinde işlem bittiğinde bu satır çalıştırılır

//print("DOSYA İÇERİĞİ >>>  $dosyaIcerigi");
}
*/

dosyaIceriginiGoster() async{  // await keywordu ancak async olan methodlarda kullanılabilir

print("Dosya içeriği gösterilecek");
String dosyaIcerigi = await dosyaIndir(); // Bu işlem ana senkronun dışına çıkarak işlem tamamlanasıya kadar ana senkron dışında çalıştırılır.
print("DOSYA İÇERİĞİ >>>  $dosyaIcerigi");

}

Future<String> dosyaIndir(){
print("Dosya indirme işlemi başlatıldı...");

Future<String> sonuc = Future.delayed(Duration(seconds: 10),(){
return "*******İndirilen dosya içeriği******";
});

print("Dosya indir methodu tamamlandı...!");
return sonuc;
}

/* OUTPUT 

Program başlatıldı Main method başlatıldı
Dosya içeriği gösterilecek
Dosya indirme işlemi başlatıldı...
Dosya indir methodu tamamlandı...!
Main methoda geri dönüldü bitti!!!
*******İndirilen dosya içeriği****** /// 5 saniye bekledikten sonra bu satır yazdırılıyor.

*/
