import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_patternnbloc/bloc/home_state.dart';
import 'package:flutter_patternnbloc/service/http_service.dart';

import '../model/post_model.dart';

class ListPostCubit extends Cubit<ListPostState> {
  ListPostCubit() : super(ListPostInit());

  void apiPostList() async {
    emit(ListPostLoading());
    final response = await Network.GET(Network.API_LIST, {});
    print(response);
    if(response != null){
      emit(ListPostLoaded(posts: Network.parsePostList(response)));
    } else {
      emit(ListPostError(error: "No date"));
    }
  }

  void apiPostDelete(Post post) async {
    emit(ListPostLoading());
    final response = await Network.DEL(Network.API_DELETE + post.id.toString(), {});
    print(response);
    if(response != null) {
      apiPostList();
    } else {
      emit(ListPostError(error: "delete nomadic"));
    }
  }

}


