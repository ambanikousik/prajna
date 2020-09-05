part of'../presentation.dart';

class MessageTile extends StatelessWidget {
  final MessageModel messageModel;
  final bool isMine;
  MessageTile({@required this.messageModel,@required this.isMine});

  
  @override
  Widget build(BuildContext context) {
    return isMine?
    myMsgTile( messageModel.time,  messageModel.msg):
    otherMsgTile(messageModel.from, messageModel.time, messageModel.msg);
  }
  Widget otherMsgTile(String name,DateTime timestamp,String message){
    return Row(
      children: [
        CircleAvatar(
          radius: width*5,
          backgroundColor: C.primaryBlue,
          foregroundColor: Colors.white,
          child: Text(name.substring(0, 2).toUpperCase(),
            style: TextStyle(
                fontSize: width*5,
                color: C.primaryTextWhite,
                fontWeight: FontWeight.w800
            ),
          ),
        ),
        SizedBox(width: width*4,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
              style: TextStyle(
                  color: C.primaryTextBlue,
                  fontSize: width*4,
                  fontWeight: FontWeight.w700
              ),),
            Container(
              margin: EdgeInsets.symmetric(vertical: height/2),
              constraints: BoxConstraints(
                maxWidth: width*60,
              ),
              padding: EdgeInsets.all(width*3),
              decoration: BoxDecoration(
                color: C.primaryBlue.withOpacity(0.1),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Text(message,
                style: TextStyle(
                    color: C.primaryTextBlack,
                    fontSize: width*4,
                ),),
            )
          ],
        ),
        SizedBox(width: width*4,),
        Text(CommonDateHandler.formattedDateToString(timestamp,DateTimeMode.DATETIME),
        style: TextStyle(
          color: C.primaryTextGray,
          fontSize: width*3,
        ),),
      ],
    );
  }
  Widget myMsgTile(DateTime timestamp,String message){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(CommonDateHandler.formattedDateToString(timestamp, DateTimeMode.DATETIME),
          style: TextStyle(
              color: C.primaryTextGray,
              fontSize: width*3,
          ),),
        SizedBox(width: width*4,),
        Container(
          margin: EdgeInsets.symmetric(vertical: height/2),
          constraints: BoxConstraints(
            maxWidth: width*60,
          ),
          padding: EdgeInsets.all(width*3),
          decoration: BoxDecoration(
            color: C.primaryBlue,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
              topLeft: Radius.circular(25),
            ),
          ),
          child: Text(message,
//              overflow: TextOverflow.fade,
            style: TextStyle(
              color: C.primaryTextWhite,
              fontSize: width*4,
            ),),
        ),
        SizedBox(width: width*4,),
      ],
    );
  }

}



