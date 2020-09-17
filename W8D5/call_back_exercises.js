class Clock {
    constructor() {
      // 1. Create a Date object.
      // 2. Store the hours, minutes, and seconds.
      // 3. Call printTime.
      // 4. Schedule the tick at 1 second intervals.
        let date = new Date();
        this.hours = date.getHours();
        this.minutes = date.getMinutes();
        this.seconds = date.getSeconds();
        this.printTime();
        setInterval( () => {
            this._tick();
        }, 1000);
        // setInterval( this._tick.bind(this), 1000)
    }
  
    printTime() {
      // Format the time in HH:MM:SS
      // Use console.log to print it.
      console.log(`${this.hours}:${this.minutes}:${this.seconds}`);
    }
  
    _tick() {
      // 1. Increment the time by one second.
      // 2. Call printTime.
        this.seconds += 1;
        if (this.seconds === 60) {
            this.minutes += 1;
            this.seconds = 0;
        }
        if (this.minutes === 60) {
              this.hours += 1;
              this.minutes = 0;
        }
        if (this.hours === 24) {
            this.hours = 0;
        }
        this.printTime();
    }

// }
  
//   const clock = new Clock();

// const readline = require('readline');
// const reader = readline.createInterface({
//     input: process.stdin,
//     output: process.stdout
// });


// function addNumbers(numsLeft, completionCallback, sum = 0) {
//     if (numsLeft > 0) {
//         reader.question('Gimme number: ', response => {
//             response = parseInt(response);
//             sum += response;
//             console.log(`added ${response}. Now the sum is ${sum}`);
//             addNumbers(numsLeft -1, completionCallback, sum);
//         });
//     } else if (numsLeft === 0) {
//         completionCallback(sum);
//         reader.close();
//     }
// }

// let printer = function(sum) {
//         console.log(`the final is ${sum}`);
//         reader.close();
//     };

// addNumbers(5, printer);
// addNumbers( 3, sum => console.log(`Total Sum: ${sum}`), 0);


const askIfGreaterThan =  function (el1, el2, cb) {
    reader.question(`${el1} > ${el2} ???????????`, response => {
        if (response === "yes") {
            cb(true);
        } else if (response == 'no') {
            cb(false);
        } else {
            console.log('wat');
            cb(false);
        } 
    });
};

// askIfGreaterThan(1,2, function(x) { console.log(`That's ${x}`);});

const innerBubbleSortLoop = function (arr, i, madeAnySwaps, outerBubbleSortLoop) {
    if (i < (arr.length - 1)) {
        askIfGreaterThan(arr[i], arr[i + 1], function (isGreaterThan) {
            if (isGreaterThan) {
                [arr[i], arr[i+1]] = [arr[i+1], arr[i]];
                madeAnySwaps = true;
            }
        innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop); 
        });
    } else if (i == (arr.length - 1)) {
        outerBubbleSortLoop(madeAnySwaps);
    }
};

// innerBubbleSortLoop([1,2], 0, false, function(x) {
//     console.log(`${x}`);
// });


function absurdBubbleSort(arr, sortCompletionCallback) {
    function outerBubbleSortLoop(madeAnySwaps) {
      // Begin an inner loop if you made any swaps. Otherwise, call
      // `sortCompletionCallback`.
      if (madeAnySwaps) {
          innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
      } else {
          sortCompletionCallback(arr);
      }
    }
    // Kick the first outer loop off, starting `madeAnySwaps` as true.
    outerBubbleSortLoop(true);
  }

//   absurdBubbleSort([3, 2, 1], function(arr) {
//     console.log("Sorted array: " + JSON.stringify(arr));
//     reader.close();
//   });



Function.prototype.myBind = function(context, ...bindArgs) {
    const func = this; 
    return function(...callArgs) {
        return func.apply(context, bindArgs.concat(callArgs)));
    };
};


// class Lamp {
//     constructor() {
//       this.name = "a lamp";
//     }
//   }
  
//   const turnOn = function() {
//     console.log("Turning on " + this.name);
//   };
  
//   const lamp = new Lamp();
  
//   turnOn(); // should not work the way we want it to
  
//   const boundTurnOn = turnOn.bind(lamp);
//   const myBoundTurnOn = turnOn.myBind(lamp);
  
//   boundTurnOn(); // should say "Turning on a lamp"
//   myBoundTurnOn(); // should say "Turning on a lamp"

Function.prototype.myThrottle = function(interval) {
    const tooSoon = false;
    
    const result = function(tooSoon) {
        if (tooSoon === false) {
        tooSoon = true; 
        setTimeout(() => {
            this();
        }, interval); 
        }
    };
};
    
    
// class Neuron {
//     fire() {
//         console.log("Firing!");
//     }
// }

// const neuron = new Neuron();
// // When we create a new Neuron,
// // we can call #fire as frequently as we want

// // The following code will try to #fire the neuron every 10ms. Try it in the console:
// const interval = setInterval(() => {
//     neuron.fire();
// }, 10);

// // You can use clearInterval to stop the firing:
// clearInterval(interval);

// // Using Function#myThrottle, we should be able to throttle
// // the #fire function of our neuron so that it can only fire
// // once every 500ms:

// neuron.fire = neuron.fire.myThrottle(500);

// const interval = setInterval(() => {
//     neuron.fire();
// }, 10);

// // This time, if our Function#myThrottle worked correctly,
// // the Neuron#fire function should only be able to execute
// // every 500ms, even though we're still trying to invoke it
// // every 10ms!

// // If we want this behavior for ALL neurons, we can do the same logic in the constructor:

// class Neuron {
//     constructor() {
//         this.fire = this.fire.myThrottle(500);
//     }

//     fire() {
//         console.log("Firing!");
//     }
// }

class SearchBar {
    constructor() {
        this.query = "";

        this.type = this.type.bind(this);
        this.search = this.search.bind(this);
    }

    type(letter) {
        this.query += letter;
        this.search();
    }

    search() {
        console.log(`searching for ${this.query}`);
    }
}

const searchBar = new SearchBar();

const queryForHelloWorld = () => {
    searchBar.type("h");
    searchBar.type("e");
    searchBar.type("l");
    searchBar.type("l");
    searchBar.type("o");
    searchBar.type(" ");
    searchBar.type("w");
    searchBar.type("o");
    searchBar.type("r");
    searchBar.type("l");
    searchBar.type("d");
};

queryForHelloWorld();

Function.prototype.myDebounce = function(int) {

    

}