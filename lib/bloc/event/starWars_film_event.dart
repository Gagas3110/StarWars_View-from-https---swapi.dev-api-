

class FilmEvent{}

class SetupFilmEvent extends FilmEvent {

}

class FilmLoadMore extends FilmEvent {
  
}

class GetUrlPlanet extends FilmEvent {
  final String url;

  GetUrlPlanet(this.url);
  
}

class GetUrlCharacter extends FilmEvent {
  final String url;

  GetUrlCharacter(this.url);
  
}

class GetUrlStarships extends FilmEvent {
  final String url;

  GetUrlStarships(this.url);
  
}

class GetUrlVehicle extends FilmEvent {
  final String url;

  GetUrlVehicle(this.url);
  
}

class GetUrlSpesies extends FilmEvent {
  final String url;

  GetUrlSpesies(this.url);
  
}

class GetUrlFilm extends FilmEvent {
  final String url;

  GetUrlFilm(this.url);
  
}
