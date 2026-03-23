import 'package:flutter_application_1/module/domain/entities/song.dart';

abstract class MusicState {}

class MusicInitial extends MusicState {}

class MusicLoading extends MusicState {}

class MusicLoaded extends MusicState {
  final List<Song> recommendedSongs;
  final List<Song> playlistSongs;
  // các trường mới cho trình phát nhạc
  final Song? currentSong;
  final bool isPlaying;
  final Duration currentPosition;
  final Duration totalDuration;

  MusicLoaded({
    required this.recommendedSongs,
    required this.playlistSongs,
    this.currentSong,
    this.isPlaying = false,
    this.currentPosition = Duration.zero,
    this.totalDuration = Duration.zero,
  });
  MusicLoaded copyWith({
    List<Song>? recommendedSongs,
    List<Song>? playlistSongs,
    Song? currentSong,
    bool? isPlaying,
    Duration? currentPosition,
    Duration? totalDuration,
  }) {
    return MusicLoaded(
      recommendedSongs: recommendedSongs ?? this.recommendedSongs,
      playlistSongs: playlistSongs ?? this.playlistSongs,
      currentSong: currentSong ?? this.currentSong,
      isPlaying: isPlaying ?? this.isPlaying,
      currentPosition: currentPosition ?? this.currentPosition,
      totalDuration: totalDuration ?? this.totalDuration,
    );
  }
}

class MusicError extends MusicState {
  final String message;
  MusicError(this.message);
}
