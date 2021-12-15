import 'package:awsl/blocs/photo_list/photo_list_bloc.dart';
import 'package:awsl/blocs/photo_list/photo_list_event.dart';
import 'package:awsl/blocs/photo_list/photo_list_state.dart';
import 'package:awsl/components/base_widget_state.dart';
import 'package:awsl/components/grid_view_cell/photo_grid_view_cell.dart';
import 'package:awsl/models/producer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PhotoListScreen extends StatefulWidget {
  const PhotoListScreen({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<StatefulWidget> createState() => _PhotoListScreenState();
}

class _PhotoListScreenState extends BaseWidgetState<PhotoListScreen> {
  final EasyRefreshController _easyRefreshController = EasyRefreshController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // BuildAnimation
    _buildAnimation();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return BlocProvider(
      create: (BuildContext context) {
        Producer producer = Producer();
        producer.uid = '6421601178';
        producer.name = '写真博主';

        PhotoListEvent event = PhotoListProducerUidChanged(producer: producer);
        return PhotoListBloc()..add(event);
      },
      child: CupertinoPageScaffold(
        child: SafeArea(child: BlocBuilder<PhotoListBloc, PhotoListState>(
          builder: (context, state) {
            if (state is PhotoListStateLoadSuccess) {
              _easyRefreshController.finishRefresh(success: true);
              _easyRefreshController.finishLoad(success: true);
            } else if (state is PhotoListStateLoadFailure) {
              _easyRefreshController.finishRefresh(success: false);
              _easyRefreshController.finishLoad(success: false);
            }

            return Column(
              children: [_renderPhotoListView(context, state)],
            );
          },
        )),
      ),
    );
  }

  Widget _renderPhotoListView(BuildContext context, PhotoListState state) {
    return Container(
        child: Expanded(
            child: EasyRefresh(
                controller: _easyRefreshController,
                enableControlFinishRefresh: true,
                enableControlFinishLoad: true,
                onRefresh: () async {},
                onLoad: () async {},
                child: StaggeredGridView.countBuilder(
                    controller: _scrollController,
                    crossAxisCount: 2,
                    itemCount: state.photos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTapUp: (TapUpDetails details) {},
                        child: PhotoGridViewCell(
                          photo: state.photos[index],
                        ),
                      );
                    },
                    staggeredTileBuilder: (int index) =>
                        StaggeredTile.count(index % 4 == 0 || index % 4 == 3 ? 2 : 1, 1.5)
                )
        )
      )
    );
  }

  void _buildAnimation() {}

  void _animate(dynamic state) {}
}
