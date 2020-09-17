/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\n\nUtil.inherits(Asteroid, MovingObject);\n\nfunction Asteroid(obj){\n    MovingObject.call(this, obj);\n    \n    const COLORS = [\"brown\", \"red\", \"blue\", \"yellow\", \"green\", \"pink\", \"grey\", \"orange\"]\n\n    this.vel  = Util.randomVec(2);\n    this.color = COLORS[Math.floor(Math.random() * 9)];\n    this.radius = 50;\n\n}\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const Game = function () {\n    // const DIM_X \n    // const DIM_Y\n    const NUM_ASTEROIDS = 10\n\n    this.asteroids = [];\n\n    this.addAsteroids = function () {\n        while (this.asteroids.length < NUM_ASTEROIDS) {\n            let pos = this.randomPosition();\n            let a = new Asteroid({ pos: pos});\n            this.asteroids.push(a);\n        }\n    }\n\n    this.randomPosition = function () {\n        return [ Math.floor(Math.random() * 750 + 50), Math.floor(Math.random() * 750 + 50) ];\n    }\n\n    // this.move = function () {\n    //     for (let i = 0; i < this.asteroids.length; i++) {\n    //         this.asteroids[i].move();\n    //     }\n    // }\n\n    // this.draw = function (ctx) {\n    //     ctx.clearRect(0,0,800,800);\n    //     this.asteroids.forEach ( asteroid => {\n    //         asteroid.draw();\n    //     });\n    // }\n}\n\nmodule.exports = Game;\n\n\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\n\n\ndocument.addEventListener(\"DOMContentLoaded\", () => { \n    \nconst canv = document.getElementById(\"game-canvas\");\ncanv.width = 800;\ncanv.height = 800;\nconst ctx = canv.getContext(\"2d\");\n// lowercase window, not Window\n    MovingObject.prototype.draw = function () {\n        ctx.beginPath();\n        ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);\n        ctx.fillStyle = this.color;\n        ctx.fill();\n        ctx.stroke();\n    }\n\n    MovingObject.prototype.move = function() {\n        this.pos[0] += this.vel[0];\n        this.pos[1] += this.vel[1];\n        \n    };\n\n    Game.prototype.draw = function() {\n        ctx.clearRect(0,0,800,800);\n  \n          for (let i = 0; i < this.asteroids.length; i++) {\n        \n            this.asteroids[i].draw();\n        }\n\n    Game.prototype.move = function () {\n        for (let i = 0; i < this.asteroids.length; i++) {\n            this.asteroids[i].move();\n        }\n    }\n    \n\n    Game.prototype.animate = function() {\n\n        const boundDraw = Game.prototype.draw.bind(this);\n        const boundMove = Game.prototype.move.bind(this);\n        setInterval(boundDraw, 20);\n        setInterval(boundMove, 20);\n    };\n\n\n    };\n    \n    \n\nwindow.MovingObject = MovingObject;\nwindow.Asteroid = Asteroid;\nwindow.Game = Game;\n\n\n});\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("\n\n// const canv = document.getElementById(\"game-canvas\");\n// const ctx = canv.getContext(\"2d\");\n \nconst MovingObject = function(ob) {\n    this.pos = ob.pos;\n    this.vel = ob.vel;\n    this.radius = ob.radius;\n    this.color = ob.color;\n\n    // this.draw = function () {\n    //     ctx.beginPath();\n    //     ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);\n    //     ctx.fillStyle = \"yellow\"; \n    //     ctx.fill();\n    // };\n\n    // this.move = function () {\n    //     this.pos[0] += this.vel[0];\n    //     this.pos[1] += this.vel[1];\n    // };\n};\n\n// MovingObject.prototype.draw = function () {\n//         ctx.beginPath();\n//         ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);\n//         ctx.fillStyle = \"yellow\"; \n//         ctx.fill();\n// };\n\n// MovingObject.prototype.move = function() {\n//     this.pos[0] += this.vel[0];\n//     this.pos[1] += this.vel[1];\n// };\n\n\nmodule.exports = MovingObject;\n\n\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const Util = {\n    inherits(childClass, parentClass) {\n        function Surr() {}\n        Surr.prototype = parentClass.prototype;\n        childClass.prototype = new Surr();\n        childClass.prototype.constructor = childClass;\n    },\n\n    randomVec(length) {\n        const deg = 2 * Math.PI * Math.random();\n        return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n    },\n    \n    scale(vec, m) {\n        return [vec[0] * m, vec[1] * m];\n    }\n\n\n};\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/utils.js?");

/***/ })

/******/ });