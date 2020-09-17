Array.prototype.bubbleSort = function() {
    let sorted = false;
    while(!sorted){
        sorted = true;
        for(let i=0; i < this.length - 1; i++){
            if (this[i] > this[i + 1]){
                // let a = this[i];
                // this[i] = this[i + 1];
                // this[i + 1] = a;
                [this[i], this[i + 1]] = [this[i + 1], this[i]];
                sorted = false;
            }   
        }
    }
    return this;
}

String.prototype.subStrings = function() {
    const subs = [];
    for(let i = 0; i < this.length; i++) {
        for (let x = i; x < this.length; x++) {
            if (i != x ) {
            subs.push(this.slice(i, x));
            }    
        }
    }
    return subs;
}

