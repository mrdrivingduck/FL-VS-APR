package edu.lu.uni.serval.main;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FilenameFilter;
import java.io.PrintWriter;

public class GZoltar_1_7_3 {
    
    public static void main(String[] args) throws Exception {
        File base = new File("FaultLocalization/GZoltar-1.7.3/");
        File flDir = new File(base, "bugPos");
        File outputDir = new File(base, "SuspiciousCodePositions");
        if (!outputDir.exists()) {
            outputDir.mkdir();
        }

        for (File bugDir : flDir.listFiles()) {
            File[] metrics = bugDir.listFiles(new FilenameFilter(){
            
                @Override
                public boolean accept(File dir, String name) {
                    return name.equals("sfl_ochiai_ranking.csv");
                }
            });

            if (metrics.length != 1) {
                continue;
            }

            File buggyProjectDir = new File(outputDir, bugDir.getName());
            buggyProjectDir.mkdir();

            PrintWriter out = null;
            BufferedReader br = null;

            // Prepare for output.
            try {
                out = new PrintWriter(new File(buggyProjectDir, "Ochiai.txt"));
            } catch (Exception e) {
                e.printStackTrace();
                return;
            }

            int lineCounter = 0;
            Double score = 0.0d;
            
            try {
                br = new BufferedReader(new FileReader(metrics[0]));
                String line;
                while ((line = br.readLine()) != null) {
                    // org.jfree.data.xy$XYIntervalSeriesCollection#getSeries(int):116;1.0
                    // org.apache.commons.lang3.concurrent$BasicThreadFactory$Builder#BasicThreadFactory$Builder():254;0.6888467201936644
                    if (line.toLowerCase().contains("test") || line.contains("name;suspiciousness_value")) {
                        continue;
                    }

                    String[] tokens = line.split("[$#]");
                    String fileName = tokens[0] + "." + tokens[1];
                    String lineNum = line.substring(line.lastIndexOf(':') + 1, line.lastIndexOf(';'));
                    String scoreStr = line.substring(line.lastIndexOf(';') + 1);

                    Double currentScore = Double.valueOf(scoreStr);
                    lineCounter++;

                    if (currentScore.compareTo(0.0d) <= 0) {
                        break;
                    }
                    if (score.compareTo(currentScore) > 0 && lineCounter >= 100) {
                        break;
                    }

                    score = currentScore;

                    StringBuilder sb = new StringBuilder(fileName).append('@').append(lineNum).append('@').append(scoreStr);
                    out.println(sb.toString());
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            try {
                br.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
    
            out.close();
        }
    }
}