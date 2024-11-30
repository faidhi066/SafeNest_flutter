import 'package:flutter/material.dart';

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({super.key});

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, String>> _messages =
      []; // Stores messages with user info

  void _sendMessage(String text) {
    if (text.isNotEmpty) {
      setState(() {
        _messages.add({'user': 'You', 'message': text});
      });
      _messageController.clear();
      _simulateReply(); // Simulates a chatbot reply
    }
  }

  void _simulateReply() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _messages
            .add({'user': 'Bot', 'message': 'This is an automated reply!'});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chatbot'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true, // Start from the bottom (latest messages first)
              padding: const EdgeInsets.all(10),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[_messages.length - 1 - index];
                final isUser = message['user'] == 'You';

                return Align(
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUser
                          ? Colors.blue[100]
                          : Colors.grey[300], // Different colors for user/bot
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${message['user']}: ${message['message']}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1), // Divider above the input field
          Padding(
            padding: const EdgeInsets.only(bottom: 27), // Add padding at bottom
            child: _buildInputField(),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      color: Colors.grey[200],
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                hintText: 'Type your message...',
                border: InputBorder.none,
              ),
              onSubmitted: _sendMessage,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.blue),
            onPressed: () => _sendMessage(_messageController.text),
          ),
        ],
      ),
    );
  }
}
