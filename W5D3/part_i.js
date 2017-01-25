function madlib(verb, adjective, noun) {
  return `We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}`;
}

function isSubstring(searchString, subString) {
  return searchString.includes(subString);
}

function fizzbuzz(array) {
  var output = [];

  array.forEach(el => {
    if ((el % 3 === 0) ^ (el % 5 === 0)) {
      output.push(el);
    }
  })

  return output;
}

function isPrime(number) {
  if (number < 2) { return false; }

  for (let i = 2; i < number; i++) {
    if (number % i === 0) {
      return false;
    }
  }

  return true;
}

function sumOfNPrimes(n) {
  let sum = 0;
  let count = 0;
  let i = 2;

  while (count < n) {
    if (isPrime(i)) {
      sum += i;
      count++;
    }
    i++;
  }

  return sum;
}

function allOrNothing(mod, ...numbers) {
  for (let i = 0; i < numbers.length; i++) {
    if (numbers[i] % mod !== 0) {
      return false;
    }
  }

  return true;
}
