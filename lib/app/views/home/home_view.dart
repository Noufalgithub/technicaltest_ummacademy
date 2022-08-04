import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:technicaltest_ummacademy/app/providers/auth/auth_state.dart';
import 'package:technicaltest_ummacademy/app/providers/home/home_state.dart';
import 'package:technicaltest_ummacademy/core/utils/enum.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<HomeState>(context, listen: false).getRefJurusan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Consumer<HomeState>(builder: (context, data, _) {
        if (data.loadingState == LoadingState.loading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (data.loadingState == LoadingState.error) {
          return Center(
            child: Text(data.modelRefJurusan?.message ?? 'Terjadi kesalahan'),
          );
        } else if (data.loadingState == LoadingState.loaded) {
          return SmartRefresher(
            controller: data.refreshController,
            onLoading: data.getRefJurusan,
            onRefresh: () => data.getRefJurusan(initial: true),
            enablePullUp: true,
            enablePullDown: false,
            child: ListView.builder(
              itemCount: data.dataJurusan.length,
              itemBuilder: (context, i) => Card(
                color: Colors.white,
                child: ListTile(
                  title: Text(data.dataJurusan[i].nmJurusan ?? '-'),
                ),
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      }),
    );
  }

  /// AppBar
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Jurusan'),
      actions: [
        IconButton(
            onPressed: () {
              Provider.of<AuthState>(context, listen: false).postLogout();
            },
            icon: const Icon(Icons.logout),
            tooltip: 'Logout'),
        const SizedBox(
          width: 3,
        )
      ],
    );
  }
}
