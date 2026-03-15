class ProductCategory {
  final String id;
  final String name;
  final String icon;
  final String description;
  final String imageUrl;
  final List<Product> products;

  const ProductCategory({
    required this.id,
    required this.name,
    required this.icon,
    required this.description,
    required this.imageUrl,
    this.products = const [],
  });
}

class Product {
  final String id;
  final String name;
  final String categoryId;
  final String description;
  final List<String> imageUrls;
  final String material;
  final List<String> colors;
  final List<String> sizes;
  final bool customizable;

  const Product({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.description,
    required this.imageUrls,
    this.material = '',
    this.colors = const [],
    this.sizes = const [],
    this.customizable = true,
  });
}

class PromoItem {
  final String id;
  final String title;
  final String subtitle;
  final String imageUrl;
  final String? badge;
  final bool isActive;

  const PromoItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    this.badge,
    this.isActive = true,
  });
}

class OrderInquiry {
  String name;
  String company;
  String phone;
  String email;
  String productCategory;
  String quantity;
  String notes;
  DateTime createdAt;

  OrderInquiry({
    this.name = '',
    this.company = '',
    this.phone = '',
    this.email = '',
    this.productCategory = '',
    this.quantity = '',
    this.notes = '',
  }) : createdAt = DateTime.now();

  Map<String, dynamic> toJson() => {
    'name': name,
    'company': company,
    'phone': phone,
    'email': email,
    'productCategory': productCategory,
    'quantity': quantity,
    'notes': notes,
    'createdAt': createdAt.toIso8601String(),
  };
}

// ─── Static Data ─────────────────────────────────────────────────────────────

class AppData {
  static const List<ProductCategory> categories = [
    ProductCategory(
      id: 'waralaba',
      name: 'Waralaba',
      icon: '🏪',
      description: 'Seragam profesional untuk bisnis waralaba Anda',
      imageUrl: 'https://seragamparahita.com/wp-content/uploads/2020/09/WhatsApp-Image-2018-05-04-at-8.47.46-PM-1024x1024.jpeg',
    ),
    ProductCategory(
      id: 'fnb',
      name: 'Food & Beverage',
      icon: '🍽️',
      description: 'Seragam restoran, kafe, dan industri kuliner',
      imageUrl: 'https://seragamparahita.com/wp-content/uploads/2020/09/WhatsApp-Image-2018-05-04-at-8.47.37-PM-1-1024x1024.jpeg',
    ),
    ProductCategory(
      id: 'otomotif',
      name: 'Otomotif',
      icon: '🔧',
      description: 'Seragam bengkel, dealer, dan industri otomotif',
      imageUrl: 'https://seragamparahita.com/wp-content/uploads/2020/09/WhatsApp-Image-2018-05-04-at-8.47.43-PM-1024x1024.jpeg',
    ),
    ProductCategory(
      id: 'event',
      name: 'Event',
      icon: '🎪',
      description: 'Seragam dan kostum untuk berbagai event',
      imageUrl: 'https://seragamparahita.com/wp-content/uploads/2020/09/WhatsApp-Image-2018-05-04-at-8.47.44-PM-1024x1024.jpeg',
    ),
    ProductCategory(
      id: 'tambang',
      name: 'Tambang',
      icon: '⛏️',
      description: 'Seragam safety untuk industri pertambangan',
      imageUrl: 'https://seragamparahita.com/wp-content/uploads/2020/09/WhatsApp-Image-2018-05-04-at-8.47.45-PM-1024x1024.jpeg',
    ),
    ProductCategory(
      id: 'kantor',
      name: 'Kantor',
      icon: '💼',
      description: 'Seragam formal dan casual untuk perkantoran',
      imageUrl: 'https://seragamparahita.com/wp-content/uploads/2020/09/WhatsApp-Image-2018-05-04-at-8.47.39-PM-1024x1024.jpeg',
    ),
    ProductCategory(
      id: 'media',
      name: 'Media',
      icon: '📺',
      description: 'Seragam untuk industri media dan kreatif',
      imageUrl: 'https://seragamparahita.com/wp-content/uploads/2020/09/WhatsApp-Image-2018-05-04-at-8.47.41-PM-1024x1024.jpeg',
    ),
    ProductCategory(
      id: 'merchandise',
      name: 'Merchandise',
      icon: '🎁',
      description: 'Souvenir dan merchandise promosi berkualitas',
      imageUrl: 'https://seragamparahita.com/wp-content/uploads/2020/09/WhatsApp-Image-2018-05-04-at-8.47.42-PM-1024x1024.jpeg',
    ),
  ];

  static const List<PromoItem> promos = [
    PromoItem(
      id: 'p1',
      title: 'Diskon 15% Pemesanan Pertama',
      subtitle: 'Berlaku untuk semua kategori produk',
      imageUrl: 'https://seragamparahita.com/wp-content/uploads/2020/05/Home-Page-Photo-2.png',
      badge: 'NEW',
    ),
    PromoItem(
      id: 'p2',
      title: 'Gratis Desain Custom',
      subtitle: 'Min. pemesanan 50 pcs seragam',
      imageUrl: 'https://seragamparahita.com/wp-content/uploads/2020/05/Home-Page-Photo-2.png',
      badge: 'HOT',
    ),
    PromoItem(
      id: 'p3',
      title: 'Kualitas Terbaik Sejak 1990',
      subtitle: 'Lebih dari 30 tahun melayani Indonesia',
      imageUrl: 'https://seragamparahita.com/wp-content/uploads/2020/05/Home-Page-Photo-2.png',
    ),
  ];

  static const List<String> stats = ['30+', '500+', '1000+', '8'];
  static const List<String> statLabels = ['Tahun Pengalaman', 'Klien Aktif', 'Proyek Selesai', 'Kategori Produk'];
}
