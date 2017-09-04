/*
* @FileName		:	QRCodeView.java
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.06.18
* @Author		:	위진학
*/
package com.class_ic.view;

import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.view.AbstractView;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

/*
* @Class: QRCodeView
* @Date: 2017.06. 18.
* @Author: 위진학
* @Desc: 기수별 QR코드 생성을 위해 img src 에 뿌려지는 QRCode 
*/
public class QRCodeView extends AbstractView {
	public QRCodeView() {
		// 뷰의 컨텐츠 타입 설정
		// 이미지로 뿌려야 함.
		setContentType("image/png; charset=UTF-8");
	}

	/*
	@description : QR생성에서 중요한 부분 가져온 Parameter를 QR로 변경되는 부분
	*/
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		System.out.println("QR 생성시점");
		res.setContentType(getContentType());
		String userAgent = req.getHeader("User-Agent");
		boolean ie = userAgent.indexOf("MSIE") > -1;
		String fileName = "QRCode.png";
		if (ie) {
			fileName = URLEncoder.encode(fileName, "UTF-8");
		} else {
			fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
		}		
		res.setHeader("Content-Transfer-Encoding", "binary");
		OutputStream out = res.getOutputStream();
		QRCodeWriter qrCodeWriter = new QRCodeWriter();
		String text = (String) model.get("content");
		text = new String(text.getBytes("UTF-8"), "ISO-8859-1");
		BitMatrix bitMatrix = qrCodeWriter.encode(text, BarcodeFormat.QR_CODE, 100, 100); 
		MatrixToImageWriter.writeToStream(bitMatrix, "png", out);
		out.flush();
	}
}
