class View {
    constructor(game, body){
        this.game = game;
        this.body = body;
        this.setupTowers();
    }

    clickTower(){
        $('.hanoi').on('click', 'ul', e => {
            let $selected = $('.selected');
            if ($selected){
                for (let i = 0; i < towers.length; i++)
                this.makeMove($ul);
            }
            else{
                let $ul = $(e.target);
            }
        });
    }

    makeMove(el) {
        
    }


    setupTowers() {
//add figure to body
        let $figure = $('<figure>');
        $figure.addClass('hanoi');
        this.body.append($figure);
        //add three uls to figure
        for(let i=0; i < 3; i++){
            let $tower = $('<ul>');
            $tower.addClass(`tower-${i + 1}`);
            $figure.append($tower);
            for(let j = 0; j < 3; j++) {
                let $disc = $('<li>');
                if (i === 0){
                    $disc.addClass(`disk-${j + 1}`);
                }
                $tower.append($disc);
            }
        }
    }

    render() {
        let $li = $('li');
        $li.removeClass();
        towers = this.game.towers;
        for(let i=0; i<towers.length; i++){
            let tower = towers[i];
            for (let j = 0; j < tower.length; j++){
                $(`tower-${i + 1} li:nth-child(${j + 1})`).addClass(`disc-${tower[j]}`);
            }
        }
    }
}


module.exports = View; 