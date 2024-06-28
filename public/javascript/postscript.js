document.addEventListener("DOMContentLoaded", () => {
  const postsTable = document
    .getElementById("tableData")
    .getElementsByTagName("tbody")[0];
  const updateButton = document.getElementById("dataUpdate");
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
        10: "Suriyan K",
        11: "Vaishnavi Panta",
        12: "Yateesh Tangudu",
      };

      return users[userId] || "Unknown";
    }
  }
  function fetchData() {
    fetch("https://jsonplaceholder.typicode.com/posts")
      .then((response) => response.json())
      .then((data) => {
        console.log("API Response:", data);
        postsTable.innerHTML = "";

        data.forEach((post) => {
          const postObj = new Post(post.userId, post.title, post.body);

          const row = postsTable.insertRow();
          row.insertCell(0).textContent = postObj.name;
          row.insertCell(1).textContent = postObj.title;
          row.insertCell(2).textContent = postObj.body;
        });
      })
      .catch((error) => console.error("Fetching data has error:", error));
  }
  updateButton.addEventListener("click", fetchData);

  fetchData();
});
