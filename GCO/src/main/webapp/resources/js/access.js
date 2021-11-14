
const urlParams = new URLSearchParams(window.location.search);
const form = urlParams.get("t");
/* Switch form depending on ur parameters */
switch (form) {
    case "login":
        showLogin();
        break;
    case "register":
        showRegistration();
        break;
}

/**
 * Show registration form
 */
function showRegistration() {
    document.querySelector("#login").classList.add("d-none");
    document.querySelector("#login-switch").classList.remove("btn-primary");
    document.querySelector("#register").classList.remove("d-none");
    document.querySelector("#register-switch").classList.add("btn-primary");
}

/**
 * Show login form
 */
function showLogin() {
    document.querySelector("#login").classList.remove("d-none");
    document.querySelector("#login-switch").classList.add("btn-primary");
    document.querySelector("#register").classList.add("d-none");
    document.querySelector("#register-switch").classList.remove("btn-primary");
}