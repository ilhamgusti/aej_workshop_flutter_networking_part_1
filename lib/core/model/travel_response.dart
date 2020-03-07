class TravelResponse {
  String result;
  List<Data> data;

  TravelResponse({this.result, this.data});

  TravelResponse.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String namaPariwisata;
  String alamatPariwisata;
  String detailPariwisata;
  String gambarPariwisata;

  Data(
      {this.namaPariwisata,
      this.alamatPariwisata,
      this.detailPariwisata,
      this.gambarPariwisata});

  Data.fromJson(Map<String, dynamic> json) {
    namaPariwisata = json['nama_pariwisata'];
    alamatPariwisata = json['alamat_pariwisata'];
    detailPariwisata = json['detail_pariwisata'];
    gambarPariwisata = json['gambar_pariwisata'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama_pariwisata'] = this.namaPariwisata;
    data['alamat_pariwisata'] = this.alamatPariwisata;
    data['detail_pariwisata'] = this.detailPariwisata;
    data['gambar_pariwisata'] = this.gambarPariwisata;
    return data;
  }
}
