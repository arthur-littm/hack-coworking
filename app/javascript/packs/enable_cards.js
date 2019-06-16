const cards = document.querySelectorAll(".lunch-card");
cards.forEach((card) => {
  card.addEventListener("click", (e) => {
    cards.forEach((c) => {
      if (c.classList.contains("active-card")) {
        c.classList.remove("active-card");
      }
    })
    e.currentTarget.classList.toggle("active-card");
    let href = document.getElementById("request").href.split("=");
    href.pop();
    href.push(`=${e.currentTarget.id}`)
    document.getElementById("request").href = href.join("")
  })
})
