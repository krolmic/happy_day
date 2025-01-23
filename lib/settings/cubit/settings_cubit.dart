import 'dart:async';

import 'package:email_repository/email_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_cubit.freezed.dart';
part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({
    required EmailRepository emailRepository,
  })  : _emailRepository = emailRepository,
        super(const SettingsState());

  final EmailRepository _emailRepository;

  Future<void> sendEmail({
    required String recipient,
    required String subject,
    required String body,
  }) async {
    try {
      emit(
        state.copyWith(
          sendEmailState: const SendEmailState.loading(),
        ),
      );

      await _emailRepository.sendEmail(
        recipient: recipient,
        subject: subject,
        body: body,
      );

      emit(
        state.copyWith(
          sendEmailState: const SendEmailState.success(),
        ),
      );
    } catch (e, stackTrace) {
      Fimber.e('Sending email failed', ex: e, stacktrace: stackTrace);

      emit(
        state.copyWith(
          sendEmailState: const SendEmailState.failure(),
        ),
      );
    }
  }
}
