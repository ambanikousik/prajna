part of 'presentation.dart';

class ChatPage extends StatefulWidget {
  final List<MessageModel> msgList;
  ChatPage({@required this.msgList});
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _messageController = TextEditingController();
  final ScrollController _controller = ScrollController();

  bool valid = true;

  void listToDown() {
    _controller.animateTo(
      _controller.position.maxScrollExtent,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void initState() {
    Future.delayed(Duration(microseconds: 100), () {
      listToDown();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Doctor is here',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  controller: _controller,
                  itemCount: widget.msgList.length,
                  padding: EdgeInsets.all(10.0),
                  itemBuilder: (context, index) {
                    return MessageTile(
                        messageModel: widget.msgList[index], isMine: true);
                  })),
          Container(
            margin: EdgeInsets.all(width * 4),
            height: 61,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35.0),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 3),
                            blurRadius: 5,
                            color: Colors.grey)
                      ],
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.photo_camera),
                          color: C.primaryBlue,
                          onPressed: () {},
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _messageController,
                            decoration: InputDecoration(
                                hintText: "Type Something...",
                                border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  child: InkWell(
                    child: Icon(
                      Icons.send,
                      size: width * 8,
                      color: C.primaryBlue,
                    ),
                    onTap: () {
                      if (_messageController.text.isNotEmpty) {
                        MessageModel msg = MessageModel(
                          from: "Kousik",
                          msg: _messageController.text,
                          time: DateTime.now(),
                        );
                        context.bloc<AppCubit>().sendMsg(messageModel: msg);

                        _messageController.text = "";
                        listToDown();
                      }
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _controller.dispose();
    _messageController.dispose();
    super.dispose();
  }
}
