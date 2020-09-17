const APIUtil = {
  followUser: user_id => {
    return $.ajax({
      method: "POST",
      url: `/users/${user_id}/follow`,
      dataType: "json"
    });
  },

  unfollowUser: id => {
    return $.ajax({
      method: "DELETE",
      url: `/users/${id}/follow`,
      dataType: "json"
    });
  }
};

module.exports = APIUtil;

