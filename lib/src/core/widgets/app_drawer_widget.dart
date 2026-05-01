import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:msar/src/core/constants/app_colors.dart';
import 'package:msar/src/core/constants/app_icons.dart';
import 'package:msar/src/core/constants/app_images.dart';
import 'package:msar/src/core/di/service_locator.dart';
import 'package:msar/src/core/widgets/app_button.dart';
import 'package:msar/src/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:msar/src/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:msar/src/features/profile/presentation/cubit/profile_state.dart';
import 'package:svg_flutter/svg.dart';

class AppDrawerWidget extends StatelessWidget {
  const AppDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ProfileCubit>()..watchCurrentUser(),
      child: Drawer(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              ClipPath(
                clipper: DrawerClipper(),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 50, bottom: 30),
                  color: AppColors.primary,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: GestureDetector(
                            onTap: () => context.pop(),
                            child: const Icon(Icons.close, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Image.asset(AppImages.logo, width: 180),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileLoaded) {
                    return Column(
                      children: [
                        _DrawerInfoTile(
                          icon: Icons.person,
                          title: state.user.name,
                        ),
                        _DrawerInfoTile(
                          icon: Icons.phone,
                          title: state.user.phone,
                        ),
                        _DrawerInfoTile(
                          icon: Icons.email,
                          title: state.user.email,
                        ),
                      ],
                    );
                  }

                  if (state is ProfileFailure) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        state.message,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.red),
                      ),
                    );
                  }

                  return const Padding(
                    padding: EdgeInsets.all(20),
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ListTile(
                  leading: Icon(Icons.logout, color: AppColors.red),
                  title: Text(
                    'تسجيل الخروج',
                    style: TextStyle(
                      color: AppColors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    _showLogoutSheet(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutSheet(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,
      backgroundColor: Colors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
      ),
      isScrollControlled: true,
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(sheetContext).viewInsets.bottom,
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(sheetContext),
                    ),
                  ),
                  SvgPicture.asset(AppIcons.logout),
                  const SizedBox(height: 27),
                  Text(
                    'تسجيل الخروج',
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.primaryDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'هل أنت متأكد من رغبتك في تسجيل الخروج؟',
                    style: TextStyle(color: AppColors.grey),
                  ),
                  const SizedBox(height: 16),
                  AppButton(
                    title: 'تأكيد الخروج',
                    backgroundColor: AppColors.red,
                    onPressed: () async {
                      final router = GoRouter.of(sheetContext);
                      Navigator.pop(sheetContext);

                      await sl<SignOutUseCase>().call();

                      router.go('/login');
                    },
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () => Navigator.pop(sheetContext),
                    child: Text(
                      'إلغاء',
                      style: TextStyle(color: AppColors.grey),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _DrawerInfoTile extends StatelessWidget {
  const _DrawerInfoTile({required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(
        title.isEmpty ? 'غير متوفر' : title,
        style: TextStyle(
          color: AppColors.primaryDark,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class DrawerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 40,
    );
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
