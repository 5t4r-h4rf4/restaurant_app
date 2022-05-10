class RestaurantPlace {
  String name;
  String description;
  String pictId;
  String city;
  String rating;
  List<String> menu;
  List<String> imageUrls;

  RestaurantPlace({
    required this.name,
    required this.description,
    required this.pictId,
    required this.city,
    required this.rating,
    required this.menu,
    required this.imageUrls,
  });
}

var restaurantPlaceList = [
  RestaurantPlace(
    name: 'Sukijan',
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    pictId: 'assets/images/sukijan.jpeg',
    city: 'Jalan Gajah Mada No.100 Bojonegoro',
    rating: '4,5',
    menu: ['Nasi Kucing', 'Indomie', 'Es Teh', 'Air Putih'],
    imageUrls: [
      'https://akcdn.detik.net.id/community/media/visual/2021/09/14/fakta-menarik-nasi-kucing-2_43.jpeg?w=700&q=90',
      'https://statik.tempo.co/data/2018/01/29/id_680428/680428_720.jpg',
      'https://d1vbn70lmn1nqe.cloudfront.net/prod/wp-content/uploads/2021/06/15093247/Ketahui-Fakta-Es-Teh-Manis.jpg.webp',
      'https://asset.kompas.com/crops/Yhdgc33br_XoT6WEhECYIaVCMLQ=/6x108:806x642/750x500/data/photo/2021/12/14/61b88f1401890.jpg',
    ],
  ),
  RestaurantPlace(
    name: 'Sego Dessin',
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    pictId: 'assets/images/dessin.jpg',
    city: 'Jalan Gajah Mada No.80 Bojonegoro',
    rating: '4,5',
    menu: ['Nasi Dessin', 'Es teh'],
    imageUrls: [
      'https://10619-2.s.cdn12.com/rests/original/110_511936629.jpg',
      'https://d1vbn70lmn1nqe.cloudfront.net/prod/wp-content/uploads/2021/06/15093247/Ketahui-Fakta-Es-Teh-Manis.jpg.webp',
    ],
  ),
  RestaurantPlace(
    name: 'Nasi Pecel Bakri',
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    pictId: 'assets/images/bakri.jpg',
    city: 'Jalan Untung Suropati No.10 Bojonegoro',
    rating: '4,1',
    menu: ['Nasi Pecel', 'Es Teh', 'Air Putih'],
    imageUrls: [
      'https://blog.bebasbayar.com/wp-content/uploads/2020/03/Resep-pecel-paling-nikmat-sedunia.jpg',
      'https://d1vbn70lmn1nqe.cloudfront.net/prod/wp-content/uploads/2021/06/15093247/Ketahui-Fakta-Es-Teh-Manis.jpg.webp',
      'https://asset.kompas.com/crops/Yhdgc33br_XoT6WEhECYIaVCMLQ=/6x108:806x642/750x500/data/photo/2021/12/14/61b88f1401890.jpg',
    ],
  ),
];
