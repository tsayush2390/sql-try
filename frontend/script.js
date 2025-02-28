document
  .getElementById("registerForm")
  .addEventListener("submit", function (e) {
    e.preventDefault();

    let formData = new FormData(this);

    fetch("backend/register.php", { method: "POST", body: formData })
      .then((response) => response.text())
      .then((data) => alert(data));
  });

document.getElementById("loginForm").addEventListener("submit", function (e) {
  e.preventDefault();

  let formData = new FormData(this);

  fetch("backend/login.php", { method: "POST", body: formData })
    .then((response) => response.text())
    .then((data) => alert(data));
});
