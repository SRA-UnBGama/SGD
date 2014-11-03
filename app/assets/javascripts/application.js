// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require bootstrap-datepicker
//= require_tree .

function firstRender(){
	document.getElementById("working_conditions_auto_evaluation").style.display = "none";
	document.getElementById("goals_auto_evaluation").style.display = "none";
	document.getElementById("competences_auto_evaluation").style.display = "block";
}

function secondRender(){
	document.getElementById("working_conditions_auto_evaluation").style.display = "none";
	document.getElementById("goals_auto_evaluation").style.display = "block";
	document.getElementById("competences_auto_evaluation").style.display = "none";
}
function thirdRender(){
	document.getElementById("working_conditions_auto_evaluation").style.display = "block";
	document.getElementById("goals_auto_evaluation").style.display = "none";
	document.getElementById("competences_auto_evaluation").style.display = "none";
}