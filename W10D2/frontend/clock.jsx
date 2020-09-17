import React from 'react';


class Clock extends React.Component {
    
    constructor(props) {
        super(props);

        this.state = { time: new Date()};
        this.tick = this.tick.bind(this);
    }

    tick() {
        this.setState( {time: new Date() });
    }

    componentDidMount() {
        this.intId = setInterval(this.tick, 1000);
    }
    
    componentWillUnmount() {
        clearInterval(this.intId);
    }


    render() {
        return (
            <div>
                <h1 className="clock"> Clock
                <div>
                    <ul className="time"> Time:
                        <li>{this.state.time.toTimeString()}</li>
                    </ul>
                    <ul className="date"> Date:
                        <li>{this.state.time.toDateString()}</li>
                    </ul>
                </div >
                </h1>
            </div >
        );
    }


    
}

export default Clock;