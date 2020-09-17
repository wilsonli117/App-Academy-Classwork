const range = function (start, end) {
    if(start === end){
        return [start];
    }
    const newArr = [start];
    return newArr.concat(range(start + 1, end));
}

function sumRec(arr) {
    if(arr.length === 1) {
        return arr[0]
    }

    return arr[0] + sumRec(arr.slice(1));
}

const exponent = function(base, exp){
    if(exp === 0){
        return 1;
    }
    if(exp === 1){
        return base;
    }

    if (exp < 0) {
        return 1/(base * exponent(base, -exp - 1));
    } else {
        return base * exponent(base, exp - 1);
    }
}

function exponentv2(base, exp) {
    if (exp === 0) {
        return 1;
    }
    if (exp === 1) {
        return base;
    }

    if (exp % 2 === 0){
        return exponentv2(base, exp/2) ** 2;
    }else {
        return base * exponentv2(base, (exp - 1) / 2) ** 2;
    }
}

function fibonacci(n){ 
    if (n === 1){
        return [1];
    }
    if (n === 2){
        return [1, 1];
    }
    const prevFibs = fibonacci(n - 1)
    const currentFibNum = prevFibs.slice(-1)[0] + prevFibs.slice(-2)[0];
    return prevFibs.concat(currentFibNum);
   
}

// function deepDup(arr) {
//     if (arr.length < 1) {
//         return arr
//     }

//     arr.forEach {
//         if()
//     }
// }
