

// const canv = document.getElementById("game-canvas");
// const ctx = canv.getContext("2d");
 
const MovingObject = function(ob) {
    this.pos = ob.pos;
    this.vel = ob.vel;
    this.radius = ob.radius;
    this.color = ob.color;

    // this.draw = function () {
    //     ctx.beginPath();
    //     ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);
    //     ctx.fillStyle = "yellow"; 
    //     ctx.fill();
    // };

    // this.move = function () {
    //     this.pos[0] += this.vel[0];
    //     this.pos[1] += this.vel[1];
    // };
};

// MovingObject.prototype.draw = function () {
//         ctx.beginPath();
//         ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);
//         ctx.fillStyle = "yellow"; 
//         ctx.fill();
// };

// MovingObject.prototype.move = function() {
//     this.pos[0] += this.vel[0];
//     this.pos[1] += this.vel[1];
// };


module.exports = MovingObject;

