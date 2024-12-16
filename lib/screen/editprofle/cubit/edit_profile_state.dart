part of 'edit_profile_cubit.dart';

@immutable
sealed class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}
final class EditProfileLoading extends EditProfileState {}
final class EditProfileSucces extends EditProfileState {}
final class EditProfileWrong extends EditProfileState {}
final class EditProfileError extends EditProfileState {}