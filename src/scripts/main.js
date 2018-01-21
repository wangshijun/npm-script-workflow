/* eslint no-console:"off" */
const add = (a, b) => {
  if (typeof a === 'number' && typeof b === 'number') {
    return a + b;
  }

  return NaN;
};

if (typeof module !== 'undefined' && module.exports) {
  module.exports = { add  };
} else {
  console.log('workflow with npm script is awesome!!!');
}
