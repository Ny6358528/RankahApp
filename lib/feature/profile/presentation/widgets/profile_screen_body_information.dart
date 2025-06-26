import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rankah/feature/profile/logic/cubit/profile_cubit.dart';
import 'package:rankah/feature/profile/presentation/widgets/profile_change_password.dart';
import 'package:rankah/feature/profile/presentation/widgets/profile_phone.dart';
import 'package:rankah/feature/profile/presentation/widgets/profile_username.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProfileUserName(),
        const Divider(),
        const ProfilePhone(),
        const Divider(),
        
    
        const ProfileChangePassword(),
        
      ],
    );
  }
}
