part of 'message_cubit.dart';

abstract class MessageState extends Equatable {
  const MessageState();
}

class MessageInitial extends MessageState {
  @override
  List<Object?> get props => [];
}

class MessageLoading extends MessageState {
  @override
  List<Object?> get props => [];
}

class MessageFetched extends MessageState {
  final List<MessageModel> messageModel;

  const MessageFetched(this.messageModel);
  @override
  List<Object?> get props => [messageModel];
}

class MessageError extends MessageState {
  final String message;

  const MessageError(this.message);
  @override
  List<Object?> get props => [message];
}
