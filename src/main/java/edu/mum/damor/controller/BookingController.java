package edu.mum.damor.controller;

import java.time.LocalDate;
import java.util.Locale;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import edu.mum.damor.converter.LocalDateFormatter;
import edu.mum.damor.domain.Auth;
import edu.mum.damor.domain.RideSearchInfo;
import edu.mum.damor.domain.dto.DomainException;
import edu.mum.damor.service.BookingService;
import edu.mum.damor.service.RideService;

@Controller
public class BookingController {

	@Autowired
	RideService rideService;

	@Autowired
	BookingService bookingService;

	@RequestMapping("/findRide")
	public String findRide(Model model) {
		LocalDateFormatter formatter = new LocalDateFormatter();
		model.addAttribute("today", formatter.print(LocalDate.now(), Locale.US));
		return "findRide";
	}

	@RequestMapping(value = "/findRide", method = RequestMethod.POST)
	public String findRide(@Valid @ModelAttribute RideSearchInfo info, BindingResult br, Model model) {
		if (br.hasErrors()) {
			throw new DomainException(rideService.formatBindingResult(br));
		}
		model.addAttribute("rides", rideService.findAll(info));
		return "rideResult";
	}

	@RequestMapping(value = "/bookSeat", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@ResponseBody
	public void bookSeat(@RequestParam long rideId, @RequestParam int seats, Auth auth) {
		bookingService.bookSeat(auth.user.getId(), rideId, seats);
	}

	@RequestMapping(value = "/cancelBooking", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void cancelBooking(@RequestParam long bookingId) {
		bookingService.cancel(bookingId);
	}
	
	@RequestMapping(value = "/myBookings", method = RequestMethod.GET)
	public String myBookings(Model model, Auth auth) {
		model.addAttribute("bookings", bookingService.findByPassengerId(auth.user.getId()));
		return "myBookings";
	}
}
