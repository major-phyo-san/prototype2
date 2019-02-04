package com.majorsan.tuit.prototype2.resources;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.majorsan.tuit.prototype2.models.Message;
import com.majorsan.tuit.prototype2.services.MessageService;

@Path("/messages")
public class MessageResource 
{
	
	MessageService messageService = new MessageService();
	
	@GET
	@Produces(MediaType.APPLICATION_XML)
	
	public List<Message> getAllMessages()
	{
		return messageService.getAllMessages();
		
	}
	
	@Path("/{messageId}")
	@GET
	@Produces(MediaType.APPLICATION_XML)
	public Message getMessage(@PathParam("messageId") long messageId)
	{
		return messageService.getMessage(messageId);
	}
}
