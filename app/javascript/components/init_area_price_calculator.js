const getPreferenceWeightings = () => {
  let sum = 0;
  document.querySelectorAll('.active').forEach(function(element) {
    sum += parseFloat(element.dataset.weighting) + 0.25;
  })
  return sum;
}

const updatePrice = () => {
  let price = 95;
  let multiplier = 0;
  const numberOfPreferences = document.querySelectorAll('.area-preference.active').length;

  multiplier += getPreferenceWeightings();
  multiplier = (multiplier === 0) ? 1 : (multiplier / 100) + 1

  document.querySelector('#price').value = Math.round(price * multiplier)
}

const initAreaPriceCalculator = () => {
  document.querySelectorAll('.area-preference').forEach(function(button) {
    button.addEventListener('click', () => {
      button.classList.toggle('active');
      updatePrice();
    })
  })
}

export { initAreaPriceCalculator }

