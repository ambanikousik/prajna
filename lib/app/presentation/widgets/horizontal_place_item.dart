part of '../presentation.dart';


class HorizontalPlaceItem extends StatelessWidget {
  final String imgLink;

  HorizontalPlaceItem({this.imgLink});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: InkWell(
        child: Container(
          height: 250.0,
          width: 140.0,
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imgLink,
                  height: 178.0,
                  width: 140.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 7.0),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Daily psychology",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 3.0),
            ],
          ),
        ),
        onTap: () {
          context.bloc<AppCubit>().dailyPsychology();
        },
      ),
    );
  }
}
