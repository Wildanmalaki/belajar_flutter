class DataLapangan {
  final String namaLapangan;
  final String jenisLapangan;
  final String waktu;
  final String image;

  DataLapangan({
    required this.namaLapangan,
    required this.jenisLapangan,
    required this.waktu,
    required this.image,
  });
}

final List<DataLapangan> dataLapangan = [
  DataLapangan(
    namaLapangan: "Pancoran Soccer Field",
    jenisLapangan: "Lapangan Bola",
    waktu: "Malam",
    image : "https://gelora-public-storage.s3-ap-southeast-1.amazonaws.com/upload/public-20210216090138.jpg",
  ),
  DataLapangan(
    namaLapangan: "SR32 Minisoccer Setiabudi",
    jenisLapangan: "Lapangan Minisoccer",
    waktu: "Sore",
     image : "https://gelora-public-storage.s3-ap-southeast-1.amazonaws.com/upload/public-20210216090138.jpg",
  ),
  DataLapangan(
    namaLapangan: "Cilandak Futsal Arena",
    jenisLapangan: "Lapangan Futsal",
    waktu: "Pagi",
     image : "https://gelora-public-storage.s3-ap-southeast-1.amazonaws.com/upload/public-20210216090138.jpg",
  ),
  DataLapangan(
    namaLapangan: "Kemang Sport Center",
    jenisLapangan: "Lapangan Basket",
    waktu: "Siang",
     image : "https://gelora-public-storage.s3-ap-southeast-1.amazonaws.com/upload/public-20210216090138.jpg",
  ),
  DataLapangan(
    namaLapangan: "Senayan Tennis Court",
    jenisLapangan: "Lapangan Tenis",
    waktu: "Sore",
     image : "https://gelora-public-storage.s3-ap-southeast-1.amazonaws.com/upload/public-20210216090138.jpg",
  ),
];




