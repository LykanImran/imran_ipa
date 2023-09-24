import 'package:flutter/material.dart';

enum RouteStatus {
  UploadImage,
  TemplateCard,
  CardView,
  EditCard,
  Customisation
}

class PageRouteProvider with ChangeNotifier {
  RouteStatus _status = RouteStatus.UploadImage;

  RouteStatus get routeStatus => _status;



  void setUploadImageState() {
    _status = RouteStatus.UploadImage;
    notifyListeners();
  }

  void setTemplateCardState() {
    _status = RouteStatus.TemplateCard;
    notifyListeners();
  }

  void setCardViewState() {
    _status = RouteStatus.CardView;
    notifyListeners();
  }

  void setEditCardState() {
    _status = RouteStatus.EditCard;
    notifyListeners();
  }

  void setCustomisationState() {
    _status = RouteStatus.Customisation;
    notifyListeners();
  }
}
