import 'package:email_repository/email_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_day/l10n/l10n.dart';
import 'package:happy_day/settings/cubit/settings_cubit.dart';
import 'package:happy_day/shared/toastification.dart';
import 'package:happy_day/shared/widgets/loading_indicator.dart';
import 'package:happy_day/theme/cubit/theme_cubit.dart';
import 'package:wiredash/wiredash.dart';

part 'widgets/contact_support_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingsCubit(
        emailRepository: context.read<EmailRepository>(),
      ),
      child: const SettingsView(),
    );
  }
}

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocListener<SettingsCubit, SettingsState>(
      listenWhen: (previous, current) =>
          previous.sendEmailState != current.sendEmailState,
      listener: (context, state) {
        if (state.sendEmailState.isFailure) {
          showErrorToastification(title: context.l10n.errorMessage);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(l10n.settings),
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: SettingsContent(),
          ),
        ),
      ),
    );
  }
}

class SettingsContent extends StatelessWidget {
  const SettingsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SingleChildScrollView(
      child: Column(
        spacing: 10,
        children: [
          ListTile(
            key: const Key('sendFeedback'),
            title: Text(l10n.sendFeedback),
            trailing: const Icon(Icons.feedback_outlined),
            onTap: () => Wiredash.of(context).show(inheritMaterialTheme: true),
          ),
          const ContactSupportTile(),
          ListTile(
            key: const Key('privacyPolicy'),
            title: Text(l10n.privacyPolicy),
            trailing: const Icon(Icons.description_outlined),
            onTap: () {},
          ),
          ListTile(
            key: const Key('termsOfService'),
            title: Text(l10n.termsOfService),
            trailing: const Icon(Icons.description_outlined),
            onTap: () {},
          ),
          ListTile(
            key: const Key('darkMode'),
            title: Text(l10n.darkMode),
            trailing: Switch(
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: (value) => context.read<ThemeCubit>().toggleTheme(),
            ),
          ),
        ],
      ),
    );
  }
}
