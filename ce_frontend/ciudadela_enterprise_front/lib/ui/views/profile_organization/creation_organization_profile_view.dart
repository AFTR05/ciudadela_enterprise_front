import 'package:ciudadela_enterprise_front/providers/profile_organization_provider/stage_view_provider.dart';
import 'package:ciudadela_enterprise_front/router/router.dart';
import 'package:ciudadela_enterprise_front/ui/buttons/custom_navigation_button.dart';
import 'package:ciudadela_enterprise_front/ui/labels/custom_labels.dart';
import 'package:ciudadela_enterprise_front/ui/views/profile_organization/widgets/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreationOrganizationProfileView extends StatelessWidget {
  const CreationOrganizationProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      
      create: (_) => StageViewProvider(),
      child: Builder(
          builder: (context){
            final size = MediaQuery.of(context).size;
            final stageViewProvider = Provider.of<StageViewProvider>(context);
            return Container(
              width: size.width,
              margin: const EdgeInsets.only(bottom: 80,top: 30),
              padding: const EdgeInsets.symmetric( horizontal: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FittedBox(
                        fit: BoxFit.contain,
                        child: CustomNavigationButton(
                          onPressed: (){
                            stageViewProvider.currentStage == 1
                              ? Navigator.pushNamed(context, Flurorouter.organizationProfileRoute)
                              : stageViewProvider.currentStage == 4
                                ? stageViewProvider.currentStage-=1
                                :{
                                    stageViewProvider.currentStage-=1,
                                    stageViewProvider.progress-=1/3,
                                    stageViewProvider.updateWidgetsState()
                                };
                            }, 
                          text: 'Volver',
                          verticalPadding: 10,
                          horizontalPadding: 5
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.contain,
                        child: CustomNavigationButton(
                          onPressed: (){
                            Navigator.pushNamed(context, Flurorouter.loginRoute);
                          }, 
                          text: 'Salir',
                          verticalPadding: 10,
                          horizontalPadding: 5
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: size.height*0.06),
                  Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 384
                      ),
                      child: Column(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: [
                          FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              'Perfil Básico Organizacional',
                              style: GoogleFonts.ubuntu(
                              fontSize: 32,
                              color: Colors.white,
                              fontWeight: FontWeight.w500
                              )
                            ),
                          ),
                          const SizedBox(height: 20),
                          FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              'Componente ${stageViewProvider.currentStage>3?3:stageViewProvider.currentStage} de 3',
                              style: CustomLabels.subtitle20W200White
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              stageViewProvider.getCurrentDescription(),
                              style: CustomLabels.title32W400White
                            ),
                          ),
                          const SizedBox(height: 20),
                          ProgressBar(progress: stageViewProvider.progress),
                          stageViewProvider.getOrganizationProfileContent()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        ),
    );
  }
}