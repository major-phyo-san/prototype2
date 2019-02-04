package com.majorsan.tuit.prototype2.resources;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.majorsan.tuit.prototype2.models.Profile;
import com.majorsan.tuit.prototype2.services.ProfileService;

@Path("/profiles")
public class ProfileResource 
{
	
	ProfileService profileService = new ProfileService();
	
	@GET
	@Produces(MediaType.APPLICATION_XML)
	public List<Profile> getAllProfiles()
	{
		return profileService.getAllProfiles();
	}
	
	@Path("/{profileId}")
	@GET
	@Produces(MediaType.APPLICATION_XML)
	public Profile getProfile(@PathParam("profileId") long profileId)
	{
		return profileService.getProfile(profileId);
	}

}
