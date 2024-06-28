const form = document.getElementById("registration-form");
const teamSelect = document.getElementById("team");
const notificationsSection = document.getElementById("notifications-section");
const t20Select = document.getElementById("t20-section");
const errorMessage = document.getElementById("error-message");
form.addEventListener("submit", (event) => {
  event.preventDefault();
  let isValid = true;
  errorMessage.textContent = "";
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
    alert("Please enter a valid phone number");
  }

  if (!team) {
    isValid = false;
    alert("Please select a team");
  }

  if (!isValid) {
    errorMessage.textContent = "Please check your data";
    return;
  }
  alert("Form submitted successfully!");
  form.reset();
});

teamSelect.addEventListener("change", () => {
  if (teamSelect.value) {
    notificationsSection.style.display = "block";
    t20Select.style.display = "block";
  } else {
    notificationsSection.style.display = "none";
    t20Select.style.display = "none";
  }
});

const resetButton = document.getElementById("reset-button");
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
