import '../entities/banner.dart';

abstract class BannersRepository {
  Stream<List<Banner>> watchBanners();
}
