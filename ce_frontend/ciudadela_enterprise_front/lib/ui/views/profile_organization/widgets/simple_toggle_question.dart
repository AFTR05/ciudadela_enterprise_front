import 'package:ciudadela_enterprise_front/ui/buttons/custom_toggle_buttom.dart';
import 'package:ciudadela_enterprise_front/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class SimpleToggleQuestion extends StatelessWidget {
  const SimpleToggleQuestion({
    super.key, 
    required this.question, 
    required this.yesFunction, 
    required this.noFunction, 
    required this.optionController, 
    this.extendedAnswer, 
    this.extendedQuestion = const Center()
    }
  );

  final String question;
  final Function yesFunction;
  final Function noFunction;
  final bool? optionController;
  final bool? extendedAnswer;
  final Widget extendedQuestion;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(
        vertical: 10
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 22
      ),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(55, 57, 63,1),
        borderRadius: BorderRadius.circular(24.0),
      ),
      alignment: Alignment.center,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 384
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                question,
                style: CustomLabels.whiteW300Size16,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              )
              ,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomToggleButton(
                    horizontalPadding: 50,
                    verticalPadding: 10,
                    onPressed: yesFunction, 
                    text: "Si", 
                    isEnabled: optionController ?? false
                  ),
                  const SizedBox(
                    width: 20,
                  )
                  ,
                  CustomToggleButton(
                    horizontalPadding: 50,                    
                    verticalPadding: 10,
                    onPressed: noFunction, 
                    text: "No", 
                    isEnabled: optionController == null ? false : (!optionController!)
                  )
                ],
              ),
              optionController == extendedAnswer
                                  ? extendedQuestion
                                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}