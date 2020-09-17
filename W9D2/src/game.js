const Game = function () {
    // const DIM_X 
    // const DIM_Y
    const NUM_ASTEROIDS = 10

    this.asteroids = [];

    this.addAsteroids = function () {
        while (this.asteroids.length < NUM_ASTEROIDS) {
            let pos = this.randomPosition();
            let a = new Asteroid({ pos: pos});
            this.asteroids.push(a);
        }
    }

    this.randomPosition = function () {
        return [ Math.floor(Math.random() * 750 + 50), Math.floor(Math.random() * 750 + 50) ];
    }

    // this.move = function () {
    //     for (let i = 0; i < this.asteroids.length; i++) {
    //         this.asteroids[i].move();
    //     }
    // }

    // this.draw = function (ctx) {
    //     ctx.clearRect(0,0,800,800);
    //     this.asteroids.forEach ( asteroid => {
    //         asteroid.draw();
    //     });
    // }
}

module.exports = Game;

