document.addEventListener("DOMContentLoaded", () => {
  const tableData = document
    .getElementById("tableData")
    .getElementsByTagName("tbody")[0];
  const updateBtn = document.getElementById("dataUpdate");
  const searchName = document.getElementById("searchData");

  class Post {
    constructor(userId, title, body) {
      this.userId = userId;
      this.title = title;
      this.body = body;
      this.name = this.getUserName(userId);
    }
    getUserName(userId) {
      const users = {
        1: "Athota Srilatha",
        2: "Bandaru Sampath Kumar",
        3: "Gollakaram Ganga Bhavani",
        4: "Gowtham Meka",
        5: "Mayuraj Ranawat",
        6: "Narendiran K",
        7: "Pratham Madhunapanthula",
        8: "Riya Reddy",
        9: "Shaik Sameer",
        10: "Yateesh Tangudu",
        11: "Vaishnavi Panta",
        12: "Suriyan K ",
      };
      return users[userId] || "Unknown";
    }
  }

  function fetchData() {
    fetch("https://jsonplaceholder.typicode.com/posts")
      .then((response) => response.json())
      .then((data) => {
        console.log(data);
        tableData.innerHTML = "";
        data.forEach((post) => {
          const postObj = new Post(post.userId, post.title, post.body);

          const row = tableData.insertRow();
          row.insertCell(0).textContent = postObj.name;
          row.insertCell(1).textContent = postObj.title;
          row.insertCell(2).textContent = postObj.body;
        });
      })
      .catch((error) => console.error("Fetching data has error:", error));
  }
  updateBtn.addEventListener("click", fetchData);

  fetchData();
  searchName.addEventListener("input", () => {
    const searching = searchName.value.trim().toLowerCase();
    const rows = tableData.getElementsByTagName("tr");

    Array.from(rows).forEach((row) => {
      const name = row.getElementsByTagName("td")[0];
      if (name) {
        const nameValue = name.textContent.toLowerCase();
        row.style.display = nameValue.includes(searching) ? "" : "none";
      }
    });
  });
});
