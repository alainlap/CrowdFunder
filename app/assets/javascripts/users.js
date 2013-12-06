$(document).ready(function() {

	if ($(".activate-form").length) {
		$(".activate-form").on('click', toggleForm);
		disableForms();

		$("form").on("submit", function(event){
			var url = $(this).attr("action");
			var data = $(this).serialize();
			var self = $(this);

			if (self.parent("#avatar") === []) {
				event.preventDefault();

				$.ajax({
					type: "PATCH",
					url: url,
					data: data,
					dataType: "json",
					success: function(result) {
						$.proxy(toggleForm, self.find('.activate-form'))();
					}
				});
			}
		});

		$("#user_avatar").on("click", function(){
			$("#upload-avatar").css("display", "inline-block");
		});
	}

});

function toggleForm(e) {
	var self = $(this);
	
	if (e) {
		e.preventDefault();
		e.stopPropagation();
	}

	if (self.hasClass("alert")) {
		self.html("Edit").removeClass("alert");
		self.closest("form").find("input").prop("disabled", true);
		self.closest("form").find(".hide-until-edit").css("display","none");
	} else {
		self.html("Cancel").addClass("alert");
		self.closest("form").find("input").prop("disabled", false).removeClass("no-field-display");
		self.closest("form").find(".hide-until-edit").css("display","inline-block");
	}
}


function disableForms() {
	$("input").not("#upload-avatar, #user_avatar, input[name='authenticity_token']").prop("disabled", true);
	$(".hide-until-edit").css("display", "none");
	return false;
}