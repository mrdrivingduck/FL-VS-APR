package edu.lu.uni.serval.faultlocalization;

import static com.google.common.base.Preconditions.checkNotNull;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import edu.lu.uni.serval.config.Configuration;
import edu.lu.uni.serval.dataprepare.DataPreparer;
import edu.lu.uni.serval.faultlocalization.Metrics.Metric;
import edu.lu.uni.serval.utils.FileHelper;
import edu.lu.uni.serval.utils.PathUtils;

public class FL {

	private static Logger log = LoggerFactory.getLogger(FL.class);
	
	public DataPreparer dp = null;
	public List<SuspiciousCode> suspStmts;
	
	/**
	 * Input: 
	 * 		1. Defects4J project path. e.g., ../Defects4JData/
	 * 		2. Output path: e.g., SuspiciousCodePositions/
	 * 		3. The project name: e.g., Chart_1
	 * 
	 * Output:
	 * 		1. a ranked list of suspicious statements for a buggy project.
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		String outputPath = "GZoltar-0.1.1/" + Configuration.SUSPICIOUS_POSITIONS_FILE_APTH;
		String path = Configuration.BUGGY_PROJECTS_PATH;
		String projectName = "Chart_11";
		
		log.info(projectName);
		
		FL fl = new FL();
		fl.locateSuspiciousCode(path, projectName, outputPath);
	}
	
	public void locateSuspiciousCode(String path, String buggyProject, String outputPath) {
		
		if (!buggyProject.contains("_")) {
			System.out.println("Main: cannot recognize project name \"" + buggyProject + "\"");
			return;
		}

		String[] elements = buggyProject.split("_");
		try {
			Integer.valueOf(elements[1]);
		} catch (NumberFormatException e) {
			System.out.println("Main: cannot recognize project name \"" + buggyProject + "\"");
			return;
		}

		System.out.println(buggyProject);
		
		if (dp == null) {
			dp = new DataPreparer(path);
			dp.prepareData(buggyProject);
		}
		if (!dp.validPaths) return;

		GZoltarFaultLoclaization gzfl = new GZoltarFaultLoclaization();
		gzfl.threshold = 0.0;
		gzfl.maxSuspCandidates = -1;
		gzfl.srcPath = path + buggyProject + PathUtils.getSrcPath(buggyProject).get(2);
		
		try {
			gzfl.localizeSuspiciousCodeWithGZoltar(dp.classPaths, checkNotNull(Arrays.asList("")), dp.testCases);
		} catch (NullPointerException e) {
			for (String metricStr : Configuration.METRICS_0_1_1) {
				FileHelper.outputToFile(outputPath + buggyProject + "/" + metricStr + ".txt", "", false);
			}
			log.error(buggyProject + "\n" + e.getMessage());
			e.printStackTrace();
			return;
		}
		
		for (String metricStr : Configuration.METRICS_0_1_1) {
			System.out.println(metricStr);
			Metric metric = new Metrics().generateMetric(metricStr);
			gzfl.sortSuspiciousCode(metric);
			
			List<SuspiciousCode> candidates = new ArrayList<SuspiciousCode>(gzfl.candidates.size());
			candidates.addAll(gzfl.candidates);
            
			StringBuilder builder = new StringBuilder();
			for (int index = 0, size = candidates.size(); index < size; index ++) {
				SuspiciousCode candidate = candidates.get(index);
				String wholeName = gzfl.srcPath + candidate.getClassName().replace('.', '/') + ".java";
				int lineNumber = candidate.lineNumber;
				builder.append(wholeName.substring(wholeName.indexOf(buggyProject) + buggyProject.length() + 1))
					.append("@").append(lineNumber)
					.append("@").append(candidate.getSuspiciousValueString()).append("\n");
			}
			FileHelper.outputToFile(outputPath + buggyProject + "/" + metricStr + ".txt", builder, false);
			gzfl.candidates.clear();// = new ArrayList<SuspiciousCode>();
		}
		
		gzfl.failingTestCases.clear();
		gzfl.gzoltarTestResults.clear();
		
	}
	
	public void locateSuspiciousCode(String path, String buggyProject, String outputPath, String metricStr) {
		if (!buggyProject.contains("_")) {
			System.out.println("Main: cannot recognize project name \"" + buggyProject + "\"");
			return;
		}

		String[] elements = buggyProject.split("_");
		try {
			Integer.valueOf(elements[1]);
		} catch (NumberFormatException e) {
			System.out.println("Main: cannot recognize project name \"" + buggyProject + "\"");
			return;
		}

		System.out.println(buggyProject);
		
		if (dp == null) {
			dp = new DataPreparer(path);
			dp.prepareData(buggyProject);
		}
		if (!dp.validPaths) return;

		GZoltarFaultLoclaization gzfl = new GZoltarFaultLoclaization();
		gzfl.threshold = 0.0;
		gzfl.maxSuspCandidates = -1;
		gzfl.srcPath = path + buggyProject + PathUtils.getSrcPath(buggyProject).get(2);
		
		try {
			gzfl.localizeSuspiciousCodeWithGZoltar(dp.classPaths, checkNotNull(Arrays.asList("")), dp.testCases);
		} catch (NullPointerException e) {
			log.error(buggyProject + "\n" + e.getMessage());
			e.printStackTrace();
			return;
		}
		
		System.out.println(metricStr);
		Metric metric = new Metrics().generateMetric(metricStr);
		gzfl.sortSuspiciousCode(metric);
		
		suspStmts = new ArrayList<SuspiciousCode>(gzfl.candidates.size());
		suspStmts.addAll(gzfl.candidates);
        
		StringBuilder builder = new StringBuilder();
		for (int index = 0, size = suspStmts.size(); index < size; index ++) {
			SuspiciousCode candidate = suspStmts.get(index);
			String className = candidate.getClassName();
			int lineNumber = candidate.lineNumber;
			builder.append(className).append("@").append(lineNumber)
				.append("@").append(candidate.getSuspiciousValueString()).append("\n");
		}
		FileHelper.outputToFile(outputPath + buggyProject + "/" + metricStr + ".txt", builder, false);
	}

}
