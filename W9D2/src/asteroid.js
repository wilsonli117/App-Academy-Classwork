const Util = require("./utils.js");
const MovingObject = require("./moving_object.js");

Util.inherits(Asteroid, MovingObject);

function Asteroid(obj){
    MovingObject.call(this, obj);
    
    const COLORS = ["brown", "red", "blue", "yellow", "green", "pink", "grey", "orange"]

    this.vel  = Util.randomVec(2);
    this.color = COLORS[Math.floor(Math.random() * 9)];
    this.radius = 50;

}

module.exports = Asteroid;