package edu.mum.damor.controller;

import java.time.LocalDate;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;

import edu.mum.damor.converter.LocalDateFormatter;
import edu.mum.damor.domain.Auth;
import edu.mum.damor.domain.Ride;
import edu.mum.damor.service.RideService;

@Controller
public class RideController {
	
	@Autowired
	RideService rideService;

	@RequestMapping(value = "/offerRide", method = RequestMethod.GET)
	public String userRides(Model model) {
		LocalDateFormatter formatter = new LocalDateFormatter();
		model.addAttribute("today", formatter.print(LocalDate.now(), Locale.US));
		return "offerRide";
	}

	@RequestMapping(value = "/offerRide", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void offerRide(@ModelAttribute Ride ride, Auth auth) {
		ride.setDriver(auth.user);
		rideService.offerRide(ride);
	}
	
	@RequestMapping(value = "/myRides", method = RequestMethod.GET)
	public String myRides(Model model, Auth auth) {
		model.addAttribute("rides", rideService.findAll(auth.user.getId()));
		return "myRides";
	}
	
	@RequestMapping(value = "/cancelRide", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void cancelRide(@RequestParam long rideId) {
		rideService.cancel(rideId);
	}
}
