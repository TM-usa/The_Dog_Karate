package DogTestsRunner;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class TestsRunner {
    @Karate.Test
    public Karate testBreeds(){
        Results results =
                Runner.path("classpath:features")
                        .tags("~@ignore")
                        .outputCucumberJson(true)
                        .parallel(5);
        generateReport(results.getReportDir());
        return Karate.run("breed").relativeTo(getClass());
    }

    @Karate.Test
    public Karate testCategories(){
        Results results =
                Runner.path("classpath:features")
                        .tags("~@ignore")
                        .outputCucumberJson(true)
                        .parallel(5);
        generateReport(results.getReportDir());
        return Karate.run("cats").relativeTo(getClass());
    }

    @Karate.Test
    public Karate testFavourites(){
        Results results =
                Runner.path("classpath:features")
                        .tags("~@ignore")
                        .outputCucumberJson(true)
                        .parallel(5);
        generateReport(results.getReportDir());
        return Karate.run("favs").relativeTo(getClass());
    }

    @Karate.Test
    public Karate testVotes(){
        Results results =
                Runner.path("classpath:features")
                        .tags("~@ignore")
                        .outputCucumberJson(true)
                        .parallel(5);
        generateReport(results.getReportDir());
        return Karate.run("vote").relativeTo(getClass());
    }

    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles =
                FileUtils.listFiles(new File(karateOutputPath),
                        new String[] {"json"}, true);
        final List<String> jsonPaths = new ArrayList(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "demo");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}
