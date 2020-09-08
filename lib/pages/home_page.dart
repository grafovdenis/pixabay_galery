import 'package:flutter/material.dart';
import 'package:pixabay_galery/widgets/dropdown_widget.dart';
import 'package:pixabay_galery/widgets/photos_widget.dart';

import '../blocs/bloc_provider.dart';
import '../blocs/photos_bloc.dart';
import '../models/photo.dart';
import '../models/photos_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<PhotosBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Pixabay galery"),
        actions: [
          DropdownWidget(),
        ],
      ),
      body: StreamBuilder<PhotosState>(
        stream: bloc.state,
        initialData: PhotosLoadingState(),
        builder: (context, snapshot) {
          final state = snapshot.data;
          if (state is PhotosLoadedState) {
            return PhotosWidget(photos: state.photos, page: state.page);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
