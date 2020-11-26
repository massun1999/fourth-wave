import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `
        <div class='comment-wrap'>
          <p class='comment-content'>
            <a href="/users/${data.content.user_id}" class="comment-user">${data.content.user.nickname}</a>
              <p id='comment-text'>${data.content.text}</p>
              <a href="/ideas/${data.content.idea_id}/comments/comment.id" class='comment-delete'>削除する</a>
          </p>
        </div>`;
    const comments = document.getElementById('comment-wrap');
    const newComment = document.getElementById('new-comment');
    comments.insertAdjacentHTML('afterend',html);
    newComment.Value='';
  }
});
