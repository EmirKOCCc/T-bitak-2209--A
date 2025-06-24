import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HakkimizdaPage extends StatelessWidget {
  const HakkimizdaPage({super.key});

  static const LatLng bartinKutlubey = LatLng(41.634044, 32.339611);

  bool get isMobile =>
      defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Logo ve başlık kartı
            Container(
              padding: const EdgeInsets.all(16),
              decoration: _cardDecoration(),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('assets/logo.png'),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Bilgisayar Öğreniyoruz',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text('Eğitim Platformu', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            _sectionTitle('Vizyonumuz'),
            _sectionText(
              'Teknoloji okuryazarlığını küçük yaşlarda kazandırarak çocuklara dijital dünyada özgüvenli bireyler yetiştirmek.',
            ),
            const SizedBox(height: 12),
            _sectionTitle('Misyonumuz'),
            _sectionText(
              '8-12 yaş arası çocuklara temel bilgisayar becerilerini eğlenceli ve öğretici yollarla sunmak.',
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _InfoCard(title: 'Öğrenci', value: '500+'),
                _InfoCard(title: 'Deneyim', value: '5 Yıl'),
                _InfoCard(title: 'Puan', value: '4.8'),
              ],
            ),

            const SizedBox(height: 20),

            _sectionTitle('Hakkımızda'),
            _sectionText(
              'Bilgisayar Öğreniyoruz, çocukların erken yaşta bilgisayarla tanışmasını sağlar. '
              'Uzman eğitmen kadromuz ile eğlenceli ve güvenli içerikler sunuyoruz.',
            ),

            const SizedBox(height: 20),

            _sectionTitle('Lokasyon'),
            isMobile ? _buildGoogleMap() : _buildMapPlaceholder(),

            const SizedBox(height: 24),

            _sectionTitle('Bizi Takip Edin'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _socialIcon('assets/icons/facebook.png'),
                const SizedBox(width: 16),
                _socialIcon('assets/icons/instagram.png'),
                const SizedBox(width: 16),
                _socialIcon('assets/icons/youtube.png'),
              ],
            ),

            const SizedBox(height: 24),

            _sectionTitle('İletişim'),
            _sectionText(
              '📧 info@bilgisayarogreniyoruz.com\n'
              '📞 +90 555 123 45 67\n'
              '🌐 www.bilgisayarogreniyoruz.com',
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5B61F4),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                icon: const Icon(Icons.mail),
                onPressed: () {
                  // E-posta gönderme fonksiyonu eklenebilir
                },
                label: const Text(
                  'İletişime Geç',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 5))],
    );
  }

  Widget _sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF5B61F4)),
      ),
    );
  }

  Widget _sectionText(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, color: Colors.black87, height: 1.5),
      ),
    );
  }

  Widget _socialIcon(String assetPath) {
    return InkWell(
      onTap: () {
        // Sosyal medya linki eklenebilir
      },
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage(assetPath),
      ),
    );
  }

  Widget _buildGoogleMap() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: bartinKutlubey,
            zoom: 15,
          ),
          markers: {
            Marker(
              markerId: const MarkerId('bartin_kutlubey'),
              position: bartinKutlubey,
              infoWindow: const InfoWindow(title: 'Bartın Kutlubey Yerleşkesi'),
            ),
          },
          zoomControlsEnabled: false,
        ),
      ),
    );
  }

  Widget _buildMapPlaceholder() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade400),
      ),
      alignment: Alignment.center,
      child: const Text(
        'Harita sadece mobil cihazlarda görüntülenebilir.',
        style: TextStyle(color: Colors.black54),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String value;

  const _InfoCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 5))],
      ),
      child: Column(
        children: [
          Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(title, textAlign: TextAlign.center, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}
