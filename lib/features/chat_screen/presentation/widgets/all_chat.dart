import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nawah/core/theme/text_style.dart';
import 'package:nawah/features/chat_screen/data/models/message_model.dart';

import '../screens/screen.dart';

class AllChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Text(
                'All Chats',
                style: TextStyles.heading2,
              ),
            ],
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: allChats.length,
            itemBuilder: (context, int index) {
              final allChat = allChats[index];
              return Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundImage: AssetImage(allChat.avatar ?? ""),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              CupertinoPageRoute(builder: (context) {
                            return ChatRoom(user: allChat.sender!);
                          }));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              allChat.sender?.name ?? "",
                              style: TextStyles.heading2.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              allChat.text ?? '',
                              style: TextStyles.bodyText1,
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          allChat.unreadCount == 0
                              ? Icon(
                                  Icons.done_all,
                                  color: TextStyles.bodyTextTime.color,
                                )
                              : CircleAvatar(
                                  radius: 8,
                                  backgroundColor: TextStyles.kUnreadChatBG,
                                  child: Text(
                                    allChat.unreadCount.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            allChat.time!,
                            style: TextStyles.bodyTextTime,
                          )
                        ],
                      ),
                    ],
                  ));
            })
      ],
    );
  }
}
