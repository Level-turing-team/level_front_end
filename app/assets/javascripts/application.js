// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require_tree .
storage = window.localStorage
$(function() {
if (storage.chkbx && storage.chkbx != '') {
  $('#remember_me').attr('checked', 'checked');
  $('#username').val(storage.usrname);
} else {
  $('#remember_me').removeAttr('checked');
  $('#username').val('');
}
 $('#submit').click(function(){
if ($('#remember_me').is(':checked')) {
// save username and password
  storage.usrname = $('#username').val();
  storage.chkbx = $('#remember_me').val();
} else {
  storage.usrname = '';
  storage.chkbx = '';
    }
  });
});