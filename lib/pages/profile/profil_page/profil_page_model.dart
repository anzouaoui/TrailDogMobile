import '/component/friends/friends_compoennt/friends_compoennt_widget.dart';
import '/component/navbar_component/navbar_component_widget.dart';
import '/component/profil_dog_component/profil_dog_component_widget.dart';
import '/component/profile/no_rewards_component/no_rewards_component_widget.dart';
import '/component/profile/no_stats_component/no_stats_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profil_page_widget.dart' show ProfilPageWidget;
import 'package:flutter/material.dart';

class ProfilPageModel extends FlutterFlowModel<ProfilPageWidget> {
  ///  Local state fields for this page.
  /// Affichafge en fonction de l'icone cliqué
  String profileState = 'dogs';

  ///  State fields for stateful widgets in this page.

  // Models for ProfilDogComponent dynamic component.
  late FlutterFlowDynamicModels<ProfilDogComponentModel>
      profilDogComponentModels1;
  // Models for FriendsCompoennt dynamic component.
  late FlutterFlowDynamicModels<FriendsCompoenntModel> friendsCompoenntModels;
  // Model for NoRewardsComponent component.
  late NoRewardsComponentModel noRewardsComponentModel;
  // Model for NoStatsComponent component.
  late NoStatsComponentModel noStatsComponentModel;
  // Models for ProfilDogComponent dynamic component.
  late FlutterFlowDynamicModels<ProfilDogComponentModel>
      profilDogComponentModels2;
  // Model for NavbarComponent component.
  late NavbarComponentModel navbarComponentModel;

  @override
  void initState(BuildContext context) {
    profilDogComponentModels1 =
        FlutterFlowDynamicModels(() => ProfilDogComponentModel());
    friendsCompoenntModels =
        FlutterFlowDynamicModels(() => FriendsCompoenntModel());
    noRewardsComponentModel =
        createModel(context, () => NoRewardsComponentModel());
    noStatsComponentModel = createModel(context, () => NoStatsComponentModel());
    profilDogComponentModels2 =
        FlutterFlowDynamicModels(() => ProfilDogComponentModel());
    navbarComponentModel = createModel(context, () => NavbarComponentModel());
  }

  @override
  void dispose() {
    profilDogComponentModels1.dispose();
    friendsCompoenntModels.dispose();
    noRewardsComponentModel.dispose();
    noStatsComponentModel.dispose();
    profilDogComponentModels2.dispose();
    navbarComponentModel.dispose();
  }
}
