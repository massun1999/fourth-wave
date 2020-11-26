//未使用
function message() {
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    const formData = new FormDate(document.getElementById("form"));
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/messages", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const item = XHR.response.message;
      const chat = document.getElementById("chat");
      const formText = document.getElementById("content");
      const HTML = `
        <div class='space' data-id=${item.id}>
          <div class='chat-name'>
            ${item.user.nickname}
          </div>
          <div class='chat-content'>
            ${item.content}
          </div>
        </div>`;
      chat.insertAdjacentHTML('afterend', HTML);
      formText.value = "";
    };
    e.preventDefault();
  });
}
window.addEventListener("load",message);