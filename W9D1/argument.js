function sum() {
    let result = 0;
    let arr = Array.from(arguments);
    arr.forEach( arg => {
        result += arg;
    });

    return result;
}

function sum() {
  return [...arguments].reduce((acc, el) => acc + el);
}

Function.prototype.myBind = function(context) {

    let func = this;
    let args = Array.from(arguments).slice(1);
    return function() {
        let args2 = Array.from(arguments);
        return func.apply(context, args.concat(args2));
    }
};

// someFunc.myBind(context, bindArgs)
// someFunc(...callArgs);

Function.prototype.myBind = function(context, ...bindArgs) {

    let func = this;

    return function (...callArgs) {
        return func.apply(context, bindArgs.concat(callArgs));
    }
};

function curriedSum(numArgs) {
    let numbers = [];
    // debugger
    function _curriedSum(num) {
        // if ((arguments.length + numbers.length) > numArgs) return Error("Too MANY!");
        numbers.push(num);
        
        if (numbers.length === numArgs) {
            // debugger
            return numbers.reduce((acc, el) => acc + el);
        } else {
            // debugger
            return _curriedSum;
        }
    }
    return _curriedSum;
}

Function.prototype.curry = function(numArgs) {
    let args = [];
    const func = this;

    function _curry(x) {
        args.push(x);
        if (args.length === numArgs) {
            return func.apply(null, args);
        } else {
            return _curry;
        }
    }
    return _curry;         
};

Function.prototype.curry = function(numArgs) {
  let args = [];
  const func = this;

  function _curry(arg) {
      args.push(arg);
      if (args.length === numArgs) {
          return func(...args);
      } else {
          return _curry;
      }
  }
  return _curry;         
};

///greet.curry(4);

function greet(arg1, arg2, arg3, arg4) {
  console.log(`${arg1} says ${arg2} to ${arg3} and ${arg4}`);
}
test = greet.curry(4);
test("joe")("john")("mike")("jimm");



//-----------------------------------------------

Function.prototype.curry = function (numArgs) {
  let arr = [];
  let that = this;
  function _curried(num) {
      arr.push(num);
      console.log(`number is: ${num}`);
      console.log(`number of arguments =${arr.length}`);
      console.log(`context is ${that}`);
      if (arr.length === numArgs) {
          console.log(arr)
          return that.apply(null, arr);
      }
      return _curried;
  }
  return _curried;
}