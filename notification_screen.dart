import 'package:flutter/material.dart';
import '../theme.dart';

class NotificationItem {
  final String id;
  final String title;
  final String body;
  final String time;
  final String type; // promo, order, info
  bool isRead;

  NotificationItem({
    required this.id,
    required this.title,
    required this.body,
    required this.time,
    required this.type,
    this.isRead = false,
  });
}

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<NotificationItem> _notifications = [
    NotificationItem(
      id: '1',
      title: '🎉 Promo Spesial Hari Ini!',
      body: 'Dapatkan diskon 15% untuk pemesanan pertama Anda. Berlaku hari ini saja!',
      time: 'Baru saja',
      type: 'promo',
    ),
    NotificationItem(
      id: '2',
      title: '🆓 Gratis Desain Custom',
      body: 'Min. pemesanan 50 pcs seragam gratis jasa desain custom oleh tim ahli kami.',
      time: '2 jam lalu',
      type: 'promo',
      isRead: false,
    ),
    NotificationItem(
      id: '3',
      title: 'ℹ️ Jam Operasional Parahita',
      body: 'Kami melayani Senin–Jumat 08.00–17.00 dan Sabtu 08.00–15.00.',
      time: '1 hari lalu',
      type: 'info',
      isRead: true,
    ),
    NotificationItem(
      id: '4',
      title: '🏆 30+ Tahun Melayani Indonesia',
      body: 'Parahita berdiri sejak 1990. Kepercayaan Anda adalah motivasi kami.',
      time: '2 hari lalu',
      type: 'info',
      isRead: true,
    ),
    NotificationItem(
      id: '5',
      title: '🆕 Koleksi Seragam Otomotif Baru',
      body: 'Kategori otomotif kini hadir dengan desain baru yang lebih modern dan ergonomis.',
      time: '3 hari lalu',
      type: 'promo',
      isRead: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final unreadCount = _notifications.where((n) => !n.isRead).length;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Notifikasi'),
            if (unreadCount > 0) ...[
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '$unreadCount',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.dark,
                  ),
                ),
              ),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                for (var n in _notifications) {
                  n.isRead = true;
                }
              });
            },
            child: const Text(
              'Tandai Semua',
              style: TextStyle(
                color: AppColors.secondary,
                fontFamily: 'Outfit',
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
      body: _notifications.isEmpty
          ? _buildEmptyState()
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: _notifications.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                return _NotifCard(
                  item: _notifications[index],
                  onTap: () {
                    setState(() => _notifications[index].isRead = true);
                  },
                  onDismiss: () {
                    setState(() => _notifications.removeAt(index));
                  },
                );
              },
            ),
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.notifications_off_rounded, size: 64, color: AppColors.textSecondary),
          SizedBox(height: 16),
          Text(
            'Belum ada notifikasi',
            style: TextStyle(
              fontFamily: 'Playfair',
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Promo dan informasi terbaru\nakan muncul di sini',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Outfit',
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _NotifCard extends StatelessWidget {
  final NotificationItem item;
  final VoidCallback onTap;
  final VoidCallback onDismiss;

  const _NotifCard({
    required this.item,
    required this.onTap,
    required this.onDismiss,
  });

  Color get _typeColor {
    switch (item.type) {
      case 'promo': return const Color(0xFFF59E0B);
      case 'order': return const Color(0xFF22C55E);
      default: return AppColors.primary;
    }
  }

  IconData get _typeIcon {
    switch (item.type) {
      case 'promo': return Icons.local_offer_rounded;
      case 'order': return Icons.receipt_long_rounded;
      default: return Icons.info_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(item.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDismiss(),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: AppColors.error.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(Icons.delete_rounded, color: AppColors.error),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: item.isRead ? Colors.white : AppColors.accent,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: item.isRead ? AppColors.divider : AppColors.primary.withOpacity(0.2),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: _typeColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(_typeIcon, color: _typeColor, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            item.title,
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              fontSize: 14,
                              fontWeight: item.isRead ? FontWeight.w500 : FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                        if (!item.isRead)
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.body,
                      style: const TextStyle(
                        fontFamily: 'Outfit',
                        fontSize: 12,
                        color: AppColors.textSecondary,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      item.time,
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        fontSize: 11,
                        color: AppColors.textSecondary.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
