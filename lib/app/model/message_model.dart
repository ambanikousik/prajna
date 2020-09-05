import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:prajna/common/data/data.dart';
class MessageModel extends Equatable {
final  String from;
 final  String msg;
final  DateTime time;

  MessageModel({
   @required this.from,
   @required this.msg,
   @required this.time,
  });

  @override
  List<Object> get props => [ from, msg, time];



factory MessageModel.fromData(DocumentSnapshot snapshot) => MessageModel(
    from : snapshot.data()['from'],
    msg : snapshot.data()['msg'],
    time : CommonDateHandler.toDate(timestamp:snapshot.data()['time']),
);



  Map<String, dynamic> toData() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from'] = this.from;
    data['msg'] = this.msg;
    data['time'] = CommonDateHandler.toTimeStamp(dateTime: DateTime.now());
    return data;
  }

  static List<MessageModel> listFromSnapshot(List<DocumentSnapshot> data) {
    List<MessageModel> _list = [];
    if (data != null) {
      data.forEach((d) {
        _list.add(MessageModel.fromData(d));
      });
    }
    return _list;
  }

}
