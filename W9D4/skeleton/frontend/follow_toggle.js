const APIUtil = require('./api_util.js');
class FollowToggle {

  constructor($el) {
    this.$el = $($el);
    this.userId = this.$el.data('user-id');
    this.followState = this.$el.data('initial-follow-state');
    this.render();
    this.$el.on('click', this.handleClick.bind(this));
  }
  
  render() {
  
      if(this.followState){
        this.$el.text('Unfollow!');
      }else if (!this.followState){
        this.$el.text('Follow');
      }else if(this.followState === "following"){
        this.$el.prop("disabled", true);
        this.$el.text('Following...');
      }else if(this.followState === "unfollowing"){
        this.$el.prop("disabled", true);
        this.$el.text('Unfollowing...');
      }
      
    }
    
    
    handleClick() {
      if(this.followState){
        this.followState = "unfollowing";
        this.render();
        APIUtil.unfollowUser(this.userId).then(this.successCallback.bind(this)).then(this.render.bind(this));
      }else{
        this.followState = "following";
        this.render();
        APIUtil.followUser(this.userId).then(this.successCallback.bind(this)).then(this.render.bind(this));
      }
    }
    
    successCallback() {
      if(this.followState){
        this.$el.prop("disabled", false);
        this.followState = false;
      }else{
        this.$el.prop("disabled", false);
        this.followState = true;
      }
    }
    
  }
  
module.exports = FollowToggle;

// $( "#x" ).prop( "disabled", true );
 
// // Enable #x
// $( "#x" ).prop( "disabled", false );