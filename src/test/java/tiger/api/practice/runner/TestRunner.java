package tiger.api.practice.runner;

import com.intuit.karate.junit5.Karate;

public class TestRunner {
	@Karate.Test
	public Karate runner() {
		return Karate.run("classpath:features").tags("@End2EndTest");
	}

}
