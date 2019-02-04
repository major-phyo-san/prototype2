package com.majorsan.tuit.prototype2.database;

import java.util.HashMap;
import java.util.Map;

import com.majorsan.tuit.prototype2.models.Message;
import com.majorsan.tuit.prototype2.models.Profile;

public class DatabaseClass 
{
	private static Map<Long, Message> messages = new HashMap<>();
	private static Map<Long, Profile> profiles = new HashMap<>();
	
	public static Map<Long, Message> getMessages()
	{
		return messages;
	}
	
	public static Map<Long, Profile> getProfiles()
	{
		return profiles;
	}
}
