import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nawah/core/theme/text_style.dart';
import 'package:nawah/features/chat_screen/data/models/message_model.dart';

import '../screens/screen.dart';

class RecentChats extends StatelessWidget {
  const RecentChats({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 30),
          child: Row(
            children: [
              Text(
                'Recent Chats',
                style: TextStyles.heading2,
              ),
              Spacer(),
              Icon(
                Icons.search,
                color: TextStyles.kPrimaryColor,
              )
            ],
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: recentChats.length,
            itemBuilder: (context, int index) {
              final recentChat = recentChats[index];
              return Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundImage: AssetImage(recentChat.avatar ?? ""),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              CupertinoPageRoute(builder: (context) {
                            return ChatRoom(
                              user: recentChat.sender!,
                            );
                          }));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              recentChat.sender!.name,
                              style: TextStyles.heading2.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              recentChat.text!,
                              style: TextStyles.bodyText1,
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            radius: 8,
                            backgroundColor: TextStyles.kUnreadChatBG,
                            child: Text(
                              recentChat.unreadCount.toString(),
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
                            recentChat.time!,
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
