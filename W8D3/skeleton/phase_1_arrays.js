Array.prototype.uniq = function(){
    const new_arr = [];
    for(let i=0; i < this.length; i++){
        if(!new_arr.includes(this[i])){
            new_arr.push(this[i]);
        }
    }
    return new_arr
}

Array.prototype.twoSum = function() {
    const position_arr = [];
    
    for (let i = 0; i < this.length; i++) {
        for (let x = 0; x < this.length; x++) {
            if(this[i] + this[x] === 0){
                let temp = [i,x];
                position_arr.push(temp);
            }
        }
    }
    return position_arr;
}

// [1,2,3,-1,-3, -3] => [[0,3], [3,0], [2,4], [4,2] 2,5 5,2
// while (condition) {}

Array.prototype.transpose = function() {
    const transposed = [];
    for (let i = 0; i < this.length; i++) {
        const in_arr = [];
        for (let x = 0; x < this[i].length; x++) {
            in_arr.push(this[x][i]);
        }
        transposed.push(in_arr);
    }
    return transposed;
}

