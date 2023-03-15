const pay = () => {
  const payjp = Payjp(process.env.PAYJP_PUBLIC_KEY);
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryMonthElement = elements.create('cardExpiry');
  const expiryYearElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#card-number');
  expiryMonthElement.mount('#card-exp-month');
  expiryYearElement.mount('#card-exp-year');
  cvcElement.mount('#card-cvc');

  const submit = document.getElementById("button");

  submit.addEventListener("click", (e) => {
    e.preventDefault();
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      numberElement.clear();
      expiryMonthElement.clear();
      expiryYearElement.clear();
      cvcElement.clear();
      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);