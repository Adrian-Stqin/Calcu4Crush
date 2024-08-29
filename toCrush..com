<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Calculator-Crush</title>
  <style type="text/css">
    body {
  font-family: Arial, sans-serif;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  margin: 0;
  background-color: antiquewhite;
}

.calculator {
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  width: 100%;
  max-width: 400px;
  margin: 0 20px;
}

.display {
  background-color: #333;
  color: #fff;
  font-size: 2em;
  text-align: right;
  padding: 20px;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
  box-sizing: border-box;
}

.buttons {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
}

.btn {
  background-color: #f0f0f0;
  border: 1px solid #ddd;
  font-size: 1.5em;
  padding: 20px;
  cursor: pointer;
  transition: background-color 0.3s;
  text-align: center;
}

.btn:hover {
  background-color: #ddd;
}

.btn:active {
  background-color: #bbb;
}

.operator {
  background-color: #ff9f00;
  color: #fff;
}

.operator:hover {
  background-color: #ff7f00;
}

.operator:active {
  background-color: #cc6600;
}

.equal {
  grid-column: span 4;
  background-color: #007bff;
  color: #fff;
}

.equal:hover {
  background-color: #0056b3;
}

.equal:active {
  background-color: #004085;
}

  </style>
</head>

<body>
  <div class="calculator">
    <div class="display" id="display">0</div>
    <div class="buttons">
      <button class="btn" onclick="clearDisplay()">C</button>
      <button class="btn" onclick="deleteLast()">DEL</button>
      <button class="btn" onclick="appendToDisplay('%')">%</button>
      <button class="btn operator" onclick="appendToDisplay('/')">/</button>

      <button class="btn" onclick="appendToDisplay('7')">7</button>
      <button class="btn" onclick="appendToDisplay('8')">8</button>
      <button class="btn" onclick="appendToDisplay('9')">9</button>
      <button class="btn operator" onclick="appendToDisplay('*')">*</button>

      <button class="btn" onclick="appendToDisplay('4')">4</button>
      <button class="btn" onclick="appendToDisplay('5')">5</button>
      <button class="btn" onclick="appendToDisplay('6')">6</button>
      <button class="btn operator" onclick="appendToDisplay('-')">-</button>

      <button class="btn" onclick="appendToDisplay('1')">1</button>
      <button class="btn" onclick="appendToDisplay('2')">2</button>
      <button class="btn" onclick="appendToDisplay('3')">3</button>
      <button class="btn operator" onclick="appendToDisplay('+')">+</button>

      <button class="btn" onclick="appendToDisplay('0')">0</button>
      <button class="btn" onclick="appendToDisplay('.')">.</button>
      <button class="btn equal" onclick="calculate()">=</button>
    </div>
  </div>
  <script>
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

  </script>
</body>

</html>
