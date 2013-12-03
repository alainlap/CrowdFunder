// $(document).ready(function() {

// 	if ($(".activate-form").length) {
// 		$(".activate-form").toggle(activateForm, deactivateForm);
// 		disableForms();
// 	}

// });

// function activateForm() {
// 		console.log("Activating");
// 		$(this).html("Cancel").addClass("active");
// 		$(this).closest("form").find("input").prop("disabled", false);
// 		$(this).closest("form").find("input[type='submit']").css("display","block");
// }

// function deactivateForm() {
// 		console.log("Deactivating");
// 		$(this).html("Edit").removeClass("active");
// 		$(this).closest("form").find("input").prop("disabled", true);
// 		$(this).closest("form").find("input[type='submit']").css("display","none");
// }

// function disableForms() {
// 	$("input").prop("disabled", true);
// 	$("input[type='submit']").css("display", "none");
// }