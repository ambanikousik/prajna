part of 'presentation.dart';



class DashBoardPage extends StatelessWidget{
  final List<String> dailyPsychology;
  final List<PostModel> postModels;

  DashBoardPage({@required this.dailyPsychology,@required this.postModels});
  bool _isStranger = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          icon: Icon(Icons.logout,color: C.primaryTextWhite,),
          onPressed: (){
            context.bloc<AuthCubit>().logout();
          },
        ),
        title: 'Prajna',
      ),
      body: SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Daily Psychology",
            style: TextStyle(
              fontSize: width*6,
              fontWeight: FontWeight.bold
            ),
            ),
        Container(
        padding: EdgeInsets.only(top: height*2, left: 20.0),
        height: 250.0,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          primary: false,
          itemCount: dailyPsychology == null ? 0.0 : dailyPsychology.length,
          itemBuilder: (BuildContext context, int index) {
            return HorizontalPlaceItem(imgLink: dailyPsychology[index]);
          },
        ),
      ),
            SearchBar(),
            CustomSwitch(
              title: "Turn on Stranger mode",
              isEnabled: _isStranger,
              onChange: (x) {
                _isStranger = x;
              },
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: ListView.builder(
                primary: false,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: postModels == null ? 0 : postModels.length,
                itemBuilder: (BuildContext context, int index) {
                  return VerticalPlaceItem(post: postModels[index]);
                },
              ),
            )

          ],
        )
      ),
      floatingActionButton:  FloatingActionButton.extended(
          onPressed: (){
            context.bloc<AppCubit>().getChatEvent();
          },
          backgroundColor: C.multiColor_3,
          icon: Icon(Icons.medical_services_sharp),
          label: Text("Talk to doctor"),
        )
    );
  }


}