package com.hquach.app.common;

import java.util.List;

import javax.jdo.JDOHelper;
import javax.jdo.PersistenceManagerFactory;
import javax.jdo.Query;

import com.hquach.app.entities.BetGroup;

public final class JDOServices {
	
	private static final PersistenceManagerFactory pmfInstance =
            JDOHelper.getPersistenceManagerFactory("transactions-optional");

	public static List<BetGroup> getGroups(String owner) {
		Query query = pmfInstance.getPersistenceManager().newQuery(BetGroup.class);
		query.setFilter("owner == ownerParam");
		query.declareParameters("String ownerParam");
		try {
			return (List<BetGroup>)query.execute(owner);
		} finally {
			query.closeAll();
		}
	}
	
}
