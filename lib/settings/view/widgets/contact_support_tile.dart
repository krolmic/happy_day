part of '../settings_page.dart';

class ContactSupportTile extends StatelessWidget {
  const ContactSupportTile({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<SettingsCubit>();
    final sendEmailState = context.select(
      (SettingsCubit cubit) => cubit.state.sendEmailState,
    );

    return ListTile(
      key: const Key('contactSupport'),
      title: Text(l10n.contactSupport),
      trailing: sendEmailState.maybeWhen(
        loading: LoadingIndicator.small,
        orElse: () => const Icon(Icons.mail_outlined),
      ),
      onTap: () => cubit.sendEmail(
        recipient: 'hello@krolmic.dev',
        subject: 'Support - Happy',
        body: '',
      ),
    );
  }
}
