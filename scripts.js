document.addEventListener("DOMContentLoaded", function() {
    const scriptList = document.getElementById("script-list");

    fetch("scripts/")
        .then(response => response.text())
        .then(text => {
            const parser = new DOMParser();
            const doc = parser.parseFromString(text, "text/html");
            const links = [...doc.querySelectorAll("a")];

            links.forEach(link => {
                const fileName = link.getAttribute("href");
                if (fileName.endsWith(".lua")) {
                    const listItem = document.createElement("li");
                    listItem.innerHTML = `<a href="scripts/${fileName}" download>${fileName}</a>`;
                    scriptList.appendChild(listItem);
                }
            });
        })
        .catch(error => console.error("Error loading scripts:", error));
});
