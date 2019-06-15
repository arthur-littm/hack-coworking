const getPreferenceWeightings = () => {
  let sum = 0;
  document.querySelectorAll('.booking-choice-container .active').forEach(function(element) {
    sum += parseFloat(element.dataset.weighting) + 0.25;
  })
  return sum;
}

const checkIfBalanceIsEnough = () => {
  const balance = parseInt(document.querySelector('.balance').innerText);
  const priceOfDesk = document.getElementById("booking_desk_price").value;
  if (balance < priceOfDesk) {
    document.querySelector('#price').disabled = true;
    document.querySelector('#price').classList.add("disable")
    document.querySelector('#message').classList.remove("d-none")
  } else {
    document.querySelector('#price').disabled = false;
    document.querySelector('#price').classList.remove("disable")
    document.querySelector('#message').classList.add("d-none")

  }
}

const updatePrice = () => {
  let price = 95;
  let multiplier = 0;
  const numberOfPreferences = document.querySelectorAll('.area-preference.active').length;
  multiplier += getPreferenceWeightings();
  multiplier = (multiplier === 0) ? 1 : (multiplier / 100) + 1;
  const icon = `<i class="fas fa-coins"></i>`;
  document.querySelector('#price').innerHTML = `Book a Desk <span style="font-weight: lighter;">(${icon} ${Math.round(price * multiplier)})</span>`;
  document.getElementById("booking_desk_price").value = Math.round(price * multiplier);
}

const initAreaPriceCalculator = () => {
  document.querySelectorAll('.area-preference').forEach(function(button) {
    button.addEventListener('click', () => {
      button.classList.toggle('active');
      updatePrice();
      checkIfBalanceIsEnough();
    })
  })
}


export { initAreaPriceCalculator }

