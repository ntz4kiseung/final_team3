package com.sp.common;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.Calendar;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service("fileManager")
public class FileManager 
{
	// pathname : 파일을 저장할 경로
	// 리턴 : 서버에 저장된 새로운 파일명
	public String doFileUpload(MultipartFile partFile, String pathname) throws Exception 
	{
		String saveFilename = null;

		if (partFile == null || partFile.isEmpty())
			return null;
		
		// 클라이언트가 업로드한 파일의 이름
		String originalFilename = partFile.getOriginalFilename();
		if (originalFilename == null || originalFilename.length() == 0)
			return null;
		
		// 확장자
		String fileExt = originalFilename.substring(originalFilename.lastIndexOf("."));
		if (fileExt == null || fileExt.equals(""))
			return null;
		
		// 서버에 저장할 새로운 파일명을 만든다.
		saveFilename = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS"
									, Calendar.getInstance());
		saveFilename += System.nanoTime();
		saveFilename += fileExt;
		
		String fullpathname = pathname + File.separator + saveFilename;
		
		// 업로드할 경로가 존재하지 않는 경우 폴더를 생성 한다.
		File f = new File(fullpathname);
		if (!f.getParentFile().exists())
			f.getParentFile().mkdirs();

		partFile.transferTo(f);

		return saveFilename;
	}

	/**
	 * 파일을 업로드 하기 위한 메소드
	 * @param is				업로드할 파일정보를 가지고 있는 InputStream 객체
	 * @param originalFilename	클라이언트가 업로드한 파일명
	 * @param pathname			파일을 저장할 경로
	 * @return					서버에 저장된 새로운 파일의 이름
	 */
	public String doFileUpload(InputStream is, String originalFilename, String pathname) throws Exception 
	{
		String saveFilename = null;

		// 클라이언트가 업로드한 파일의 이름
		if (originalFilename == null || originalFilename.equals(""))
			return null;
		
		// 확장자
		String fileExt = originalFilename.substring(originalFilename.lastIndexOf("."));
		if (fileExt == null || fileExt.equals(""))
			return null;
		
		// 서버에 저장할 새로운 파일명을 만든다.
		saveFilename = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS"
									, Calendar.getInstance());
		saveFilename += System.nanoTime();
		saveFilename += fileExt;
		
		// 업로드할 경로가 존재하지 않는 경우 폴더를 생성 한다.
		File dir = new File(pathname);
		if (!dir.exists())
			dir.mkdirs();
		
		String fullpathname = pathname + File.separator + saveFilename;
		
		byte[] b = new byte[1024];
		int size = 0;
		FileOutputStream fos = new FileOutputStream(fullpathname);
		
		while((size=is.read(b)) != -1)
			fos.write(b, 0, size);
		
		fos.close();
		is.close();
		
		return saveFilename;
	}
	
	// 파일 다운로드
	// saveFilename : 서버에 저장된 파일명
	// originalFilename : 클라이언트가 업로드한 파일명
	// pathname : 서버에 저장된 경로
	public boolean doFileDownload(String saveFilename, String originalFilename, String pathname, HttpServletResponse response) 
	{
		String fullpathname = pathname + File.separator + saveFilename;
		
        try 
        {
    		if (originalFilename == null || originalFilename.equals(""))
    			originalFilename = saveFilename;
    		
        	originalFilename = new String(originalFilename.getBytes("euc-kr"), "8859_1");
        	
        } 
        catch (UnsupportedEncodingException e) 
        {
        	System.out.println(e.toString());
        }

	    try 
	    {
	        File file = new File(fullpathname);

	        if (file.exists())
	        {
	            byte readByte[] = new byte[4096];

	            response.setContentType("application/octet-stream");
				response.setHeader("Content-disposition"
						, "attachment;filename=" + originalFilename);

	            BufferedInputStream fin = new BufferedInputStream(new FileInputStream(file));
	            //javax.servlet.ServletOutputStream outs = response.getOutputStream();
	            OutputStream outs = response.getOutputStream();
	            
	   			int read;
	    		while ((read = fin.read(readByte, 0, 4096)) != -1)
	    			outs.write(readByte, 0, read);
	    		
	    		outs.flush();
	    		outs.close();
	            fin.close();
	            
	            return true;
	        }
	    } 
	    catch(Exception e) 
	    {
	    	System.out.println(e.toString());
	    }
	    
	    return false;
	}
	
	// 실제 파일 삭제
	public void doFileDelete(String filename, String pathname) throws Exception 
	{
		String fullpathname = pathname + File.separator + filename;
		File file = new File(fullpathname);
        if (file.exists())
           file.delete();
	}

	// 파일 길이
	public long getFilesize(String pathname) 
	{
		long size = -1;
		
		File file = new File(pathname);
		if (! file.exists())
			return size;
		
		size = file.length();
		
		return size;
	}
}











