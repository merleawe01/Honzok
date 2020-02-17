package a_common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {
	@Override
	public File rename(File originFile) {
		long currentTime = System.currentTimeMillis();
			// 현재시간 millis로 가져옴
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		int ranNum = (int)(Math.random() * 100000);
		
		// 확장자명 가져오기
		String name = originFile.getName();
		String ext = null;	// 확장자명 받아올 변수
		int dot = name.lastIndexOf(".");
		if(dot != -1) {
			ext = name.substring(dot);
		} else {
			ext = "";
		}
		
		String fileName = sdf.format(new Date(currentTime)) + ranNum + ext;
		File newFile = new File(originFile.getParent(), fileName);
		
		return newFile;
	}
}
