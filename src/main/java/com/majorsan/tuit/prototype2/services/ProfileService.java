package com.majorsan.tuit.prototype2.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.majorsan.tuit.prototype2.database.DatabaseClass;
import com.majorsan.tuit.prototype2.models.Profile;

public class ProfileService 
{
	
	private Map<Long, Profile> profiles = DatabaseClass.getProfiles();
	
	public ProfileService()
	{
		profiles.put(1L, new Profile(1, "phyo-san", "Phyo", "San"));
		profiles.put(2L, new Profile(2, "major-jupiter", "Major", "Jupiter"));
	}
	
	public List<Profile> getAllProfiles()
	{
		return new ArrayList<Profile>(profiles.values()); 
	}
	
	public Profile getProfile(long id)
	{
		return profiles.get(id);
	}
	
	public Profile addProfile(Profile profile)
	{
		profile.setId(profiles.size()+1);
		profiles.put(profile.getId(), profile);
		return profile;
	}
	
	public Profile removeProfile(long id)
	{
		return profiles.remove(id);
	}
}
