import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      MenuButton(icon: Icons.subscriptions, title: 'Subscriptions',
        onTap: () {
          Navigator.push(
                context,
          MaterialPageRoute(builder: (context) => SubscriptionsPage()),
         );

	}),
      MenuButton(icon: Icons.menu, title: 'Channels'),
      MenuButton(icon: Icons.trending_up, title: 'Trending'),
      MenuButton(icon: Icons.star, title: 'Most Popular'),
      MenuButton(icon: Icons.playlist_play, title: 'Playlists'),
      MenuButton(icon: Icons.history, title: 'History'),
      MenuButton(icon: Icons.settings, title: 'Settings'),
      MenuButton(icon: Icons.info, title: 'About'),
    ]);
  }
}
class MenuButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;


  const MenuButton({
    Key? key,
    required this.icon,
    required this.title,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[300]),
      title: Text(title, style: TextStyle(color: Colors.grey[300])),
      onTap: onTap);
  }
}
class SubscriptionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscriptions'),
      ),
      body: Center(
        child: Text('Welcome to the Subscriptions page!'),
      ),
    );
  }
}
