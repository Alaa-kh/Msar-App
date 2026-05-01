import '../entities/banner.dart';
import '../repositories/banners_repository.dart';

class WatchBannersUseCase {
  const WatchBannersUseCase(this._repository);

  final BannersRepository _repository;

  Stream<List<Banner>> call() => _repository.watchBanners();
}
