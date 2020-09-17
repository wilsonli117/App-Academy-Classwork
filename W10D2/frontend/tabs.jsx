import React from 'react';


class Tabs extends React.Component {
    constructor(props) {
        super(props);
        this.state = { tabIdx: 0 };
        this.changeTab = this.changeTab.bind(this);
    }

    changeTab(n) {
        this.setState({tabIdx: n})
    }
  

    render(){
        return (
            <h1 className="tabh1">Tabs
            <div className="tabs">
                <ul className="headers">
                    <Headers pane={this.props.tabs[0]} cb={this.changeTab} tabIdx={0}/>
                    <Headers pane={this.props.tabs[1]} cb={this.changeTab} tabIdx={1}/>
                    <Headers pane={this.props.tabs[2]} cb={this.changeTab} tabIdx={2}/>
                </ul>
                <article className="content">{this.props.tabs[this.state.tabIdx].content}</article>
            </div>
            </h1>
        );
        
    }

}
    
    
    
class Headers extends React.Component {

        constructor (props) {
            super(props);
        }

        render () {
            return (
            <h1 onClick={e => {this.props.cb(this.props.tabIdx)}}>{this.props.pane.title} </h1>
            )
        } 
}

export default Tabs;