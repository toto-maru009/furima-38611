const pay = () => {
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    console.log("送信時に発火")
  });
};

window.addEventListener("load", pay);