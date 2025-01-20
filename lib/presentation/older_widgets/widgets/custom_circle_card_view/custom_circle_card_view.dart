import 'package:flutter/material.dart';
import 'package:itax/presentation/older_widgets/widgets/text_view/text_view.dart';

class CustomCircleCardView extends StatefulWidget{
  const CustomCircleCardView({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CustomCircleCardViewState();
  }
}

class CustomCircleCardViewState extends State<CustomCircleCardView>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(30)
      ),
       child: Row(
         children: [
           const Icon(Icons.verified_user),
           const SizedBox(
             height: 20,
           ),
           TextView(text: 'GST',textStyle: Theme.of(context).textTheme.bodyMedium,)
         ],
       ),
    );
  }
}