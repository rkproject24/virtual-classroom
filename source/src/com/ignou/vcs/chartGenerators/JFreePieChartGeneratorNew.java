package com.ignou.vcs.chartGenerators;

import java.awt.Color;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;


import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PiePlot3D;
import org.jfree.data.general.DefaultPieDataset;

import com.ignou.vcs.commons.Utilities;

public class JFreePieChartGeneratorNew {
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
	
	public void generateFinalChart(String title, String fileName) {
		JFreeChart chart = ChartFactory.createPieChart(title, pieDataset, true, true, true);
		try {
			//System.out.println("Dest folder:" + 
			
			ChartUtilities.saveChartAsJPEG(new File(Utilities.CHARTS_FILES_TEMP_PATH + "//" + fileName + ".jpeg"), chart, 500, 300);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
