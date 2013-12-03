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

	if (self.hasClass("active")) {
		console.log("Deactivating");
		self.html("Edit").removeClass("active");
		self.closest("form").find("input").prop("disabled", true);
		self.closest("form").find("input[type='submit']").css("display","none");
	} else {
		console.log("Activating");
		self.html("Cancel").addClass("active");
		self.closest("form").find("input").prop("disabled", false);
		self.closest("form").find("input[type='submit']").css("display","block");
	};
};


function disableForms() {
	$("input").prop("disabled", true);
	$("input[type='submit']").css("display", "none");
	return false;
}