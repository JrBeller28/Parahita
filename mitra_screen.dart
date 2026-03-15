import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme.dart';

class MitraPartner {
  final String id;
  final String name;
  final String category;
  final String emoji;
  final String logoUrl;
  final String description;
  final String websiteUrl;
  final String color;

  const MitraPartner({
    required this.id,
    required this.name,
    required this.category,
    required this.emoji,
    required this.logoUrl,
    required this.description,
    required this.websiteUrl,
    required this.color,
  });
}

const List<MitraPartner> _allMitra = [
  // Otomotif
  MitraPartner(
    id: 'shell', name: 'Shell', category: 'Otomotif',
    emoji: '🐚', color: '#FEF9C3',
    logoUrl: 'https://seragamparahita.com/wp-content/uploads/2018/05/Shell-Icon-1.png',
    description: 'Perusahaan energi dan pelumas global terkemuka.',
    websiteUrl: 'https://www.shell.co.id',
  ),
  MitraPartner(
    id: 'bridgestone', name: 'Bridgestone', category: 'Otomotif',
    emoji: '🔴', color: '#FEE2E2',
    logoUrl: 'https://seragamparahita.com/wp-content/uploads/2018/05/Bridgestone-Icon-1.png',
    description: 'Produsen ban terbesar di dunia asal Jepang.',
    websiteUrl: 'https://www.bridgestone.co.id',
  ),
  MitraPartner(
    id: 'chevrolet', name: 'Chevrolet', category: 'Otomotif',
    emoji: '🚗', color: '#FEF3C7',
    logoUrl: 'https://seragamparahita.com/wp-content/uploads/2018/05/Chevrolet-Icon-1.png',
    description: 'Merek otomotif premium dari General Motors.',
    websiteUrl: 'https://www.chevrolet.co.id',
  ),
  MitraPartner(
    id: 'daihatsu', name: 'Daihatsu', category: 'Otomotif',
    emoji: '🚙', color: '#DBEAFE',
    logoUrl: 'https://seragamparahita.com/wp-content/uploads/2018/05/Daihatsu-Icon-1.png',
    description: 'Merek otomotif Jepang yang populer di Indonesia.',
    websiteUrl: 'https://www.daihatsu.co.id',
  ),
  MitraPartner(
    id: 'wuling', name: 'Wuling', category: 'Otomotif',
    emoji: '🚘', color: '#EDE9FE',
    logoUrl: 'https://seragamparahita.com/wp-content/uploads/2018/05/Wuling-Icon-1.png',
    description: 'Merek otomotif China yang berkembang pesat di Indonesia.',
    websiteUrl: 'https://www.wuling.id',
  ),
  MitraPartner(
    id: 'bosch', name: 'Bosch', category: 'Otomotif',
    emoji: '🔩', color: '#DCFCE7',
    logoUrl: 'https://seragamparahita.com/wp-content/uploads/2018/05/Bosch-Icon-1.png',
    description: 'Perusahaan teknologi dan peralatan otomotif global.',
    websiteUrl: 'https://www.bosch.co.id',
  ),
  MitraPartner(
    id: 'oto', name: 'Oto Group', category: 'Otomotif',
    emoji: '🏎️', color: '#F0FDF4',
    logoUrl: 'https://seragamparahita.com/wp-content/uploads/2018/05/Oto-Group-Icon-1.png',
    description: 'Grup otomotif yang bergerak di bidang keuangan kendaraan.',
    websiteUrl: 'https://www.oto.co.id',
  ),
  // Media
  MitraPartner(
    id: 'tvone', name: 'TV One', category: 'Media',
    emoji: '📺', color: '#FEE2E2',
    logoUrl: 'https://seragamparahita.com/wp-content/uploads/2018/05/TV-One-Icon-1.png',
    description: 'Stasiun televisi berita dan olahraga terkemuka Indonesia.',
    websiteUrl: 'https://www.tvonenews.com',
  ),
  MitraPartner(
    id: 'trans7', name: 'Trans 7', category: 'Media',
    emoji: '🎬', color: '#FEF9C3',
    logoUrl: 'https://seragamparahita.com/wp-content/uploads/2018/05/Trans-7-Icon-1.png',
    description: 'Stasiun televisi hiburan dan informasi nasional.',
    websiteUrl: 'https://www.trans7.co.id',
  ),
  MitraPartner(
    id: 'bola', name: 'Bola', category: 'Media',
    emoji: '⚽', color: '#DCFCE7',
    logoUrl: 'https://seragamparahita.com/wp-content/uploads/2018/05/Bola-Icon-1.png',
    description: 'Media olahraga terkemuka di Indonesia.',
    websiteUrl: 'https://www.bola.net',
  ),
  MitraPartner(
    id: 'kompas', name: 'Kompas', category: 'Media',
    emoji: '📰', color: '#DBEAFE',
    logoUrl: 'https://seragamparahita.com/wp-content/uploads/2018/05/Kompas-Icon-1.png',
    description: 'Surat kabar nasional terpercaya sejak 1965.',
    websiteUrl: 'https://www.kompas.com',
  ),
  // Ritel & Waralaba
  MitraPartner(
    id: 'carrefour', name: 'Carrefour', category: 'Ritel',
    emoji: '🛒', color: '#DBEAFE',
    logoUrl: 'https://seragamparahita.com/wp-content/uploads/2018/05/Carrefour-Icon-1.png',
    description: 'Jaringan supermarket dan hypermarket internasional.',
    websiteUrl: 'https://www.carrefour.co.id',
  ),
  MitraPartner(
    id: 'alfamart', name: 'Alfamart', category: 'Ritel',
    emoji: '🏪', color: '#FEE2E2',
    logoUrl: 'https://seragamparahita.com/wp-content/uploads/2018/05/Alfmart-Icon-1.png',
    description: 'Jaringan minimarket terbesar di Indonesia.',
    websiteUrl: 'https://www.alfamart.co.id',
  ),
  MitraPartner(
    id: 'alfamidi', name: 'Alfamidi', category: 'Ritel',
    emoji: '🏬', color: '#FEF9C3',
    logoUrl: 'https://seragamparahita.com/wp-content/uploads/2018/05/Alfamidi-Icon-1.png',
    description: 'Jaringan supermarket format midi dari grup Alfa.',
    websiteUrl: 'https://www.alfamidi.co.id',
  ),
  MitraPartner(
    id: 'transmart', name: 'Transmart', category: 'Ritel',
    emoji: '🛍️', color: '#EDE9FE',
    logoUrl: 'https://seragamparahita.com/wp-content/uploads/2018/05/Transmart-Logo.png',
    description: 'Supermarket dan hipermarket milik Trans Corp.',
    websiteUrl: 'https://www.transmart.co.id',
  ),
  MitraPartner(
    id: 'circlek', name: 'Circle K', category: 'Ritel',
    emoji: '🔵', color: '#DBEAFE',
    logoUrl: 'https://seragamparahita.com/wp-content/uploads/2018/05/Circle-Icon-1.png',
    description: 'Convenience store internasional yang beroperasi 24 jam.',
    websiteUrl: 'https://www.circlek.co.id',
  ),
  // Lainnya
  MitraPartner(
    id: 'allianz', name: 'Allianz', category: 'Keuangan',
    emoji: '🛡️', color: '#DBEAFE',
    logoUrl: 'https://seragamparahita.com/wp-content/uploads/2018/05/Allianz-Icon-1.png',
    description: 'Perusahaan asuransi dan jasa keuangan global.',
    websiteUrl: 'https://www.allianz.co.id',
  ),
  MitraPartner(
    id: 'arnotts', name: "Arnott's", category: 'F&B',
    emoji: '🍪', color: '#FEF3C7',
    logoUrl: 'https://seragamparahita.com/wp-content/uploads/2018/05/Arnotts-Icon-1.png',
    description: 'Produsen biskuit dan snack ternama dari Australia.',
    websiteUrl: 'https://www.arnotts.com',
  ),
  MitraPartner(
    id: 'dandan', name: 'Dan Dan', category: 'F&B',
    emoji: '🍜', color: '#DCFCE7',
    logoUrl: 'https://seragamparahita.com/wp-content/uploads/2018/05/Dan-Dan-Icon-1.png',
    description: 'Brand makanan dan minuman yang berkembang di Indonesia.',
    websiteUrl: '#',
  ),
  MitraPartner(
    id: 'jaya', name: 'Jaya Konstruksi', category: 'Konstruksi',
    emoji: '🏗️', color: '#FEF9C3',
    logoUrl: 'https://seragamparahita.com/wp-content/uploads/2018/05/Jaya-Konstruksi-Icon-1.png',
    description: 'Perusahaan konstruksi dan infrastruktur terkemuka.',
    websiteUrl: 'https://www.jayakonstruksi.com',
  ),
];

class MitraScreen extends StatefulWidget {
  const MitraScreen({super.key});

  @override
  State<MitraScreen> createState() => _MitraScreenState();
}

class _MitraScreenState extends State<MitraScreen> {
  String _selectedFilter = 'Semua';
  final List<String> _categories = ['Semua', 'Otomotif', 'Media', 'Ritel', 'Keuangan', 'F&B', 'Konstruksi'];

  List<MitraPartner> get _filtered => _selectedFilter == 'Semua'
      ? _allMitra
      : _allMitra.where((m) => m.category == _selectedFilter).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mitra Kami'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.secondary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '${_allMitra.length} Mitra',
                  style: const TextStyle(
                    fontFamily: 'Outfit',
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.secondary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Header Stats
          _buildHeaderBanner(),
          // Filter Chips
          _buildFilterBar(),
          // Grid
          Expanded(
            child: _filtered.isEmpty
                ? const Center(child: Text('Tidak ada mitra di kategori ini'))
                : GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.1,
                    ),
                    itemCount: _filtered.length,
                    itemBuilder: (context, index) => _MitraCard(
                      partner: _filtered[index],
                      onTap: () => _showMitraDetail(context, _filtered[index]),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderBanner() {
    final categoryCount = _allMitra.map((m) => m.category).toSet().length;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.dark, AppColors.primary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Dipercaya oleh Perusahaan Terkemuka',
            style: TextStyle(
              fontFamily: 'Playfair',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Bergabung dengan ${_allMitra.length} perusahaan besar yang telah mempercayakan kebutuhan seragam mereka kepada Parahita.',
            style: const TextStyle(
              fontFamily: 'Outfit',
              fontSize: 12,
              color: Colors.white70,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _StatChip(label: '${_allMitra.length}+ Mitra', icon: '🤝'),
              const SizedBox(width: 8),
              _StatChip(label: '$categoryCount Industri', icon: '🏭'),
              const SizedBox(width: 8),
              _StatChip(label: '30+ Tahun', icon: '⭐'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: _categories.map((cat) {
            final isActive = cat == _selectedFilter;
            final count = cat == 'Semua'
                ? _allMitra.length
                : _allMitra.where((m) => m.category == cat).length;
            return GestureDetector(
              onTap: () => setState(() => _selectedFilter = cat),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                decoration: BoxDecoration(
                  color: isActive ? AppColors.primary : AppColors.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isActive ? AppColors.primary : AppColors.divider,
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      cat,
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: isActive ? Colors.white : AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                      decoration: BoxDecoration(
                        color: isActive
                            ? AppColors.secondary.withOpacity(0.3)
                            : AppColors.divider,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '$count',
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: isActive ? AppColors.secondary : AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showMitraDetail(BuildContext context, MitraPartner partner) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _MitraDetailSheet(partner: partner),
    );
  }
}

class _MitraCard extends StatelessWidget {
  final MitraPartner partner;
  final VoidCallback onTap;

  const _MitraCard({required this.partner, required this.onTap});

  Color get _bgColor {
    try {
      final hex = partner.color.replaceAll('#', '');
      return Color(int.parse('0xFF$hex'));
    } catch (_) {
      return AppColors.accent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.divider),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo area
            Container(
              width: double.infinity,
              height: 80,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: _bgColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    partner.logoUrl,
                    height: 52,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => Text(
                      partner.emoji,
                      style: const TextStyle(fontSize: 36),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Column(
                children: [
                  Text(
                    partner.name,
                    style: const TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.07),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      partner.category,
                      style: const TextStyle(
                        fontFamily: 'Outfit',
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MitraDetailSheet extends StatelessWidget {
  final MitraPartner partner;

  const _MitraDetailSheet({required this.partner});

  Color get _bgColor {
    try {
      final hex = partner.color.replaceAll('#', '');
      return Color(int.parse('0xFF$hex'));
    } catch (_) {
      return AppColors.accent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: AppColors.divider,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Logo
          Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              color: _bgColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Image.network(
                partner.logoUrl,
                height: 72,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => Text(
                  partner.emoji,
                  style: const TextStyle(fontSize: 50),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            partner.name,
            style: const TextStyle(
              fontFamily: 'Playfair',
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.08),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              partner.category,
              style: const TextStyle(
                fontFamily: 'Outfit',
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              partner.description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Outfit',
                fontSize: 14,
                color: AppColors.textSecondary,
                height: 1.6,
              ),
            ),
          ),
          const SizedBox(height: 16),
          if (partner.websiteUrl != '#')
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () async {
                  final uri = Uri.parse(partner.websiteUrl);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  }
                },
                icon: const Icon(Icons.open_in_new_rounded, size: 18),
                label: const Text('Kunjungi Website'),
              ),
            ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close_rounded, size: 18),
              label: const Text('Tutup'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.textSecondary,
                side: const BorderSide(color: AppColors.divider),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(vertical: 14),
                textStyle: const TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 8),
        ],
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  final String label;
  final String icon;

  const _StatChip({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(icon, style: const TextStyle(fontSize: 13)),
          const SizedBox(width: 5),
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Outfit',
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
