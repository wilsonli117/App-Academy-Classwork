const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");
const Game = require("./game.js");


document.addEventListener("DOMContentLoaded", () => { 
    
const canv = document.getElementById("game-canvas");
canv.width = 800;
canv.height = 800;
const ctx = canv.getContext("2d");
// lowercase window, not Window
    MovingObject.prototype.draw = function () {
        ctx.beginPath();
        ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);
        ctx.fillStyle = this.color;
        ctx.fill();
        ctx.stroke();
    }

    MovingObject.prototype.move = function() {
        this.pos[0] += this.vel[0];
        this.pos[1] += this.vel[1];
        
    };

    Game.prototype.draw = function() {
        ctx.clearRect(0,0,800,800);
  
          for (let i = 0; i < this.asteroids.length; i++) {
        
            this.asteroids[i].draw();
        }

    Game.prototype.move = function () {
        for (let i = 0; i < this.asteroids.length; i++) {
            this.asteroids[i].move();
        }
    }
    

    Game.prototype.animate = function() {

        const boundDraw = Game.prototype.draw.bind(this);
        const boundMove = Game.prototype.move.bind(this);
        setInterval(boundDraw, 20);
        setInterval(boundMove, 20);
    };


    };
    
    

window.MovingObject = MovingObject;
window.Asteroid = Asteroid;
window.Game = Game;


});