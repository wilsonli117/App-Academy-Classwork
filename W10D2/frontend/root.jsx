import React from 'react';
import Clock from './clock';
import Tabs from './tabs';

const Root = (props) => {

    const pojo = [{ title: 'one', content: 'I am the first' }, { title: 'two', content: 'Second pane here' }, { title: 'three', content: 'Third pane here' }]
   
    return ( 
        <div>
            <Clock />
            <Tabs tabs={pojo}/> 
       </div>
    )    
}

export default Root;