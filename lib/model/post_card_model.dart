class PostCardModel {
  late final String? profileBannerImageURL;

  PostCardModel({this.profileBannerImageURL});

  PostCardModel.fromJson(Map<String, dynamic> json) {
    profileBannerImageURL = json['profileBannerImageURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profileBannerImageURL'] = this.profileBannerImageURL;
    return data;
  }
}
