package practice.faker;

import java.util.Date;

import com.github.javafaker.Faker;
import com.ibm.icu.text.SimpleDateFormat;

public class FakerData {
	
	public static String getEmail() {
		Faker faker = new Faker();
		return faker.name().firstName()+faker.name().lastName() + "@gmail.com";
	}
	
	public static String getName() {
	Faker faker = new Faker();
	return faker.name().firstName();

}
	public static String getLastName() {
		Faker faker = new Faker();
		return faker.name().lastName();
	}
	
	public static String getDOB() {
		Faker faker = new Faker();
		Date date = faker.date().birthday();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
		return format.format(date);
		
	}
	// this will give us the phone number method
	
	public static String getPhoneNumber() {
		Faker faker = new Faker();
		return faker.phoneNumber().phoneNumber();
	}
	public static String getStreetAdderss() {
		Faker faker = new Faker();
		return faker.address().streetAddress();
	}
	public static String getCityName() {
		Faker faker = new Faker();
		return faker.address().cityName();
	}
	public static String getStateName() {
		Faker faker = new Faker();
		return faker.address().state();
	}
	
	
	
	}
	
	
	
	
	
	
