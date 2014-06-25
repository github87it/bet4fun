package com.hquach.app.controller;


import java.util.Date;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hquach.app.common.GooglePersistenceManagerFactory;
import com.hquach.app.entities.BetGroup;
import com.hquach.app.entities.BetMatch;
import com.hquach.app.entities.Member;

@Controller
@RequestMapping("/group")
public class GroupController {

	@RequestMapping(value="/{groupId}", method = RequestMethod.GET)
	public String home(@PathVariable("groupId") Long groupId, ModelMap model) {
		PersistenceManager pm = GooglePersistenceManagerFactory.get().getPersistenceManager();
		Query matchesQ = pm.newQuery(BetMatch.class);
		matchesQ.setFilter("groupId == groupIdParam");
		matchesQ.setOrdering("date desc");
		matchesQ.declareParameters("Long groupIdParam");
		Query membersQ = pm.newQuery(Member.class);
		membersQ.setFilter("groupId == groupIdParam");
		membersQ.declareParameters("Long groupIdParam");
		try {
			model.put("matches", matchesQ.execute(groupId));
			model.put("members", membersQ.execute(groupId));
			model.put("group", pm.getObjectById(BetGroup.class, groupId));
		} finally {
			matchesQ.closeAll();
			membersQ.closeAll();
		}
		
		return "Index";
	}
	
	@RequestMapping(value="/members/add/${groupId}", method = RequestMethod.GET)
	public String member(@PathVariable("groupId") Long groupId, ModelMap model) {
		Member member = new Member();
		member.setGroupId(groupId);
		model.put("member", member);
		return "Member";
	}
	
	@RequestMapping(value="/members/delete/${memberId}", method = RequestMethod.GET)
	public String deleteMember(@PathVariable("memberId") String memberId, ModelMap model) {
		PersistenceManager pm = GooglePersistenceManagerFactory.get().getPersistenceManager();
		Member member = pm.getObjectById(Member.class, memberId);
    	try {
    		pm.makePersistent(member);
    	} finally {
    		pm.close();
    	}
    	return "redirect:/group/" + member.getGroupId();
	}
	
	@RequestMapping(value="/members/process", method = RequestMethod.POST)
	public String processMember(@ModelAttribute("member")Member member, ModelMap model) {
		member.setCreatedDate(new Date());
		member.setTotal(0);
		PersistenceManager pm = GooglePersistenceManagerFactory.get().getPersistenceManager();
    	try {
    		pm.makePersistent(member);
    	} finally {
    		pm.close();
    	}
    	return "redirect:/group/" + member.getGroupId();
	}
	
	@RequestMapping(value="/matches/add/${groupId}", method = RequestMethod.GET)
	public String match(@PathVariable("groupId") Long groupId, ModelMap model) {
		BetMatch match = new BetMatch();
		match.setGroupId(groupId);
		model.put("match", match);
		return "Match";
	}
	
	@RequestMapping(value="/matches/delete/${matchId}", method = RequestMethod.GET)
	public String deleteMatch(@PathVariable("matchId") String matchId, ModelMap model) {
		PersistenceManager pm = GooglePersistenceManagerFactory.get().getPersistenceManager();
		BetMatch match = pm.getObjectById(BetMatch.class, matchId);
    	try {
    		pm.makePersistent(match);
    	} finally {
    		pm.close();
    	}
    	return "redirect:/group/" + match.getGroupId();
	}
	
	@RequestMapping(value="/matches/process", method = RequestMethod.POST)
	public String processMatch(@ModelAttribute("match")BetMatch match, ModelMap model) {
		PersistenceManager pm = GooglePersistenceManagerFactory.get().getPersistenceManager();
    	try {
    		pm.makePersistent(match);
    	} finally {
    		pm.close();
    	}
    	return "redirect:/group/" + match.getGroupId();
	}
}
