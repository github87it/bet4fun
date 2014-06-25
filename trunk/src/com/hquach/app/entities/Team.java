package com.hquach.app.entities;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable
public class Team {

	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long id;
    @Persistent
	private String name;
    @Persistent
	private String isoCode2;
    @Persistent
	private String isoCode3;
    
    public Team() {}

    public Team(String name, String isoCode2, String isoCode3) {
        this.name = name;
        this.isoCode2 = isoCode2;
        this.isoCode3 = isoCode3;
    }
    
    public Long getId() {
    	return id;
    }

    public String getName() {
        return name;
    }

    public String getIsoCode2() {
        return isoCode2;
    }

    public String getIsoCode3() {
        return isoCode3;
    }

	public void setId(Long id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setIsoCode2(String isoCode2) {
		this.isoCode2 = isoCode2;
	}

	public void setIsoCode3(String isoCode3) {
		this.isoCode3 = isoCode3;
	}
    
}
