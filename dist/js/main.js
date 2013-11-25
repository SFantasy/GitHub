(function() {
  var G, GitHub;

  GitHub = (function() {
    function GitHub() {}

    GitHub.prototype.init = function() {
      this.bindEvent();
      this.render();
      return true;
    };

    GitHub.prototype.bindEvent = function() {
      $('#save-user').bind('click', function(event) {
        if ($('#name').val().trim() !== '') {
          localStorage.setItem('github-user', $('#name').val());
          $('#accountNoty > p').text('Account name saved.').parent().popup('open');
        } else {
          $('#accountNoty > p').text('Cannot be empty').parent().popup('open');
        }
        return false;
      });
      return true;
    };

    GitHub.prototype.render = function() {
      if (localStorage.getItem('github-user' === null)) {
        console.log('user not seted');
      } else {
        console.log('user seted');
      }
      return true;
    };

    return GitHub;

  })();

  G = new GitHub();

  G.init();

}).call(this);
