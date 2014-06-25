package com.hquach.app.controller;

import com.hquach.app.common.GooglePersistenceManagerFactory;
import com.hquach.app.common.Utilities;
import com.hquach.app.entities.BetGroup;
import com.hquach.app.entities.Team;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

import javax.jdo.JDOObjectNotFoundException;
import javax.jdo.PersistenceManager;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@RequestMapping(value="/group", method = RequestMethod.GET)
	public String group(ModelMap model) {
		List<BetGroup> groups = (List<BetGroup>)GooglePersistenceManagerFactory.get().getPersistenceManager()
                .newQuery(BetGroup.class).execute();
		model.put("groups", groups);
		return "Group";
	}
	
	@RequestMapping(value="/group/add", method = RequestMethod.GET)
    public String newGroup(ModelMap model) {
    	model.put("group", new BetGroup());
        return "ProcessGroup";
    }

    @RequestMapping(value="/group/update/{groupId}", method = RequestMethod.GET)
    public String editGroup(@PathVariable("groupId") Long groupId, ModelMap model) {
		BetGroup group = (BetGroup)GooglePersistenceManagerFactory.get().getPersistenceManager().getObjectById(BetGroup.class, groupId);
    	model.put("group", group);
        return "ProcessGroup";
    }
    
    @RequestMapping(value="/group/delete/{groupId}", method = RequestMethod.GET)
    public String deleteGroup(@PathVariable("groupId") Long groupId) {
    	PersistenceManager pm = GooglePersistenceManagerFactory.get().getPersistenceManager();
    	try {
    		pm.deletePersistent(pm.getObjectById(BetGroup.class, groupId));
    	} finally {
    		pm.close();
    	}
        return "redirect:/admin/group";
    }
    
    @RequestMapping(value="/group/process", method = RequestMethod.POST)
    public String processGroup(@ModelAttribute("group")BetGroup group, ModelMap model) {
    	PersistenceManager pm = GooglePersistenceManagerFactory.get().getPersistenceManager();
    	try {
    		pm.makePersistent(group);
    	} finally {
    		pm.close();
    	}
    	return group(model);
    	
    }

    @RequestMapping(value="/team", method = RequestMethod.GET)
    public String team(Model model) {
        List<Team> teams = (List<Team>)GooglePersistenceManagerFactory.get().getPersistenceManager()
                .newQuery(Team.class).execute();
        model.addAttribute("teams", teams);
        return "Team";
    }
    
    @RequestMapping(value="/team/add", method = RequestMethod.GET)
    public String addTeam(ModelMap model) {
    	model.put("countries", Utilities.getCountries());
    	model.put("teamForm", new Team());
        return "ProcessTeam";
    }

    @RequestMapping(value="/team/update/{teamId}", method = RequestMethod.GET)
    public String editTeam(@PathVariable("teamId") Long teamId, ModelMap model) {
    	model.put("countries", Utilities.getCountries());
    	Team team;
    	try {
    		team = (Team)GooglePersistenceManagerFactory.get().getPersistenceManager().getObjectById(Team.class, teamId);
    	} catch (JDOObjectNotFoundException ex) {
    		team = new Team("", "", "");
    	}
    	model.put("teamForm", team);
        return "ProcessTeam";
    }
    
    @RequestMapping(value="/team/delete/{teamId}", method = RequestMethod.GET)
    public String deleteTeam(@PathVariable("teamId") Long teamId) {
    	PersistenceManager pm = GooglePersistenceManagerFactory.get().getPersistenceManager();
    	try {
    		pm.deletePersistent(pm.getObjectById(Team.class, teamId));
    	} finally {
    		pm.close();
    	}
        return "redirect:/admin/team";
    }
    
    @RequestMapping(value="/team/process", method = RequestMethod.POST)
    public String processTeam(@ModelAttribute("teamForm")Team team, Model model) {
    	PersistenceManager pm = GooglePersistenceManagerFactory.get().getPersistenceManager();
    	try {
    		pm.makePersistent(team);
    	} finally {
    		pm.close();
    	}
    	return team(model);
    	
    }
}
