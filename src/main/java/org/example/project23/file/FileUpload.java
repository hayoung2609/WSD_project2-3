package org.example.project23.file;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

public class FileUpload {
    public FileVO uploadFile(HttpServletRequest request){
        int sizeLimit = 15 * 1024 * 1024;
        String realPath = request.getServletContext().getRealPath("upload");
        //System.out.println(realPath);
        File dir = new File(realPath);
        if (!dir.exists()) dir.mkdirs();
        MultipartRequest multpartRequest = null;
        try {
            multpartRequest = new MultipartRequest(request, realPath,
                    sizeLimit, "utf-8",new DefaultFileRenamePolicy());
        } catch (IOException e) {
        //throw new RuntimeException(e);
            System.out.println("업로드 중 오류!");
        }
        String filename = multpartRequest.getFilesystemName("photo");
        String title = multpartRequest.getParameter("title");
        return new FileVO(title, filename);
    }
}
