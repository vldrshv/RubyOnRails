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
//= require jquery3
//= require jquery_ujs

document.addEventListener('DOMContentLoaded', function(){
    div = document.getElementById('todo_form');
    div.style.display = 'none';
  });

  function unhide(){
    div = document.getElementById('todo_form');
    div.style.display = 'inline';
    btn_add = document.getElementById('+');
    btn_add.style.display = 'none';
  }

  function hide(){
    div = document.getElementById('todo_form');
    div.style.display = 'none';
    btn_add.style.display = 'inline';
  }