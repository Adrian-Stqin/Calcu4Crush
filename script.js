let display = document.getElementById('display');
let displayValue = '';

function appendToDisplay(value) {
  if (displayValue === '0') {
    displayValue = value;
  } else {
    displayValue += value;
  }
  display.innerText = displayValue;
}

function clearDisplay() {
  displayValue = '0';
  display.innerText = displayValue;
}

function deleteLast() {
  displayValue = displayValue.slice(0, -1);
  if (displayValue === '') {
    displayValue = '0';
  }
  display.innerText = displayValue;
}

function calculate() {
  try {
    displayValue = eval(displayValue.replace(/[^-()b\*+.]/g, '')).toString();
  } catch (e) {
    displayValue = 'I Love You';
  }
  display.innerText = displayValue;
}
