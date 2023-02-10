window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = Math.round(priceInput.value * 0.1 );
    const addPofit = document.getElementById("profit");
    addPofit.innerHTML = Math.round(priceInput.value - Math.round(priceInput.value * 0.1 ))
 })
});