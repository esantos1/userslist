import 'package:flutter/material.dart';
import 'package:userslist/models/logradouro.dart';
import 'package:userslist/models/usuario.dart';
import 'package:userslist/widgets/user_avatar.dart';

class UserPage extends StatefulWidget {
  final Usuario usuario;

  const UserPage({Key? key, required this.usuario}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late List<_TabBarModel> tabs;

  @override
  void initState() {
    super.initState();

    tabs = [
      _TabBarModel(title: 'Dados', child: Center(child: Text('Dados'))),
      _TabBarModel(title: 'Endereços', child: mostrarEnderecos()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;

    return Scaffold(
      body: DefaultTabController(
        length: tabs.length,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              expandedHeight: height * 0.4,
              flexibleSpace: FlexibleSpaceBar(
                expandedTitleScale: 1,
                background: widget.usuario.avatar != null
                    ? Image.network(widget.usuario.avatar!, fit: BoxFit.cover)
                    : UserAvatar(),
                title: Text(widget.usuario.nome),
              ),
              pinned: true,
            ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                TabBar(
                  tabs: tabs.map((item) => Tab(text: item.title)).toList(),
                  indicatorColor: Theme.of(context).colorScheme.primary,
                  labelColor: Colors.black45,
                ),
              ),
            ),
          ],
          body: TabBarView(
            children: tabs.map((item) => item.child).toList(),
          ),
        ),
      ),
    );
  }

  Widget mostrarEnderecos() {
    List<Logradouro> logradouro = widget.usuario.logradouro;

    return ListView.separated(
      primary: false,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: logradouro.length,
      itemBuilder: (context, index) {
        final item = logradouro[index];

        return buildEndereco(item);
      },
      separatorBuilder: (context, index) => Divider(),
    );
  }

  Widget buildEndereco(Logradouro item) => ListTile(
        title: Text('${item.endereco}, ${item.numero}'),
        subtitle: Text(
          '${item.bairro} - ${item.cidade}, ${item.estado}',
          style: TextStyle(fontSize: 12.0),
        ),
      );
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(child: _tabBar);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) => false;
}

class _TabBarModel {
  final String title;
  final Widget? icon;
  final Widget child;

  _TabBarModel({required this.title, this.icon, required this.child});
}
