import 'package:flutter/material.dart';
import 'package:flutter_profile_demo/models/profile_details.dart';

class ProfileDetailsPage extends StatefulWidget {
  static const profileDetailsPageRoute = '/profileDetailsPageRoute';

  final ProfileDetails? profileDetails;

  const ProfileDetailsPage({
    this.profileDetails,
    super.key,
  });

  @override
  State<ProfileDetailsPage> createState() => _ProfileDetailsPageState();
}

class _ProfileDetailsPageState extends State<ProfileDetailsPage> {
  late ProfileDetails? _profileDetails;

  @override
  void initState() {
    super.initState();

    _profileDetails = widget.profileDetails;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container());
  }
}
