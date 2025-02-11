document.addEventListener("DOMContentLoaded", function() {
    const scriptList = document.getElementById("script-list");

    fetch("scripts.json")
        .then(response => response.json())
        .then(data => {
            data.scripts.forEach(script => {
                const listItem = document.createElement("li");
                listItem.innerHTML = `<a href="scripts/${script.file}" download>${script.name}</a>`;
                scriptList.appendChild(listItem);
            });
        })
        .catch(error => console.error("Error loading scripts:", error));

    // Page transition animation
    document.body.classList.add("fade-in");
});
