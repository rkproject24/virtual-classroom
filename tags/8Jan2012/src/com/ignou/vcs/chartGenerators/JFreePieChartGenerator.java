package com.ignou.vcs.chartGenerators;

import java.awt.Color;
import java.io.IOException;
import java.io.OutputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PiePlot3D;
import org.jfree.data.general.DefaultPieDataset;



public class JFreePieChartGenerator {
	DefaultPieDataset pieDataset = new DefaultPieDataset();
	
	public void setChartMembersAndPercentages(ArrayList chartMembers,ArrayList percentages) {
		for (int i = 0; i < chartMembers.size(); i++) {
			String key = (String)chartMembers.get(i);
			double value = Double.valueOf((String)percentages.get(i)).doubleValue();
			DecimalFormat myFormat = new DecimalFormat("##.##");
			key = key + "( " + myFormat.format(value) + "% )";
			if(value != 0) {
				pieDataset.setValue(key, value);
			}
		}
	}
	
	public void generateFinalChart(OutputStream outStream, String title) {
		JFreeChart chart = ChartFactory.createPieChart3D(title, pieDataset, true, true, true);
		PiePlot3D plot3 = (PiePlot3D) chart.getPlot();
        plot3.setForegroundAlpha(0.6f);
        plot3.setCircular(true);
        chart.setBackgroundPaint(new Color(249, 231, 236));
        
        
		try {
			ChartUtilities.writeChartAsPNG(outStream, chart, 600, 250);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
