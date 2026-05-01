import '../../domain/entities/banner.dart';
import '../../domain/repositories/banners_repository.dart';
import '../datasources/banners_remote_data_source.dart';

class BannersRepositoryImpl implements BannersRepository {
  const BannersRepositoryImpl(this._remoteDataSource);

  final BannersRemoteDataSource _remoteDataSource;

  @override
  Stream<List<Banner>> watchBanners() {
    return _remoteDataSource.watchBanners();
  }
}
