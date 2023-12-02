// Developed by Eng. Mouaz M. Al-Shahmeh
class Article {
  String? titleAr;
  String? titleEn;
  String? dscAr;
  String? dscEn;
  String? categoryAr;
  String? categoryEn;
  List<String?>? imageUrls;

  Article(
    this.titleAr,
    this.titleEn,
    this.dscAr,
    this.dscEn,
    this.categoryAr,
    this.categoryEn,
    this.imageUrls,
  );

  Article.fromJson(Map<String, dynamic> json) {
    titleAr = json['titleAr'];
    titleEn = json['titleEn'];
    dscAr = json['dscAr'];
    dscEn = json['dscEn'];
    categoryAr = json['categoryAr'];
    categoryEn = json['categoryEn'];
    imageUrls = List<String>.from(json['imageUrls'] ?? []);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['titleAr'] = titleAr;
    data['titleEn'] = titleEn;
    data['dscAr'] = dscAr;
    data['dscEn'] = dscEn;
    data['categoryAr'] = categoryAr;
    data['categoryEn'] = categoryEn;
    data['imageUrls'] = imageUrls;
    return data;
  }
}
