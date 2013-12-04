$(document).ready(function() {

	if ($(".activate-form").length) {
		$(".activate-form").on('click', toggleForm);
		disableForms();
	}

});

function toggleForm(e) {
	var self = $(this);
	
	e.preventDefault();
	e.stopPropagation();

	if (self.hasClass("alert")) {
		self.html("Edit").removeClass("alert");
		self.closest("form").find("input").not("#avatar input").prop("disabled", true).addClass("no-field-display");
		self.closest("form").find("input[type='submit']").css("display","none");
	} else {
		self.html("Cancel").addClass("alert");
		self.closest("form").find("input").not("#avatar input").prop("disabled", false).removeClass("no-field-display");
		self.closest("form").find("input[type='submit']").css("display","inline-block");
	};
};


function disableForms() {
	$("input").not("#avatar input").prop("disabled", true).addClass("no-field-display");
	$("input[type='submit']").not("#avatar input").css("display", "none");
	return false;
}