part of 'presentation.dart';

class DailyPsychologyPage extends StatefulWidget {
 final List<String>  imageLinks;

 DailyPsychologyPage({@required this.imageLinks});

  @override
  _DailyPsychologyPageState createState() => _DailyPsychologyPageState();
}

class _DailyPsychologyPageState extends State<DailyPsychologyPage> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryView(
        storyItems:
        widget.imageLinks.asMap().map((index, imageLink) => MapEntry(index,  StoryItem.pageImage(
          url:
          imageLink,
          caption: "Daily Psychology ${index+1}",
          controller: storyController,
        ))).values.toList(),
        onStoryShow: (s) {
          print("Showing a story");
        },
        onComplete: () {
          context.bloc<AppCubit>().dashboard();
        },
        progressPosition: ProgressPosition.top,
        repeat: false,
        controller: storyController,
      ),
    );
  }
}