package edu.lu.uni.serval.main;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/**
 * @author Mr Dk.
 * @since 2020/04/07
 */
public class MergeBugPosition {

    public static void main(String[] args) {
        String suspectCodeRoot = "GZoltar-0.1.1/SuspiciousCodePositions";
        String metric = "Ochiai";
        String mergeOutputPath = "GZoltarBugPosition.txt";
        PrintWriter out;

        // Prepare for output.
        try {
            out = new PrintWriter(new File(mergeOutputPath));
        } catch (Exception e) {
            e.printStackTrace();
            return;
        }

        for (File projectDir : new File(suspectCodeRoot).listFiles()) {
            System.out.println("*** Merging project bug: " + projectDir.getName() + " ***");

            File suspectCodePos = new File(projectDir, metric + ".txt");
            Map<String, Set<Integer>> sourceMapLine = new HashMap<>();
            BufferedReader br;
            
            try {
                br = new BufferedReader(new InputStreamReader(new FileInputStream(suspectCodePos)));
                String line;
                while ((line = br.readLine()) != null) {
                    // source/org/jfree/chart/plot/CategoryPlot.java@1684@0.9968181818
                    String[] lineData = line.split("@");
                    String sourceFile = lineData[0];
                    Integer suspiciousLine = Integer.parseInt(lineData[1]);

                    // Buggy in a single file.
                    Set<Integer> buggyLinesInFile = sourceMapLine.get(sourceFile);
                    if (buggyLinesInFile == null) {
                        buggyLinesInFile = new HashSet<>();
                        sourceMapLine.put(sourceFile, buggyLinesInFile);
                    }
                    // Buggy file in a project bug (Chart_1).
                    buggyLinesInFile.add(suspiciousLine);
                }
            } catch (Exception e) {
                e.printStackTrace();
                return;
            }

            if (!sourceMapLine.isEmpty()) {
                for (Map.Entry<String, Set<Integer>> entry : sourceMapLine.entrySet()) {
                    // Every buggy file in a bug (Chart_1).
                    StringBuilder builder = new StringBuilder(projectDir.getName());
                    builder.append("@").append(entry.getKey()).append("@");
                    for (Integer buggyLine : entry.getValue()) {
                        // Every buggy line in a buggy file.
                        builder.append(buggyLine).append(',');
                    }

                    out.println(builder.substring(0, builder.length() - 1));
                }
            }

            try {
                br.close();
            } catch (Exception e) {
                e.printStackTrace();
                return;
            }
        }

        out.close();
    }
}