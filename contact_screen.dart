import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../theme.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  // Koordinat Kawasan Industri Multiguna (Jakarta)
  static const LatLng _officeLocation = LatLng(-6.1481, 106.7645);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 0,
            pinned: true,
            backgroundColor: AppColors.primary,
            title: const Text('Hubungi Kami'),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                // Google Maps
                SizedBox(
                  height: 220,
                  child: GoogleMap(
                    initialCameraPosition: const CameraPosition(
                      target: _officeLocation,
                      zoom: 15,
                    ),
                    markers: {
                      const Marker(
                        markerId: MarkerId('parahita_office'),
                        position: _officeLocation,
                        infoWindow: InfoWindow(
                          title: 'Parahita',
                          snippet: 'Kawasan Industri Multiguna Blok B No. 10A',
                        ),
                      ),
                    },
                    zoomControlsEnabled: false,
                    myLocationButtonEnabled: false,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Office Info Card
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [AppColors.primary, Color(0xFF2A4070)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Text('🏭', style: TextStyle(fontSize: 24)),
                                SizedBox(width: 10),
                                Text(
                                  'PT. Parahita Prima Sentosa',
                                  style: TextStyle(
                                    fontFamily: 'Playfair',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            _InfoRow(
                              icon: Icons.location_on_rounded,
                              text: AppStrings.address,
                              iconColor: AppColors.secondary,
                              textColor: Colors.white,
                            ),
                            const SizedBox(height: 10),
                            _InfoRow(
                              icon: Icons.access_time_rounded,
                              text: AppStrings.hours,
                              iconColor: AppColors.secondary,
                              textColor: Colors.white,
                            ),
                            const SizedBox(height: 10),
                            _InfoRow(
                              icon: Icons.phone_rounded,
                              text: AppStrings.phone,
                              iconColor: AppColors.secondary,
                              textColor: Colors.white,
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                onPressed: _openMaps,
                                icon: const Icon(Icons.directions_rounded, size: 18),
                                label: const Text('Buka di Google Maps'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.secondary,
                                  foregroundColor: AppColors.dark,
                                  textStyle: const TextStyle(
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Contact Actions
                      const Text(
                        'Hubungi Kami',
                        style: TextStyle(
                          fontFamily: 'Playfair',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 14),
                      _ContactButton(
                        icon: '💬',
                        label: 'WhatsApp',
                        subtitle: 'Chat langsung dengan tim kami',
                        color: const Color(0xFF25D366),
                        onTap: _openWhatsApp,
                      ),
                      const SizedBox(height: 10),
                      _ContactButton(
                        icon: '📞',
                        label: 'Telepon',
                        subtitle: AppStrings.phone,
                        color: const Color(0xFF3B82F6),
                        onTap: _callPhone,
                      ),
                      const SizedBox(height: 10),
                      _ContactButton(
                        icon: '🌐',
                        label: 'Website',
                        subtitle: 'www.seragamparahita.com',
                        color: AppColors.primary,
                        onTap: _openWebsite,
                      ),
                      const SizedBox(height: 10),
                      _ContactButton(
                        icon: '📧',
                        label: 'Email',
                        subtitle: AppStrings.email,
                        color: const Color(0xFFEF4444),
                        onTap: _sendEmail,
                      ),
                      const SizedBox(height: 24),

                      // FAQ Section
                      const Text(
                        'Pertanyaan Umum',
                        style: TextStyle(
                          fontFamily: 'Playfair',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ..._faqs.map((faq) => _FaqItem(question: faq[0], answer: faq[1])),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static const List<List<String>> _faqs = [
    ['Berapa minimum pemesanan?', 'Minimum pemesanan kami adalah 12 pcs untuk seragam standar. Untuk produk tertentu, minimum order dapat berbeda.'],
    ['Apakah bisa custom desain?', 'Ya, kami menyediakan layanan desain custom sesuai kebutuhan Anda. Tim desainer kami siap membantu.'],
    ['Berapa lama waktu produksi?', 'Waktu produksi bervariasi 7–21 hari kerja tergantung jenis produk dan jumlah pesanan.'],
    ['Apakah ada pengiriman ke luar kota?', 'Ya, kami melayani pengiriman ke seluruh Indonesia melalui ekspedisi terpercaya.'],
    ['Apakah ada garansi produk?', 'Kami menjamin kualitas setiap produk. Jika terdapat cacat produksi, kami siap mengganti.'],
  ];

  void _openMaps() async {
    const url = 'https://maps.google.com/?q=Kawasan+Industri+Multiguna+Jakarta';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }

  void _openWhatsApp() async {
    const url = 'https://wa.me/${AppStrings.waNumber}?text=Halo%20Parahita%2C%20saya%20ingin%20bertanya%20mengenai%20produk%20seragam.';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }

  void _callPhone() async {
    const url = 'tel:${AppStrings.phone}';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  void _openWebsite() async {
    if (await canLaunchUrl(Uri.parse(AppStrings.website))) {
      await launchUrl(Uri.parse(AppStrings.website), mode: LaunchMode.externalApplication);
    }
  }

  void _sendEmail() async {
    final url = 'mailto:${AppStrings.email}?subject=Inquiry%20Seragam%20Parahita';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  final Color textColor;

  const _InfoRow({
    required this.icon,
    required this.text,
    required this.iconColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: iconColor, size: 18),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Outfit',
              fontSize: 13,
              color: textColor.withOpacity(0.85),
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}

class _ContactButton extends StatelessWidget {
  final String icon;
  final String label;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _ContactButton({
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.divider),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(child: Text(icon, style: const TextStyle(fontSize: 22))),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios_rounded, size: 14, color: color),
          ],
        ),
      ),
    );
  }
}

class _FaqItem extends StatefulWidget {
  final String question;
  final String answer;

  const _FaqItem({required this.question, required this.answer});

  @override
  State<_FaqItem> createState() => _FaqItemState();
}

class _FaqItemState extends State<_FaqItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(
            widget.question,
            style: const TextStyle(
              fontFamily: 'Outfit',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          trailing: Icon(
            _expanded ? Icons.remove_circle_rounded : Icons.add_circle_rounded,
            color: AppColors.primary,
            size: 20,
          ),
          onExpansionChanged: (v) => setState(() => _expanded = v),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(
                widget.answer,
                style: const TextStyle(
                  fontFamily: 'Outfit',
                  fontSize: 13,
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
