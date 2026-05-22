import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  static const String appName = 'Final Ödev';

  // öğrenci onay kodu
  final String _ogrenciOnayKodu = "MOBIL2026";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF1DB954),
        scaffoldBackgroundColor: Color(0xFF121212),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int seciliIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tünaydın',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(icon: Icon(Icons.notifications_none), onPressed: () {}),
          IconButton(icon: Icon(Icons.history), onPressed: () {}),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
        ],
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                // üst kategori kısmı
                Row(
                  children: [
                    filtreKutusu('Müzik'),
                    SizedBox(width: 8),
                    filtreKutusu("Podcast'ler"),
                  ],
                ),

                SizedBox(height: 16),

                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: 2.8,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: [
                    muzikKarti(
                      'Beğenilen Şarkılar',
                      'https://picsum.photos/100?random=1',
                    ),

                    muzikKarti(
                      'Caddy Mix',
                      'https://picsum.photos/100?random=2',
                    ),

                    muzikKarti(
                      'Cafe Jukebox',
                      'https://picsum.photos/100?random=3',
                    ),

                    muzikKarti(
                      'Ofest Ordu 2025',
                      'https://picsum.photos/100?random=4',
                    ),

                    muzikKarti(
                      'Mavi Gri',
                      'https://picsum.photos/100?random=5',
                    ),

                    muzikKarti(
                      'Tekrar Tekrar',
                      'https://picsum.photos/100?random=6',
                    ),
                  ],
                ),

                SizedBox(height: 28),

                Text(
                  'İndirilen müzikler',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 16),

                SizedBox(
                  height: 180,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      albumKarti(
                        context,
                        'Güneşli Gün',
                        'Güneş',
                        'https://picsum.photos/150?random=7',
                      ),

                      albumKarti(
                        context,
                        'Döndüm Durdum',
                        'Rota',
                        'https://picsum.photos/150?random=8',
                      ),

                      albumKarti(
                        context,
                        'Tekrar Tekrar',
                        'Bir Daha',
                        'https://picsum.photos/150?random=9',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // mini oynatıcı
          miniPlayer(),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: seciliIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Ana sayfa',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Ara'),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'Kitaplığın',
          ),
        ],
      ),
    );
  }

  Widget filtreKutusu(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: TextStyle(color: Colors.white, fontSize: 12)),
    );
  }

  Widget muzikKarti(String title, String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(4),
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          Image.network(imageUrl, width: 56, height: 56, fit: BoxFit.cover),

          SizedBox(width: 8),

          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget albumKarti(
    BuildContext context,
    String title,
    String subtitle,
    String imageUrl,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetaySayfasi(title: title, imageUrl: imageUrl),
          ),
        );
      },
      child: Container(
        width: 110,
        margin: EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imageUrl, width: 110, height: 110, fit: BoxFit.cover),

            SizedBox(height: 8),

            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            Text(
              subtitle,
              style: TextStyle(color: Colors.grey, fontSize: 11),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget miniPlayer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xFF424242),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Image.network(
            'https://picsum.photos/100?random=12',
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),

          SizedBox(width: 8),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Son Kez',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),

                Text(
                  'Rota',
                  style: TextStyle(color: Colors.white70, fontSize: 11),
                ),
              ],
            ),
          ),

          Icon(Icons.devices, color: Colors.white70, size: 20),

          SizedBox(width: 16),

          Icon(Icons.favorite, color: Color(0xFF1DB954), size: 20),

          SizedBox(width: 16),

          Icon(Icons.play_arrow, color: Colors.white, size: 28),

          SizedBox(width: 8),
        ],
      ),
    );
  }
}

class DetaySayfasi extends StatelessWidget {
  final String title;
  final String imageUrl;

  const DetaySayfasi({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [IconButton(icon: Icon(Icons.more_vert), onPressed: () {})],
      ),
      // Taşmaları önlemek için Column yerine ListView kullanıyoruz
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Kapak fotoğrafı
          Center(
            child: Image.network(
              imageUrl,
              width: 220,
              height: 220,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: 24),

          // Albüm başlığı
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          SizedBox(height: 8),

          // Yapımcı / Sanatçı bilgisi
          Row(
            children: [
              Icon(Icons.person, color: Colors.white70, size: 16),
              SizedBox(width: 8),
              Text(
                'Ali Yurtalan',
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          SizedBox(height: 16),

          // Spotify Play ve Butonlar Satırı
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.favorite_border, color: Colors.white70, size: 28),
                  SizedBox(width: 24),
                  Icon(
                    Icons.download_for_offline_outlined,
                    color: Colors.white70,
                    size: 28,
                  ),
                  SizedBox(width: 24),
                  Icon(Icons.more_vert, color: Colors.white70, size: 28),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.shuffle, color: Color(0xFF1DB954), size: 28),
                  SizedBox(width: 24),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF1DB954),
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(12),
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.black,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 24),

          // Şarkı Listesi
          sarkiSatiri('1', 'Giriş (Intro)', '1:20'),
          sarkiSatiri('2', 'Ana Tema', '3:45'),
          sarkiSatiri('3', 'Yolculuk', '4:10'),
          sarkiSatiri('4', 'Gece', '2:55'),
          sarkiSatiri('5', 'Son (Outro)', '1:50'),
        ],
      ),
    );
  }

  // Şarkı satırlarını tekrar tekrar yazmamak için oluşturulan alt widget
  Widget sarkiSatiri(String no, String ad, String sure) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Text(no, style: TextStyle(color: Colors.white70, fontSize: 16)),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ad,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Ali Yurtalan',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ),
          Text(sure, style: TextStyle(color: Colors.white70, fontSize: 13)),
          SizedBox(width: 16),
          Icon(Icons.more_vert, color: Colors.white70, size: 20),
        ],
      ),
    );
  }
}

// ayarlar sayfası
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayarlar'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.account_circle, size: 40),
            title: Text('Kullanıcı Profili'),
            subtitle: Text('Hesap ayarlarını görüntüle'),
          ),

          Divider(),

          ListTile(
            leading: Icon(Icons.data_usage),
            title: Text('Veri Tasarrufu'),
            trailing: Icon(Icons.toggle_on, color: Color(0xFF1DB954), size: 36),
          ),

          ListTile(
            leading: Icon(Icons.language),
            title: Text('Diller'),
            subtitle: Text('Türkçe'),
          ),
        ],
      ),
    );
  }
}
