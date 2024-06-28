document.addEventListener("DOMContentLoaded", () => {
  const postsTable = document
    .getElementById("tableData")
    .getElementsByTagName("tbody")[0];
  const updateButton = document.getElementById("dataUpdate");

  function fetchData() {
    fetch("https://jsonplaceholder.typicode.com/posts")
      .then((response) => response.json())
      .then((data) => {
        postsTable.innerHTML = "";
        data.forEach((post) => {
          const row = postsTable.insertRow();
          row.insertCell(0).textContent = `User ${post.userId}`;
          row.insertCell(1).textContent = post.title;
          row.insertCell(2).textContent = post.body;
        });
      })
      .catch(function (error) {
        console.error("Fetching data has error", error);
      });
  }

  updateButton.addEventListener("click", fetchData);

  fetchData();
});
