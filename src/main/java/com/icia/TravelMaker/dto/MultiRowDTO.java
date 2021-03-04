package com.icia.TravelMaker.dto;

import java.util.List;

import lombok.Data;

@Data
public class MultiRowDTO {

	private List<TravelerDTO> Travelers;
	private List<TravelerListDTO> travelerList;
	private List<PackageLocationDTO> PackageLocation;
	private List<PackageScheduleDTO> PackageSchedule;
}
