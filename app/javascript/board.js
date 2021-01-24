function board() {
    const submit = document.getElementById("submit");
    submit.addEventListener("click", (e) => {
        const formData = new FormData(document.getElementById("form"));
        const XHR = new XMLHttpRequest();
        XHR.open("POST", "/boards", true);
        XHR.responseType = "json";
        XHR.send(formData);
        XHR.onload = () => {
            if (XHR.status != 200) {
                alert(`Error ${XHR.status}: ${XHR.statusText}`);
                return null;
            }
            const item = XHR.response.board;
            const list = document.getElementById("list");
            const formText = document.getElementById("post");
            const HTML = `
                <td class="post">${item.user_id}</td>
                <td class="post-date">${item.created_at}</td>
                <td class="post-content">${item.post}</td>
                <td></td>
                <td></td>
                `;
            list.insertAdjacentHTML("afterend", HTML);
            formText.value = "";
        };
        e.preventDefault();
    });
};
window.addEventListener("load", board);