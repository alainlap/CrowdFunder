$(document).ready(function(){
  $('#tieradd').on('click',function(event){
    event.preventDefault();
    var tierid = $('.tiercard').size();
    $('#tierlist').append("<li class='tiercard'><div class='tiernumber'><img alt='Star' class='starimg' src='/assets/star.png'/><h4 class='inline threshold nopad'>Cost:<textarea id='project_tiers_attributes_" + tierid + "_threshold' name='project[tiers_attributes][" + tierid + "][threshold]'>0</textarea></h4></div><h5 class='remaining'>Quantity<textarea id='project_tiers_attributes_" + tierid + "_initial_quantity' name='project[tiers_attributes][" + tierid + "][initial_quantity]'>0</textarea></h5><p class='tiertext'><textarea id='project_tiers_attributes_" + tierid + "_reward_text' name='project[tiers_attributes][" + tierid + "][reward_text]'>Enter a reward here!</textarea></p><button class='tierdelete'>Remove this tier</button></li>");
  });
});

$(document).ready(function(){
  $('body').on('click', '.tierdelete', function (){
    event.preventDefault();
    $(this).parent().remove();
  });
});


// 3.times do |i|
//   @project.tiers.build({
//     threshold: 0,
//     reward_text: "Enter a reward here!",
//     initial_quantity: 0
//   })
// end

