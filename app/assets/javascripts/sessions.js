

$(document).ready(function() {
	$('#submit-login').on('click', function(e) {
		e.preventDefault();
		var url = $(this).attr('href');
		var username = $('#username-login').val();
		var password = $('#password-login').val();


		$.post(url, {username: username, password: password});
		
	});
});