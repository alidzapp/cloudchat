var ready = function() {

	$('.start-conversation').click(function(e){
		e.preventDefault();

		var sender_id = $(this).data('sid');
		var recipient_id = $(this).data('rip');

		$.post("/conversations", { sender_id: sender_id, recipient_id: recipient_id}, function(data){
			chatBox.chatWith(data.conversation_id);
		});
	});

	// minimize chat box
	$(document).on('click', '.toggleChatBox', function(e) {
		e.preventDefault();

		var id = $(this).data('cid');
		chatBox.toggleChatBoxGrowth(id);
	});

	//close chat box
	$(document).on('click', '.closeChat', function(e){
		e.preventDefault();

		var id = $(this).data('cid');
		chatBox.close(id);
	});

	//listen for keypress in chat text area
	$(document).on('keydown', '.chatboxtextarea', function(event){
		var id = $(this).data('cid');
		chatBox.checkInputKey(event, $(this), id);
	});

	//when a conversation is started show the conversation chat box
	$('a.conversation').click(function(e){
		e.preventDefault();

		var conversation_id = $(this).data('cid');
		chatBox.chatWith(conversation_id);
	});

}

$(document).ready(ready);
$(document).on("page:load", ready);