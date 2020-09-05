part of '../presentation.dart';

class VerticalPlaceItem extends StatelessWidget {
  final PostModel post;

  VerticalPlaceItem({this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 15.0),
      child: InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: height*30,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage( post.photo,),
                  fit: BoxFit.cover,
                )
              ),
            ),
            SizedBox(width: 15.0),
            Text(
              post.title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: width*6,
              ),
              textAlign: TextAlign.left,
            ),
            Container(
              height: height*10,
              alignment: Alignment.topLeft,
              child: Text(
                post.description,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                ),
                maxLines: 3,
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        onTap: () {
          context.bloc<AppCubit>().detailsPage(postModel: post);
        },
      ),
    );
  }
}
