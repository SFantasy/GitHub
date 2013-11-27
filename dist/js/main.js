(function() {
  var G, GitHub;

  GitHub = (function() {
    function GitHub() {}

    GitHub.prototype.init = function() {
      this.bindEvent();
      this.render();
      return true;
    };

    GitHub.prototype.getAction = function() {
      return {
        basicUrl: 'https://api.github.com/users/'
      };
    };

    GitHub.prototype.bindEvent = function() {
      $('#save-user').bind('click', function(event) {
        if ($('#name').val().trim() !== '') {
          localStorage.setItem('github-user', $('#name').val());
          $('#accountNoty > p').text('Account name saved.').parent().popup('open');
          location.reload();
        } else {
          $('#accountNoty > p').text('Cannot be empty').parent().popup('open');
        }
        return false;
      });
      return true;
    };

    GitHub.prototype.render = function() {
      var USER_NAME, self;
      self = this;
      if (localStorage.getItem('github-user' === null)) {
        console.log('user not seted');
      } else {
        USER_NAME = localStorage.getItem('github-user');
        $.ajax({
          url: self.getAction().basicUrl + USER_NAME + '/received_events',
          success: function(data) {
            var item, _i, _len, _results;
            _results = [];
            for (_i = 0, _len = data.length; _i < _len; _i++) {
              item = data[_i];
              _results.push(console.log(item));
            }
            return _results;
          }
        });
        $.ajax({
          url: self.getAction().basicUrl + USER_NAME,
          success: function(data) {
            $('#ghAvatar').attr('src', data.avatar_url);
            $('#ghFollow').text(data.followers);
            $('#ghFollowing').text(data.following);
            $.ajax({
              url: self.getAction().basicUrl + USER_NAME + '/starred',
              success: function(data) {
                return $('#ghStar').text(data.length);
              }
            });
            $('#ghName a').text("Name: " + data.login);
            $('#ghLocation a').text("Located in " + data.location);
            $('#ghCompany a').text("Working at " + data.company);
            $('#ghBlog a').attr("href", data.blog).text("Blogged at " + data.blog);
            return $('#ghEmail a').attr('href', 'mailto:' + data.email).text("Email: " + data.email);
          }
        });
      }
      return true;
    };

    return GitHub;

  })();

  G = new GitHub();

  G.init();

}).call(this);
