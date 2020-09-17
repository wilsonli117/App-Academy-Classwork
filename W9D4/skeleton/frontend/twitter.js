const FollowToggle = require('./follow_toggle.js');
const APIUtil = require('./api_util.js')

$(() => {

  window.FollowToggle = FollowToggle;

  const $buttons = $('.follow-toggle');

  $buttons.each((index, ele) => {
      new FollowToggle(ele);
  });

//   $(".follow-toggle").on("click", (e) =>{
//     let a = new FollowToggle(e.target);
//     a.handleClick();
//   })

});


// $.ajax({

//   method: "GET"
//   url: `/users/${}`

// })
