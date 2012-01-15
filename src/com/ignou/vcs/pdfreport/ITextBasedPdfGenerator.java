package com.ignou.vcs.pdfreport;

import java.awt.Color;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.ArrayList;

import com.lowagie.text.BadElementException;
import com.lowagie.text.Cell;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.Image;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.Table;


import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;

/**
 * CLASS FILE FOR pdf GENERATION
 * @author Pradeepthi S
 *
 */

public class ITextBasedPdfGenerator {
	
		Document document = new Document(PageSize.A4.rotate(),12,60,50,50);
		PdfWriter pdfWriter =null;
		
		/**
		 * Method to create Pdf file
		 * @param filePath Path of pdf file to be created.
		 */
		public void createFile(String filePath) {
			try {
				pdfWriter = PdfWriter.getInstance(document, new FileOutputStream(filePath));
				FontFactory.register("C://WINDOWS//Fonts//Arial.TTF");
				FontFactory.register("C://WINDOWS//Fonts//Verdana.TTF");
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			document.open();
			document.setPageSize(PageSize.A4);
		}
		
		/**
		 * Method to insert text in file.
		 * @param text
		 */
		public void insertText(String text) {
			try {
				
				Phrase phrase = new Phrase(text, new Font(Font.TIMES_ROMAN, 9, Font.NORMAL));
				Paragraph para = new Paragraph(phrase);
				para.setAlignment(Paragraph.ALIGN_CENTER);
				document.add(para);
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		/**
		 * Method to insert image in Pdf file
		 * @param imagePath Path fo image to be inserted.
		 */
		public void insertPicture(String imagePath) {
			try {
				Image logo = Image.getInstance(imagePath);
				logo.setIndentationLeft(70f);
				logo.setSpacingAfter(20f);
				logo.scalePercent(70);
				document.add(logo);
				
			} catch (BadElementException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (MalformedURLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
		/**
		 * Method to insert Table in Pdf file/
		 * @param columns No of Columns in table
		 * @param rows No of rows in Table
		 * @param tableHeadings Table headings
		 * @param tableData Table Data
		 * @param widths Table column widths ( must have wodth of every column)
		 * @param setWidths True: set witdh False: Don't set width/
		 */
		public void inserTable(int columns, int rows, ArrayList tableHeadings, ArrayList tableData) {
			try {
				Table t = new Table(columns,rows);

				t.setBorderColor(Color.BLACK);

				t.setPadding(3);

				//t.setSpacing(2);

				//t.setBorderWidth(1);

				for(int i = 0; i < tableHeadings.size(); i++) {
					String cellData = (String)tableHeadings.get(i);
					Font headingFont = new Font(FontFactory.getFont("Arial", 12 ,Font.BOLD));
					Phrase testPhrase  = new Phrase(cellData, headingFont);
					Cell cell = new Cell(testPhrase);
					cell.setHorizontalAlignment(Cell.ALIGN_CENTER);
					cell.setHeader(true);
					t.addCell(cell);
					
				}
				
				t.endHeaders();
				//String hours = (String)tableData.get(tableData.size() - 1);
				//tableData.remove(tableData.size() - 1);
				
				for(int i = 0; i < tableData.size(); i++) {
					String cellData = (String)tableData.get(i);
					Font font = new Font(FontFactory.getFont("Verdana", 10, Font.NORMAL));
					
					if(i % 5  == 0  ) {
						font = new Font(FontFactory.getFont("Verdana", 12, Font.BOLD));
					}
			
					Phrase testPhrase  = new Phrase(cellData, font);
					Cell cell = new Cell(testPhrase);
					//cell.setHorizontalAlignment(Cell.ALIGN_RIGHT);
					cell.setHeader(true);
					t.addCell(cell);
				}
				
//				if(setWidths) {
//					float widthArray[] = new float[widths.size()];
//					for(int i = 0; i < widthArray.length; i++){
//						widthArray[i] = Float.valueOf((String)widths.get(i)).floatValue();
//					}
//					t.setWidths(widthArray);
//				}
//				
				
				t.setAlignment(Table.ALIGN_TOP);
				document.add(t);
				
			} catch (BadElementException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
		
		/**
		 * Method for making Custom Table
		 * @param name
		 * @param period
		 * @param clientName
		 * @param sow
		 * @param workTableData
		 */
		public void customTable(String studentName, String courseName, String fatherName, String email, String date) {
			try {
				PdfPTable topTable = new PdfPTable(4);
				
				Font headingFont = new Font(FontFactory.getFont("Arial", 14 ,Font.BOLD, Color.gray));
				Font textFontBig = new Font(FontFactory.getFont("Arial", 16 ,Font.BOLD));
				Font textFontSmall = new Font(FontFactory.getFont("Arial", 14 ,Font.NORMAL));
				
				Phrase spaces = new Phrase("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t");
				PdfPCell cellCN = new PdfPCell(new Phrase("Student Name:",headingFont));
				cellCN.setHorizontalAlignment(PdfPCell.ALIGN_RIGHT);
				cellCN.setVerticalAlignment(PdfPCell.ALIGN_MIDDLE);
				cellCN.setBorderColor(new Color(0,0,0));
				topTable.addCell(cellCN);
				
				Phrase ph = new Phrase(studentName, textFontBig);
				ph.add(spaces);
				ph.add(new Phrase("Course Duration:\t ", headingFont));
				//ph.add(spaces);
				ph.add(new Phrase(date, textFontSmall));
				
				PdfPCell cell = new PdfPCell(ph);
				cell.setVerticalAlignment(PdfPCell.ALIGN_MIDDLE);
				cell.setColspan(3);
				cell.setFixedHeight(30f);
				topTable.addCell(cell);
				
				Phrase phrase = new Phrase("Course Name:", headingFont);
				cell = new PdfPCell(phrase);
				cell.setHorizontalAlignment(Cell.ALIGN_RIGHT);
				cell.setVerticalAlignment(Cell.ALIGN_CENTER);
				cell.setFixedHeight(20f);
				topTable.addCell(cell);
							
				phrase = new Phrase(courseName, textFontSmall);
				cell = new PdfPCell(phrase);
				cell.setHorizontalAlignment(Cell.ALIGN_LEFT);
				cell.setVerticalAlignment(Cell.ALIGN_CENTER);
				cell.setColspan(3);
				topTable.addCell(cell);
				
				phrase = new Phrase("Father's Name:", headingFont);
				cell = new PdfPCell(phrase);
				cell.setHorizontalAlignment(Cell.ALIGN_RIGHT);
				cell.setVerticalAlignment(Cell.ALIGN_CENTER);
				cell.setFixedHeight(20f);
				topTable.addCell(cell);
							
				phrase = new Phrase(fatherName, textFontSmall);
				cell = new PdfPCell(phrase);
				cell.setHorizontalAlignment(Cell.ALIGN_LEFT);
				cell.setVerticalAlignment(Cell.ALIGN_CENTER);
				cell.setColspan(3);
				topTable.addCell(cell);
				
				phrase = new Phrase("Email Id:", headingFont);
				cell = new PdfPCell(phrase);
				cell.setHorizontalAlignment(Cell.ALIGN_RIGHT);
				cell.setVerticalAlignment(Cell.ALIGN_CENTER);
				cell.setFixedHeight(20f);
				topTable.addCell(cell);
							
				phrase = new Phrase(email, textFontSmall);
				cell = new PdfPCell(phrase);
				cell.setHorizontalAlignment(Cell.ALIGN_LEFT);
				cell.setVerticalAlignment(Cell.ALIGN_CENTER);
				cell.setColspan(4);
				topTable.addCell(cell);
				
				phrase = new Phrase(" \t ", textFontBig);
				cell = new PdfPCell(phrase);
				cell.setHorizontalAlignment(Cell.ALIGN_LEFT);
				cell.setVerticalAlignment(Cell.ALIGN_CENTER);
				cell.setColspan(4);
				
				topTable.addCell(cell);
				
				document.add(topTable);
			} catch (BadElementException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		/**
		 * Another Custom Table.
		 * @param columns
		 * @param data
		 * @param widths
		 */
		public void insertSpecialTable(int columns, String total, String percent) {
			try {
				PdfPTable table = new PdfPTable(columns);
				PdfPCell cell;
				
				table.getDefaultCell().setBorderColor(Color.BLACK);
				table.getDefaultCell().setBorder(2);
				Font font = new Font(FontFactory.getFont("Arial", 11, Font.BOLD));
				Phrase phrase = new Phrase("Total Marks Scored:\t  \t",font);
				
				cell = new PdfPCell(phrase);
				cell.setFixedHeight(50f);
				
				cell.setColspan(4);
				cell.setHorizontalAlignment(PdfPCell.ALIGN_RIGHT);
				cell.setVerticalAlignment(PdfPCell.ALIGN_MIDDLE);
				
				table.addCell(cell);
				
				font = new Font(FontFactory.getFont("Verdana", 12, Font.BOLD));
				phrase = new Phrase(total,font);
				
				cell = new PdfPCell(phrase);
				cell.setFixedHeight(50f);
				cell.setColspan(1);
				
				cell.setHorizontalAlignment(PdfPCell.ALIGN_MIDDLE);
				cell.setVerticalAlignment(PdfPCell.ALIGN_MIDDLE);
				//cell.setBorderColor(Color.BLACK);
				//cell.setBorder(3);
				table.addCell(cell);
				
				document.add(table);
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				PdfPTable table = new PdfPTable(columns);
				PdfPCell cell;
				
				table.getDefaultCell().setBorderColor(Color.BLACK);
				table.getDefaultCell().setBorder(2);
				Font font = new Font(FontFactory.getFont("Arial", 11, Font.BOLD));
				Phrase phrase = new Phrase("Percentage:\t  \t",font);
				
				cell = new PdfPCell(phrase);
				cell.setFixedHeight(50f);
				cell.setColspan(4);
				cell.setHorizontalAlignment(PdfPCell.ALIGN_RIGHT);
				cell.setVerticalAlignment(PdfPCell.ALIGN_MIDDLE);
				
				table.addCell(cell);
				
				font = new Font(FontFactory.getFont("Verdana", 12, Font.BOLD));
				phrase = new Phrase(percent,font);
				
				cell = new PdfPCell(phrase);
				cell.setFixedHeight(50f);
				cell.setColspan(1);
				cell.setHorizontalAlignment(PdfPCell.ALIGN_MIDDLE);
				cell.setVerticalAlignment(PdfPCell.ALIGN_MIDDLE);
				//cell.setBorderColor(Color.BLACK);
				//cell.setBorder(3);
				table.addCell(cell);				
				document.add(table);
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		/**
		 * Method to finalize the pdf file
		 *
		 */
		public void closeFile() {
			document.close();
		}
		
	}

		



