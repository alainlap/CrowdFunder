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
		self.closest("form").find("input").prop("disabled", true);
		self.closest("form").find(".hide-until-edit").css("display","none");
	} else {
		self.html("Cancel").addClass("alert");
		self.closest("form").find("input").prop("disabled", false).removeClass("no-field-display");
		self.closest("form").find(".hide-until-edit").css("display","inline-block");
	};
};


function disableForms() {
	$("input").prop("disabled", true);
	$(".hide-until-edit").css("display", "none");
	return false;
}