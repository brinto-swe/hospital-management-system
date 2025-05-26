window.onload = function () {
    var toggle = document.getElementById("nav-toggle");
    var navbar = document.getElementById("navbar");
    var main = document.getElementById("main-content");

    if (toggle && navbar && main) {
        toggle.addEventListener("click", function () {
            navbar.classList.toggle("show");
            main.classList.toggle("expander");
            toggle.classList.toggle("rotate");
        });
    } else {
        console.error("One or more elements not found: #nav-toggle, #navbar, #main-content");
    }
};
