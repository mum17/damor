package edu.mum.damor.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.mum.damor.domain.User;
import edu.mum.damor.service.RideService;

@Controller
public class RideController {
	
	@Autowired
	RideService rideService;

	@RequestMapping(value = "/offerRide", method = RequestMethod.GET)
	public String userRides(@ModelAttribute User user) {
		return "offerRide";
	}
}
