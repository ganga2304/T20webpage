const form = document.getElementById("registration-form");
const teamSelect = document.getElementById("team");
const notifications = document.getElementById("notifications
                                              ");
const data = document.getElementById("t20-section");
const errorMsg = document.getElementById("error-message");
form.addEventListener("submit", (event) => {
  event.preventDefault();
  let isValid = true;
  errorMsg.textContent = "";
  const name = document.getElementById("name").value;
  const email = document.getElementById("email").value;
  const phone = document.getElementById("phone").value;
  const team = document.getElementById("team").value;
  if (!name.trim()) {
    isValid = false;
    alert("Please enter a valid name");
  }
  if (!email.trim() || !validateEmail(email)) {
    isValid = false;
    alert("Please enter a valid email");
  }
  if (!phone.trim() || !validatePhone(phone)) {
    isValid = false;
    alert("Please enter proper number");
  }

  if (!team) {
    isValid = false;
    alert("Please select the correct team");
  }

  if (!isValid) {
    errorMsg.textContent = "Please check your data correctly";
    return;
  }
  alert("submitted successfully!");
  form.reset();
});

teamSelect.addEventListener("change", () => {
  if (teamSelect.value) {
    notifications.style.display = "block";
    data.style.display = "block";
  } else {
    notifications.style.display = "none";
    data.style.display = "none";
  }
});
const resetButton = document.getElementById("reset");
resetButton.addEventListener("click", (event) => {
  event.preventDefault();
  form.reset();
});
function validateEmail(email) {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}

function validatePhone(phone) {
  return /^\d+$/.test(phone);
}
