package com.ignou.vcs.chartGenerators;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;


import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;

import com.ignou.vcs.commons.Utilities;



/**
 * Bar Chart generation Code using JFree Charts API
 * @author ankit.kumar
 *
 */
public class JFreeBarChartGeneratorNew {
	DefaultCategoryDataset dataset;
	
	/**
	 * Method to set Dataset fro chart generation.
	 *  For more details look at:http://www.java2s.com/Code/Java/Chart/JFreeChartBarChartDemo1.htm
	 * @param seriesMembers
	 * @param categoryMembers
	 * @param data
	 */
	public void setChartData (ArrayList seriesMembers, ArrayList categoryMembers, ArrayList data) {
		int count =0;
		dataset = new DefaultCategoryDataset ();
		for (int i = 0; i < seriesMembers.size(); i++) {
			for (int j = 0; j < categoryMembers.size(); j++) {
				dataset.addValue(Double.valueOf((String)data.get(count)).doubleValue(), (String)seriesMembers.get(i),(String)categoryMembers.get(j));
				count ++;
			}
			
		}
		
	}
	
	/**
	 * Method to ganarate Final Chart
	 * @param title
	 * @param XaxisTitile
	 * @param YaxisTitle
	 * @param fileName
	 */
	public void createFinalChart(String title,String XaxisTitile, String YaxisTitle, String fileName) {
		JFreeChart chart = ChartFactory.createBarChart3D(
	            title,         // chart title
	            XaxisTitile,               // domain axis label
	            YaxisTitle,                  // range axis label
	            dataset,                  // data
	            PlotOrientation.VERTICAL, // orientation
	            true,                     // include legend
	            true,                     // tooltips?
	            true                     // URLs?
	        );
		CategoryPlot plot = chart.getCategoryPlot();
		
		CategoryAxis domainAxis = plot.getDomainAxis();
        domainAxis.setCategoryLabelPositions(
            CategoryLabelPositions.createUpRotationLabelPositions(Math.PI / 6.0)
        );
		try {
			ChartUtilities.saveChartAsJPEG(new File(Utilities.CHARTS_FILES_TEMP_PATH + "//" + fileName + ".jpeg"), chart, 600, 300);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
}
