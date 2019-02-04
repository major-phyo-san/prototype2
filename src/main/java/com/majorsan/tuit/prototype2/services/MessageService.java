package com.majorsan.tuit.prototype2.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.majorsan.tuit.prototype2.database.DatabaseClass;
import com.majorsan.tuit.prototype2.models.Message;

public class MessageService 
{
	
	private Map<Long, Message> messages = DatabaseClass.getMessages();
	
	public MessageService()
	{
		messages.put(1L, new Message(1, "Hello World", "Major"));
		messages.put(2L, new Message(2, "Hello REST", "PKS"));
	}
	
	public List<Message> getAllMessages()
	{
		return new ArrayList<Message>(messages.values());
	}
	
	public Message getMessage(long id)
	{
		return messages.get(id);
	}
	
	public Message addMessage(Message message)
	{
		message.setId(messages.size()+1);
		messages.put(message.getId(), message);
		return message;
	}
	
	public Message updateMessage(Message message)
	{
		if(message.getId()<=0)
		{
			return null;
		}
		message.put(message.getId(), message);
		return message;
	}
	
	public Message removeMessage(long id)
	{
		return messages.remove(id);
	}
	
}
