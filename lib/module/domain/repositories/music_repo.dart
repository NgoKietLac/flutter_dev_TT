import '../entities/song.dart';

abstract class IMusicRepository {
  Future<List<Song>> getRecommendedSongs();
  Future<List<Song>> getPlaylistSongs();
}
