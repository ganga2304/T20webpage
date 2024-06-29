const form = document.getElementById("registration-form");
const teamSelect = document.getElementById("team");
const notifications = document.getElementById("notifications");
const data = document.getElementById("t20-section");
const errorMsg = document.getElementById("error-message");
const tqmsg = document.getElementById("tqmessage");
const deleteBtn = document.getElementById("delete");
const resetButton = document.getElementById("reset");

document.addEventListener("DOMContentLoaded", () => {
  const storedData = JSON.parse(localStorage.getItem("contactData"));
  if (storedData) {
    form.style.display = "none";
    tqmsg.style.display = "block";
    deleteBtn.style.display = "block";
    dsplyData(storedData);
  } else {
    form.style.display = "block";
    tqmsg.style.display = "none";
    deleteBtn.style.display = "none";
  }
});

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
    alert("Please enter a proper number");
  }
  if (!team) {
    isValid = false;
    alert("Please select the correct team");
  }

  if (!isValid) {
    errorMsg.textContent = "Please check your data correctly";
    return;
  }
  const formData = {
    name: name.trim(),
    email: email.trim(),
    phone: phone.trim(),
    team: team.trim(),
    whatsapp: document.getElementById("whatsapp").checked,
    t20: document.querySelector('input[name="t20"]:checked')?.value,
  };

  localStorage.setItem("contactData", JSON.stringify(formData));

  form.style.display = "none";
  tqmsg.style.display = "block";
  deleteBtn.style.display = "block";
  dsplyData(formData);
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

resetButton.addEventListener("click", () => {
  form.reset();
  form.style.display = "block";
  tqmsg.style.display = "none";
  deleteBtn.style.display = "none";
  notifications.style.display = "none";
  data.style.display = "none";
  errorMsg.textContent = "";
  localStorage.removeItem("contactData");
});

deleteBtn.addEventListener("click", () => {
  localStorage.removeItem("contactData");
  location.reload(); // Reload the page to ensure form is reset
});

function validateEmail(email) {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}

function validatePhone(phone) {
  return /^\d+$/.test(phone);
}

function dsplyData(data) {
  tqmsg.innerHTML = `
    <h3>Thank you for your submission!</h3>
    <p>Name: ${data.name}</p>
    <p>Email: ${data.email}</p>
    <p>Phone: ${data.phone}</p>
    <p>Team: ${data.team}</p>
    <p>WhatsApp Notifications: ${data.whatsapp ? "Yes" : "No"}</p>
    <p>T20: ${data.t20 || "Not selected"}</p>
  `;
}
