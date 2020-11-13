window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
 priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
 const addTaxDom = document.getElementById("add-tax-price");
 addTaxDom.innerHTML = inputValue * 0.1;
 Math.floor(addTaxDom.innerHTML);
 const addProfit = document.getElementById("profit");
 addProfit.innerHTML = inputValue - addTaxDom.innerHTML
 Math.floor(addProfit.innerHTML);
})
});
