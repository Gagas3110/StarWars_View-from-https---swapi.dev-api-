class SpesiesEvent {}

class SetupSpesiesEvent extends SpesiesEvent {}

class SpesiesLoadMore extends SpesiesEvent {
  final int paging;

  SpesiesLoadMore(this.paging);
}

