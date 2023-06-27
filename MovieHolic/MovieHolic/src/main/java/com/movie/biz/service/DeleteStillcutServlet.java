package com.movie.biz.service;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteStillcutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String stillcutName = request.getParameter("stillcutName");

        // 스틸컷 파일이 저장된 경로
        String stillcutDirectory = "/WEB-INF/resources/stillcut_images/";

        // 스틸컷 파일 삭제
        File stillcutFile = new File(stillcutDirectory + stillcutName);
        if (stillcutFile.exists()) {
            if (stillcutFile.delete()) {
                response.setStatus(HttpServletResponse.SC_OK);
                response.getWriter().write("Stillcut deleted successfully.");
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("Failed to delete stillcut.");
            }
        } else {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            response.getWriter().write("Stillcut not found.");
        }
    }
}
