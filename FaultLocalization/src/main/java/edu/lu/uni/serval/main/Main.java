package edu.lu.uni.serval.main;

import edu.lu.uni.serval.config.Configuration;
import edu.lu.uni.serval.faultlocalization.FL;

public class Main {
	
	/**
	 * Input: 
	 * 		1. Defects4J project path. e.g., ../Defects4JData/
	 * 		2. Output path: e.g., SuspiciousCodePositions/
	 * 
	 * Output:
	 * 		1. ranked lists of suspicious statements for all buggy projects in Defects4J.
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
//		if (args.length != 2 || args.length != 3) {
//			System.err.println("Parameter Format: <Defects4J_Project_Path> <Output_Path>");
//			System.exit(0);
//		}
		
		String outputPath = "FaultLocalization/GZoltar-0.1.1/" + Configuration.SUSPICIOUS_POSITIONS_FILE_APTH;
//		FileHelper.deleteDirectory(outputPath);
		String path = Configuration.BUGGY_PROJECTS_PATH;

		String projectName = args[0];
		FL fl = new FL();
		fl.locateSuspiciousCode(path, projectName, outputPath);

		// for (int i = 19; i <= 26; i++) {
		// 	String projectName = "Chart_" + i;
		// 	FL fl = new FL();
		// 	fl.locateSuspiciousCode(path, projectName, outputPath);
		// }

		// for (int i = 1; i <= 40; i++) {
		// 	if (i == 6) {
		// 		continue;
		// 	}
		// 	String projectName = "Cli_" + i;
		// 	FL fl = new FL();
		// 	fl.locateSuspiciousCode(path, projectName, outputPath);
		// }

		// for (int i = 1; i <= 176; i++) {
		// 	if (i == 63 || i == 93) {
		// 		continue;
		// 	}
		// 	String projectName = "Closure_" + i;
		// 	FL fl = new FL();
		// 	fl.locateSuspiciousCode(path, projectName, outputPath);
		// }

		// for (int i = 1; i <= 18; i++) {
		// 	String projectName = "Codec_" + i;
		// 	FL fl = new FL();
		// 	fl.locateSuspiciousCode(path, projectName, outputPath);
		// }

		// for (int i = 25; i <= 28; i++) {
		// 	String projectName = "Collections_" + i;
		// 	FL fl = new FL();
		// 	fl.locateSuspiciousCode(path, projectName, outputPath);
		// }

		// for (int i = 1; i <= 47; i++) {
		// 	String projectName = "Compress_" + i;
		// 	FL fl = new FL();
		// 	fl.locateSuspiciousCode(path, projectName, outputPath);
		// }

		// for (int i = 1; i <= 16; i++) {
		// 	String projectName = "Csv_" + i;
		// 	FL fl = new FL();
		// 	fl.locateSuspiciousCode(path, projectName, outputPath);
		// }

		// for (int i = 1; i <= 18; i++) {
		// 	String projectName = "Gson_" + i;
		// 	FL fl = new FL();
		// 	fl.locateSuspiciousCode(path, projectName, outputPath);
		// }

		// for (int i = 1; i <= 26; i++) {
		// 	String projectName = "JacksonCore_" + i;
		// 	FL fl = new FL();
		// 	fl.locateSuspiciousCode(path, projectName, outputPath);
		// }

		// for (int i = 1; i <= 112; i++) {
		// 	String projectName = "JacksonDatabind_" + i;
		// 	FL fl = new FL();
		// 	fl.locateSuspiciousCode(path, projectName, outputPath);
		// }

		// for (int i = 1; i <= 6; i++) {
		// 	String projectName = "JacksonXml_" + i;
		// 	FL fl = new FL();
		// 	fl.locateSuspiciousCode(path, projectName, outputPath);
		// }

		// for (int i = 1; i <= 93; i++) {
		// 	String projectName = "Jsoup_" + i;
		// 	FL fl = new FL();
		// 	fl.locateSuspiciousCode(path, projectName, outputPath);
		// }

		// for (int i = 1; i <= 22; i++) {
		// 	String projectName = "JxPath_" + i;
		// 	FL fl = new FL();
		// 	fl.locateSuspiciousCode(path, projectName, outputPath);
		// }

		// for (int i = 1; i <= 65; i++) {
		// 	if (i == 2) {
		// 		continue;
		// 	}
		// 	String projectName = "Lang_" + i;
		// 	FL fl = new FL();
		// 	fl.locateSuspiciousCode(path, projectName, outputPath);
		// }

		// for (int i = 1; i <= 106; i++) {
		// 	String projectName = "Math_" + i;
		// 	FL fl = new FL();
		// 	fl.locateSuspiciousCode(path, projectName, outputPath);
		// }

		// for (int i = 1; i <= 38; i++) {
		// 	String projectName = "Mockito_" + i;
		// 	FL fl = new FL();
		// 	fl.locateSuspiciousCode(path, projectName, outputPath);
		// }

		// for (int i = 1; i <= 27; i++) {
		// 	if (i == 21) {
		// 		continue;
		// 	}
		// 	String projectName = "Time_" + i;
		// 	FL fl = new FL();
		// 	fl.locateSuspiciousCode(path, projectName, outputPath);
		// }

	}

}
