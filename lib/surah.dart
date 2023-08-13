import 'dart:convert';

List<Surah> surahFromJson(String str) =>
    List<Surah>.from(json.decode(str).map((x) => Surah.fromJson(x)));

String surahToJson(List<Surah> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Surah {
  String arti;
  String asma;
  String audio;
  int ayat;
  String keterangan;
  String nama;
  String nomor;
  String rukuk;
  Type type;
  String urut;

  Surah({
    required this.arti,
    required this.asma,
    required this.audio,
    required this.ayat,
    required this.keterangan,
    required this.nama,
    required this.nomor,
    required this.rukuk,
    required this.type,
    required this.urut,
  });

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        arti: json["arti"],
        asma: json["asma"],
        audio: json["audio"],
        ayat: json["ayat"],
        keterangan: json["keterangan"],
        nama: json["nama"],
        nomor: json["nomor"],
        rukuk: json["rukuk"],
        type: typeValues.map[json["type"]]!,
        urut: json["urut"],
      );

  Map<String, dynamic> toJson() => {
        "arti": arti,
        "asma": asma,
        "audio": audio,
        "ayat": ayat,
        "keterangan": keterangan,
        "nama": nama,
        "nomor": nomor,
        "rukuk": rukuk,
        "type": typeValues.reverse[type],
        "urut": urut,
      };
}

// ignore: constant_identifier_names
enum Type { MADINAH, MEKAH }

final typeValues = EnumValues({"madinah": Type.MADINAH, "mekah": Type.MEKAH});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
