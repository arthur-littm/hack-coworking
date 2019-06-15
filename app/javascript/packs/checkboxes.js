const checkboxes = document.querySelectorAll(".select-one");

const updateActive = (selected) => {
  checkboxes.forEach((c) => {
    (c === selected) ? c.classList.add('active') : c.classList.remove('active')
  })
}

checkboxes.forEach((c) => {
  c.addEventListener("click", (e) => {
    updateActive(e);
  })
});

