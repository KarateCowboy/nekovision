import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'invidious/video_info_provider.dart';
import 'invidious/video_info.dart';
const smidget_freestyle_video_id = 'crEz8i6oVpI';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nekovision',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  Widget currentPage = const SizedBox();
  final TextEditingController _searchController = TextEditingController();

  void _setCurrentPage() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    ref.listenManual(videoInfoProvider(smidget_freestyle_video_id), (previous, current) {});
  }

  void _executeSearch(String query) {
    print('Executing search with query: $query');
    // You may want to call setState or other state management solution
    // to update your UI based on the search results.
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<VideoInfo> video_info =
        ref.watch(videoInfoProvider(smidget_freestyle_video_id));

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text("blarg title"),
            actions: <Widget>[
              Padding(padding: EdgeInsets.all(10.0), child: Icon(Icons.menu)),
              Expanded(
                child: TextField(
                  controller: _searchController,
                  onSubmitted: (String value) {
                    _executeSearch(value);
                  },
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        _executeSearch(_searchController.text);
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                    fillColor: Colors
                        .white24, // You can change this to match your app design
                  ),
                  // Add the rest of your TextField customization (like the controller, onChanged, etc.)
                ),
              ),
            ]),
        body: SizedBox(
          child:
          video_info.when(
            data: (value) => Center(child: Text('Data loaded ${ value.title}')),
            error: (error, stack) => Text('Oops, there was an error: $error'),
            loading: () => CircularProgressIndicator(),
          ),
        ),
        drawer: Drawer(
            child: Container(
          color: Colors.black,
          child: const SideBar(),
        )));
  }
}

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const MenuButton(icon: Icons.abc, title: 'Nekovision'),
      MenuButton(
          icon: Icons.subscriptions,
          title: 'Subscriptions',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SubscriptionsPage()),
            );
          }),
      const MenuButton(icon: Icons.menu, title: 'Channels'),
      const MenuButton(icon: Icons.trending_up, title: 'Trending'),
      const MenuButton(icon: Icons.star, title: 'Most Popular'),
      const MenuButton(icon: Icons.playlist_play, title: 'Playlists'),
      const MenuButton(icon: Icons.history, title: 'History'),
      const MenuButton(icon: Icons.settings, title: 'Settings'),
      const MenuButton(icon: Icons.info, title: 'About'),
    ]);
  }
}

class MenuButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const MenuButton(
      {super.key, required this.icon, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(icon, color: Colors.grey[300]),
        title: Text(title, style: TextStyle(color: Colors.grey[300])),
        onTap: onTap);
  }
}

class SubscriptionsPage extends StatelessWidget {
  const SubscriptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscriptions'),
      ),
      body: const Center(
        child: Text('Welcome to the Subscriptions page!'),
      ),
    );
  }
}

// Define a function that returns a configured ListTile for a YouTube search result.
Widget searchItemListTile({
  required String thumbnailUrl,
  required String title,
  required String channel,
  required String viewCount,
  required String timestamp,
  required String additionalInfo,
  required VoidCallback onTap,
}) {
  return ListTile(
    leading: Image.network(thumbnailUrl, width: 100.0),
    title: Text(title),
    subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$viewCount • $timestamp'),
        Text(channel),
        Text(additionalInfo)
      ],
    ),
    onTap: onTap,
  );
}

// Usage example:
// var item = searchItemListTile(
//   thumbnailUrl: 'URL_of_Thumbnail',
//   title: 'Smidget freestyling Dont Bother Me 2014',
//   channel: 'katkoneko',
//   viewCount: '2.7M views',
//   timestamp: '9 years ago',
//   additionalInfo: 'He still got it! At PMX Expo.',
//   onTap: () {
//     // Handle the tap
//   },
// );
