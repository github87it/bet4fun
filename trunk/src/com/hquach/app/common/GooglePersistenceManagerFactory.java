package com.hquach.app.common;

import javax.jdo.JDOHelper;
import javax.jdo.PersistenceManagerFactory;

/**
 * Created by hquach2 on 6/20/2014.
 */
public final class GooglePersistenceManagerFactory {

    private static final PersistenceManagerFactory pmfInstance =
            JDOHelper.getPersistenceManagerFactory("transactions-optional");

    private GooglePersistenceManagerFactory() {}

    public static PersistenceManagerFactory get() {
        return pmfInstance;
    }

}
