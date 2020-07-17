package edu.lu.uni.serval.main;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.PrintWriter;

public class ConvertBugPositionFormat {
    
    public static void main(String[] args) throws Exception {
        
        String basePath = "/home/mrdrivingduck/Desktop/FL-VS-APR/FaultLocalization/GZoltar-0.1.1/SuspiciousCodePositions";

        for (int i = 1; i <= 18; i++) {
            File eachBugDir = new File(basePath, "Codec_" + Integer.toString(i));
            if (!eachBugDir.exists()) {
                continue;
            }

            File[] metrics = eachBugDir.listFiles();
            for (File metric : metrics) {
                if (!metric.getName().equals("Ochiai.txt")) {
                    metric.delete();
                    continue;
                }
                File temp = new File(eachBugDir, "temp");
                BufferedReader reader = new BufferedReader(new FileReader(metric));
                PrintWriter writer = new PrintWriter(temp);
                String line = null;
                while ((line = reader.readLine()) != null) {
                    line = line.replace(".java", "");
                    line = line.replace("src/java/", "");
                    line = line.replace("src/main/java/", "");
                    line = line.replace("/", ".");
                    writer.println(line);
                }
                reader.close();
                writer.close();
                temp.renameTo(metric);
            }
        }
    }
}