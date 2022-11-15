import 'package:Star_Wars/bloc/event/spesies_event.dart';
import 'package:Star_Wars/bloc/state/spesies_state.dart';
import 'package:Star_Wars/model/new_model/spesies_model.dart';
import 'package:Star_Wars/service/rest_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SpesiesBloc extends Bloc<SpesiesEvent, SpesiesState> {
  StarWars result = StarWars();
  List<Results> zz = [];
  RestApi api = new RestApi();
  Map<String, dynamic>? reshygult;
  SpesiesBloc() : super(SpesiesInitial()) {
    on<SpesiesEvent>((event, emit) async {
      try {
        emit(SetupSpesiesProgress());
        if (event is SetupSpesiesEvent) {
          result = await searchData();
          emit(SetupSpesiesComplete(result));
        } else if (event is SpesiesLoadMore) {
          emit(SpesiesLoadMoreProgress());
          int? url;

          url = event.paging;
          result.results = await searchDataPage(url);
          emit(SpesiesLoadMoreComplete(result));
        }
      } catch (e) {
        emit(SpesiesFailedShow(e.toString()));
      }
    });
  }

  searchData() async {
    StarWars result1 = StarWars();
    result1 = await api.getSpesies();

    return result1;
  }

  searchDataPage(int url) async {
    List tempList = [];
    tempList = await api.getSpesiesTestNext(url);

    List<Results> temp =
        tempList.map((itemWord) => Results.fromJson(itemWord)).toList();

    return temp;
  }
}
