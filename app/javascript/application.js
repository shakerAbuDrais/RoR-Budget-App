// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "./controllers"
//= require jquery
//= require jquery_ujs
//= require popper
//= require bootstrap-sprockets

import * as bootstrap from "bootstrap"

// app/assets/javascripts/application.js

$(document).on('turbolinks:load', function() {
    $('#page-title').html("<%= content_for?(:title) ? yield(:title) : controller_name.titleize %>");
  });
  