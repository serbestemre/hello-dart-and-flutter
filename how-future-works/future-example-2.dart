import 'dart:async';
import 'dart:math';

void main() {

print("MAIN BAŞLANGICI!!");

  new Future(() { // Future içinde çalıştırılan komutlar sonuçları belli olunca ileri bir zamanda döndürülür. 
  //Bu komutlar hesaplanırken sıradaki komutlar çalışmaya devam eder
    print("Future Başladı");
    int power= pow(1567,90);
    return power;
  }).then(print);

print("Program bitti");
}


// OUTPUT
/* 

MAIN BAŞLANGICI!!
Program bitti
Future Başladı
3594338525041126593
Exited

*/