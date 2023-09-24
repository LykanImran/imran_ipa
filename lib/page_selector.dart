import 'package:flutter/material.dart';
import 'package:imran_ipa/view/card_view/card_view_screen.dart';
import 'package:imran_ipa/view/card_view/edit_card_screen.dart';
import 'package:imran_ipa/view/template_card/template_card_screen.dart';
import 'package:imran_ipa/view/upload_image/upload_screen.dart';
import 'package:provider/provider.dart';

import 'providers/page_route_provider.dart';
import 'view/card_view/customization_screen.dart';

class PageSelector extends StatefulWidget {
  const PageSelector({super.key});

  @override
  State<PageSelector> createState() => _PageSelectorState();
}

class _PageSelectorState extends State<PageSelector> {
  late PageRouteProvider pageRoute;
  @override
  // void initState(){
  //   super.initState();
  //   user = Provider.of<UserProvider>(context);
  //   user.checkOnBoardingState();
  // }
  void didChangeDependencies() {
    super.didChangeDependencies();
    pageRoute = Provider.of<PageRouteProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    switch (pageRoute.routeStatus) {
      case RouteStatus.UploadImage:
        return const UploadScreen();
      case RouteStatus.TemplateCard:
        return const TemplateCardScreen();
      case RouteStatus.CardView:
        return const CardViewScreen();
      case RouteStatus.EditCard:
        return const EditCardScreen();

      case RouteStatus.Customisation:
        return const CustomizationScreen();
      default:
        return Container();
    }
  }
}
