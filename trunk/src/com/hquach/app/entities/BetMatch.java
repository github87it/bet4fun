package com.hquach.app.entities;

import java.util.Date;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable
public class BetMatch {

	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long id;
	@Persistent
	private Long home;
	@Persistent
	private Long guess;
	@Persistent
	private int homeScore;
	@Persistent
	private int guessScore;
	@Persistent
	private float homeRate;
	@Persistent
	private float guessRate;
	@Persistent
	private double total;
	@Persistent
	private Date date;
	@Persistent
	private Long groupId;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getHome() {
		return home;
	}
	public void setHome(Long home) {
		this.home = home;
	}
	public Long getGuess() {
		return guess;
	}
	public void setGuess(Long guess) {
		this.guess = guess;
	}
	public int getHomeScore() {
		return homeScore;
	}
	public void setHomeScore(int homeScore) {
		this.homeScore = homeScore;
	}
	public int getGuessScore() {
		return guessScore;
	}
	public void setGuessScore(int guessScore) {
		this.guessScore = guessScore;
	}
	public float getHomeRate() {
		return homeRate;
	}
	public void setHomeRate(float homeRate) {
		this.homeRate = homeRate;
	}
	public float getGuessRate() {
		return guessRate;
	}
	public void setGuessRate(float guessRate) {
		this.guessRate = guessRate;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Long getGroupId() {
		return groupId;
	}
	public void setGroupId(Long groupId) {
		this.groupId = groupId;
	}
	
}
