
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:najme/components/general/main_container.dart';
import 'package:najme/components/reports/parents_follow_up_bar.dart';
import 'package:najme/screens/parents_followUp/advice/advices_data.dart';
import 'package:najme/screens/parents_followUp/advice/message_widget.dart';
import 'package:najme/screens/parents_followUp/advice/question_button.dart';


class AdviceScreen extends StatefulWidget {
  AdviceScreen({ Key? key }) : super(key: key);

  List<MessageBox> messages = [];
  List<QuestionButton> questions = [];

  @override
  State<AdviceScreen> createState() => _AdviceScreenState();
}


class _AdviceScreenState extends State<AdviceScreen> {
  @override 
  void initState() {
    widget.messages.add(
      MessageBox(selfMode: false, text: initialMessage),
    );
    widget.questions.addAll(buildQuestions());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      paddingAll: 0,
      appBar: ParentsFollowUpBar(context: context, profiles: []),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              reverse: true,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: widget.messages
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: widget.questions,
            ),
          )
        ]
      ),
    );
  }


  List<QuestionButton> buildQuestions() {
    List<QuestionButton> list = [];

    advices.forEach((key, value) {
      list.add(
        QuestionButton(
          text: key,
          onTap: () async {
            setState(() {
              widget.questions.removeWhere((element) => element.text == key);
              widget.messages.add(
                MessageBox(selfMode: true, text: key)
              );
              widget.messages.add(
                MessageBox(selfMode: false, text: "...")
              );
            });
            await Future.delayed(Duration(milliseconds: Random().nextInt(3000) + 1000));
            setState(() {
              widget.messages.removeLast();
              widget.messages.add(
                MessageBox(selfMode: false, text: value)
              );
            });
          },
        )
      );
    });

    return list;
  }
}
