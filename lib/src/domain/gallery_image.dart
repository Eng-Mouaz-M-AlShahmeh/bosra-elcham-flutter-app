// Developed by Eng. Mouaz M. Al-Shahmeh
class GalleryImage {
  String? titleAr;
  String? titleEn;
  String? dscAr;
  String? dscEn;
  String? categoryAr;
  String? categoryEn;
  String? imageUrl;
  String? categoryImageUrl;

  GalleryImage(
    this.titleAr,
    this.titleEn,
    this.dscAr,
    this.dscEn,
    this.categoryAr,
    this.categoryEn,
    this.imageUrl,
    this.categoryImageUrl,
  );

  GalleryImage.fromJson(Map<String, dynamic> json) {
    titleAr = json['titleAr'];
    titleEn = json['titleEn'];
    dscAr = json['dscAr'];
    dscEn = json['dscEn'];
    categoryAr = json['categoryAr'];
    categoryEn = json['categoryEn'];
    imageUrl = json['imageUrl'];
    categoryImageUrl = json['categoryImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['titleAr'] = titleAr;
    data['titleEn'] = titleEn;
    data['dscAr'] = dscAr;
    data['dscEn'] = dscEn;
    data['categoryAr'] = categoryAr;
    data['categoryEn'] = categoryEn;
    data['imageUrl'] = imageUrl;
    data['categoryImageUrl'] = categoryImageUrl;
    return data;
  }
}
