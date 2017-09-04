/*
* @FileName		:	ExcelBuilder2.java
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.06.18
* @Author		:	위진학
*/
package com.class_ic.view;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import com.class_ic.vo.AttandanceListDTO;

public class ExcelBuilder2 extends AbstractXlsView {

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// get data model which is passed by the Spring container
		List<AttandanceListDTO> attendanceList = (List<AttandanceListDTO>) model.get("memberattendacnelist");
		
		
		// create a new Excel sheet
		HSSFSheet sheet = (HSSFSheet) workbook.createSheet("Java Books");
		sheet.setDefaultColumnWidth(10);
		
		
		// create style for header cells
		CellStyle style = workbook.createCellStyle();
		Font font = workbook.createFont();
		font.setFontName("Arial");
		style.setFillForegroundColor(HSSFColor.BLUE.index);
		style.setFillPattern(CellStyle.SOLID_FOREGROUND);
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		font.setColor(HSSFColor.WHITE.index);
		style.setFont(font);
		
		// create header row
		HSSFRow header = sheet.createRow(0);
		
		header.createCell(0).setCellValue("이름");
		header.getCell(0).setCellStyle(style);
		
		header.createCell(1).setCellValue("수업일");
		header.getCell(1).setCellStyle(style);
		
		header.createCell(2).setCellValue("입실");
		header.getCell(2).setCellStyle(style);
		
		header.createCell(3).setCellValue("퇴실");
		header.getCell(3).setCellStyle(style);
		
		header.createCell(4).setCellValue("출결상태");
		header.getCell(4).setCellStyle(style);
		
		header.createCell(5).setCellValue("기수");
		header.getCell(5).setCellStyle(style);
		
		// create data rows
		int rowCount = 1;
		
		for (AttandanceListDTO attendance : attendanceList) {
			
			HSSFRow aRow = sheet.createRow(rowCount++);
			aRow.createCell(0).setCellValue(attendance.getName());
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			String attenddate = transFormat.format(attendance.getAttendDate());			
			aRow.createCell(1).setCellValue(attenddate);
			aRow.createCell(2).setCellValue(attendance.getInClass());
			aRow.createCell(3).setCellValue(attendance.getOutClass());
			aRow.createCell(4).setCellValue(attendance.getAttendState());
			aRow.createCell(5).setCellValue(attendance.getClassCode());

			
		}
		
	}



}

