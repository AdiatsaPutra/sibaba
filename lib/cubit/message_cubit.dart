import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sibaba/models/message_model.dart';
import 'package:sibaba/repositories/api_repository.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  final ApiRepository apiRepository;
  MessageCubit(this.apiRepository) : super(MessageInitial());

  Future<void> getMessage() async {
    try {
      List<MessageModel> messageModel = await apiRepository.getMessages();
      emit(MessageFetched(messageModel));
    } catch (e) {
      emit(MessageError(e.toString()));
    }
  }

  Future<void> deleteMessage(int id) async {
    try {
      await apiRepository.deleteMessage(id);
      List<MessageModel> messageModel = await apiRepository.getMessages();
      emit(MessageFetched(messageModel));
    } catch (e) {
      emit(MessageError(e.toString()));
    }
  }
}
