package com.hquach.app.common;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

public final class Utilities {

	private static Map<String, String> countries;
	
	public static Map<String, String> getCountries() {
		if (countries == null) {
			countries = new HashMap<String, String>();
			String[] codes = Locale.getISOCountries();
			for (int i=0; i<codes.length; i++) {
				Locale locale = new Locale("", codes[i]);
				countries.put(codes[i].toLowerCase(), locale.getDisplayCountry());
			}
		}
		return countries;
	}
	
}
