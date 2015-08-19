$(document).ready(function() {

	//get songs data from 
	$.ajax({
		url: '/api/songs',
		type: 'GET',
		dataType: 'json',
		success: function(data) {
			var raw_template = $('#songlist').html();
			console.log(raw_template);
			var templateRenderer = _.template(raw_template);
			data.forEach(function(item) {
				console.log(item);
				var song_item = templateRenderer(item);
				$('.songstable tbody').append(song_item);
			});
		}
	});



});