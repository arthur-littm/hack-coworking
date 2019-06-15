const priceCalculatorForm = document.querySelector('#area-price-calculator');

const updatePrice = (price) => {
  document.querySelector('#price').innerHTML = price
}

const initAreaPriceCalculator = () => {
  console.log(priceCalculatorForm);
  updatePrice(25);
}

export { initAreaPriceCalculator }

