package review.action;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.PrintWriter;
import java.net.URL;
import java.util.Enumeration;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.action.Action;
import common.vo.ActionForward;
import review.service.ReviewWriteProService;
import review.vo.ReviewBean;

public class ReviewWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReviewWriteProAction");
		
		ActionForward forward = null;
		
		ReviewBean rb = null;
		
		String realFolder=""; 
		String saveFolder="/reviewUpload";
		int fileSize = 10*1024*1024;
		String fileName="";
		
		//클라이언트 ip 추출 
//		String writerIpAddr = request.getRemoteAddr();
//		System.out.println(writerIpAddr);
		
		ServletContext context = request.getServletContext(); // WAS 객체 가져와서 실제 폴더위치 찾기
		realFolder = context.getRealPath(saveFolder); // 가상폴더를 기준으로 실제경로 알아냄
//		System.out.println(realFolder);
		
		
		//MultiPartRequest 객체 생성
		MultipartRequest multi = new MultipartRequest(request,realFolder,fileSize,"UTF-8",new DefaultFileRenamePolicy());
		
		//ReviewBean 객체 생성
		
		rb= new ReviewBean();
		rb.setReview_member_id(multi.getParameter("review_member_id"));
		rb.setReview_subject(multi.getParameter("review_subject"));
		rb.setReview_content(multi.getParameter("review_content"));
		rb.setReview_image(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		rb.setReview_package_catagory_code(multi.getParameter("review_package_category_code"));
		rb.setReview_member_name(multi.getParameter("review_member_name"));
		rb.setReview_star(Integer.parseInt(multi.getParameter("review_star")));
		rb.setReview_comment_count(Integer.parseInt(multi.getParameter("review_comment_count")));
		
		System.out.println("star: " +rb.getReview_star());
		System.out.println("content: " +rb.getReview_content());
		System.out.println("image : " +rb.getReview_image());
		
		
		ReviewWriteProService reviewWriteProService = new ReviewWriteProService();
		
		boolean isWriteSuccess =reviewWriteProService.registArticle(rb);
		response.setContentType("text/html; charset=UTF-8"); 
		
		PrintWriter out2 = response.getWriter();
		
		if(!isWriteSuccess){
			out2.println("<script>");
			out2.println("alert('리뷰 등록 실패!')");
			out2.println("history.back()");
			out2.println("</script>");
		}else {
			forward= new ActionForward();
			out2.println("<script>");
			out2.println("alert('리뷰 등록 완료!')");
			out2.println("</script>");
			forward.setPath("ReviewList.rv");
			forward.setRedirect(true); 
		}
		
		return forward;
	}

}
