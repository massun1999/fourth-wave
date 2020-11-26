import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `
        <div class='space' data-id=${data.content.id}>
          <div class='chat-name'>
            ${data.content.user.nickname}
          </div>
          <div class='chat-content'>
            ${data.content.content}
          </div>
        </div>`;
    const messages = document.getElementById('chat');
    const newMessage = document.getElementById('content');
    messages.insertAdjacentHTML("afterbegin", html);
    newMessage.value='';
  }
});
