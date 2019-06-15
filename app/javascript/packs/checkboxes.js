const checkboxes = document.querySelectorAll(".booking-choice");
checkboxes.forEach((c) => {
  c.addEventListener("click", (e) => {
    e.currentTarget.classList.toggle("active")
  })
});
