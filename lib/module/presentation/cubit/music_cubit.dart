import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_application_1/module/domain/entities/song.dart';
import 'package:flutter_application_1/module/domain/usecases/usecase_get_music.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'music_state.dart';

class MusicCubit extends Cubit<MusicState> {
  final GetMusicUseCase getMusicUseCase;
  final AudioPlayer _audioPlayer = AudioPlayer();

  MusicCubit({required this.getMusicUseCase}) : super(MusicInitial()) {
    _audioPlayer.onPositionChanged.listen((pos) {
      if (state is MusicLoaded) {
        emit((state as MusicLoaded).copyWith(currentPosition: pos));
      }
    });
    _audioPlayer.onDurationChanged.listen((dur) {
      if (state is MusicLoaded) {
        emit((state as MusicLoaded).copyWith(totalDuration: dur));
      }
    });
    _audioPlayer.onPlayerComplete.listen((event) {
      if (state is MusicLoaded) {
        emit(
          (state as MusicLoaded).copyWith(
            isPlaying: false,
            currentPosition: Duration.zero,
          ),
        );
      }
    });
  }

  Future<void> loadMusicData() async {
    emit(MusicLoading());
    try {
      final recommended = await getMusicUseCase.executeRecommended();
      final playlist = await getMusicUseCase.executePlaylist();

      emit(MusicLoaded(recommendedSongs: recommended, playlistSongs: playlist));
    } catch (e) {
      emit(MusicError('Lỗi tải dữ liệu: $e'));
    }
  }

  Future<void> playMusic(Song song) async {
    if (state is MusicLoaded) {
      await _audioPlayer.play(AssetSource(song.audioUrl));
      emit((state as MusicLoaded).copyWith(currentSong: song, isPlaying: true));
    }
  }

  Future<void> PauseOrResume() async {
    if (state is MusicLoaded) {
      final currentState = state as MusicLoaded;
      if (currentState.isPlaying) {
        await _audioPlayer.pause();
        emit(currentState.copyWith(isPlaying: false));
      } else if (currentState.currentSong != null) {
        await _audioPlayer.resume();
        emit(currentState.copyWith(isPlaying: true));
      }
    }
  }

  Future<void> seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  @override
  Future<void> close() {
    _audioPlayer.dispose();
    return super.close();
  }
}
