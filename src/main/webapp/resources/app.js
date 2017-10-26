var api = {};
$(function() {

	function alertError(text) {
		$('#errorDialog .errorText').html(text);
		$('#errorDialog').modal('show');
	}

	function post(url, data) {
		return $.post(contextPath + url, data).fail(function(error) {
			var text = '';
			console.log(error);
			if (error.responseJSON && error.responseJSON.errorType == "ValidationError") {
				text += '<ol>';
				var errorList = error.responseJSON.errors;
				$.each(errorList, function(i, error) {
					text += '<li>' + error.message + '</li>';
				});
				text += '</ol>';
			} else {
				text = error.responseText;
			}
			alertError(text);
		});
	}

	function gatherForm(f) {
		var result = {};
		var array = $(f).serializeArray();
		$.each(array, function() {
			result[this.name] = this.value;
		});
		return result;
	}

	api.signUp = function(form) {
		var data = gatherForm(form);
		post("signup", data).done(function(done) {
			post("postLogin", {
				email : data.email,
				password : data.password
			}).done(function(done) {
				location.href = contextPath;
			});
		});
	}

	api.login = function(form) {
		post("postLogin", gatherForm(form)).done(function(done) {
			location.reload();
		});
	}

	api.offerRide = function(form) {
		var data = gatherForm(form);
		post("offerRide", data).done(function(done) {
			location.reload();
		});
	}

	api.findRide = function(form) {
		$foundRides = $('#foundRides');
		$foundRides.html('');
		post("findRide", gatherForm(form)).done(function(d) {
			$foundRides.html(d);
		})
	}

	api.bookSeat = function(rideId, seats) {
		post('bookSeat', {
			rideId : rideId,
			seats : seats
		}).done(function(d) {
			location.href = contextPath + "myBookings";
		});
	};

	api.cancelBooking = function(bookingId) {
		post("cancelBooking", {
			bookingId : bookingId
		}).done(function() {
			location.reload();
		})
	}

	api.cancelRide = function(rideId) {
		post("cancelRide", {
			rideId : rideId
		}).done(function() {
			location.reload();
		})
	}

});