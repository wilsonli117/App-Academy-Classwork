Array.prototype.myEach = function(callback) {
    for (let i = 0; i < this.length; i++) {
       callback(this[i]);
    }
}


Array.prototype.myMap = function (callback){
    const newArr = [];
    
    this.myEach(function(ele) {
        newArr.push(callback(ele));
    } );
    return newArr
}



function addOne(n){
    return n + 1;
}

function myFunc(a, b = 0) {
    // function body
}

Array.prototype.myReduce = function(callback, initialValue) {
    // initialValue = initialValue || this[0]
    let start_index = 0;
    if (!initialValue) {
        start_index = 1;
        initialValue = this[0];
    }


    this.slice(start_index).myEach(function(ele){
        initialValue = callback(initialValue, ele)
    });
    return initialValue;
}

function sum(n, x){
    return n + x;
}

// [1,2,3,4] => if acc = 1 #=> 11 