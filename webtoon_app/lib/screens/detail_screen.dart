import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webtoon_app/models/webtoon_detail_model.dart';
import 'package:webtoon_app/models/webtoon_episode_model.dart';
import 'package:webtoon_app/services/api_service.dart';
import 'package:webtoon_app/widgets/episode_widget.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;
  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;
  late SharedPreferences prefs;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    webtoon = APiService.getToonById(widget.id);
    episodes = APiService.getLatestEpisodesById(widget.id);
    initPrefs();
  }

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final likedToons = prefs.getStringList('likedToons');
    if (likedToons != null) {
      setState(() {
        isLiked = likedToons.contains(widget.id);
      });
    }
    else {
      await prefs.setStringList('likedToons', []);
    }
  }


  onHeartTap() async {
    final likedToons = await prefs.getStringList('likedToons');
    if (likedToons == null) {
      await prefs.setStringList('likedToons', []);
    }
    if (isLiked) {
      likedToons!.remove(widget.id);
    }
    else {
      likedToons!.add(widget.id);
    }
    await prefs.setStringList('likedToons', likedToons);
    setState(() {
      isLiked = !isLiked;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: onHeartTap, 
            icon:isLiked ? Icon(Icons.favorite) : Icon(Icons.favorite_outline_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: widget.id,
                  child: Container(
                    width: 250,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 15,
                          offset:
                              const Offset(10, 10), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Image.network(
                      widget.thumb,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            FutureBuilder(
              future: webtoon,
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data!.about,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "${snapshot.data!.genre} / ${snapshot.data!.age}",
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      
                    ],
                  );
                }
                return const Text("...");
              },
            ),
            const SizedBox(
              height: 25,
            ),
            FutureBuilder(
              future: episodes,
              builder: ((context, snapshot) {
                if(snapshot.hasData) {
                  return Column(
                    children: [
                      for(var episode in snapshot.data!) 
                        Episode(episode: episode, id: widget.id,)
                    ],
                  );
                }
                return Container();
              }
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

