import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hakkımızda'),
        centerTitle: true,
        backgroundColor: Colors.green[200],
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            }),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'AKdesign nedir?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                'AKdesign, yaratıcı ve özgün t-shirt tasarımları sunan bir şirkettir. '
                'Amacımız, müşterilerimize kaliteli ve sürdürülebilir ürünler sağlayarak onların tarzını yansıtmaktır. '
                'Doğal ve geri dönüştürülebilir malzemeler kullanarak çevreye duyarlı üretim yapıyoruz. '
                'Müşteri memnuniyetini ön planda tutarak, sosyal sorumluluk projelerine katkı sağlıyoruz. '
                'Global bir marka olma hedefiyle, yenilikçi tasarımlarımızı dünyaya tanıtmayı amaçlıyoruz.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.start,
              ),
              Text(
                'Amaçlarımız neler ?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                'Bizim marka olarak amacımız, müşterilerimize en kaliteli ve özgün t-shirt tasarımlarını sunmaktır. '
                'Yaratıcılığın ve inovasyonun ön planda olduğu tasarımlarımızla, her bireyin kendi tarzını ifade etmesine olanak tanıyoruz. '
                'Hedeflerimiz arasında, sürdürülebilir moda anlayışını benimseyerek çevreye duyarlı ürünler üretmek de bulunmaktadır. '
                'Doğal ve geri dönüştürülebilir malzemeler kullanarak, modanın çevresel etkisini en aza indirmeyi amaçlıyoruz.\n\n'
                'Müşteri memnuniyeti bizim için en önemli önceliklerden biridir. Her müşterimizin ihtiyaçlarını ve beklentilerini en iyi şekilde anlamak için sürekli olarak geri bildirim topluyoruz. '
                'Bu geri bildirimler doğrultusunda ürünlerimizi ve hizmetlerimizi sürekli olarak geliştiriyoruz. '
                'Ayrıca, t-shirtlerimizin her biri titizlikle üretilmekte ve kalite kontrol süreçlerinden geçirilmektedir. '
                'Bu sayede, müşterilerimize her zaman en iyi kalitede ürünler sunmaktayız.\n\n'
                'Marka olarak, sosyal sorumluluk projelerine de büyük önem veriyoruz. Çeşitli sosyal sorumluluk projelerinde yer alarak, topluma katkı sağlamayı hedefliyoruz. '
                'Eğitim, sağlık ve çevre gibi alanlarda çeşitli projeler destekleyerek, daha iyi bir dünya için çalışıyoruz. '
                'Bu projeler sayesinde, markamızın sadece ticari bir işletme olmanın ötesine geçerek, topluma fayda sağlayan bir kuruluş olmasını amaçlıyoruz.\n\n'
                'Geleceğe yönelik en büyük hedeflerimizden biri, global bir marka haline gelmek ve dünya çapında tanınan bir moda ikonu olmaktır. '
                'Uluslararası pazarlara açılarak, farklı kültürlerdeki insanlara ulaşmak ve onların beğenisini kazanmak istiyoruz. '
                'Bu hedef doğrultusunda, uluslararası fuarlara katılarak ve global iş birlikleri yaparak markamızı tanıtmayı planlıyoruz. '
                'Ayrıca, dijital pazarlama stratejilerimizi güçlendirerek, online platformlarda da güçlü bir varlık göstermeyi amaçlıyoruz.\n\n'
                'Sonuç olarak, t-shirt markamızın temel hedefi, müşterilerimize en kaliteli ve özgün ürünleri sunarak, onların memnuniyetini sağlamaktır. '
                'Sürdürülebilirlik, müşteri memnuniyeti, sosyal sorumluluk ve globalleşme gibi alanlarda belirlediğimiz hedeflere ulaşmak için, sürekli olarak çalışmaya devam edeceğiz. '
                'Bu yolculukta bize eşlik eden tüm müşterilerimize ve iş ortaklarımıza teşekkür ederiz.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
