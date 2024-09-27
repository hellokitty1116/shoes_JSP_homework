package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Shoes;
import model.ShoesDAO;


@WebServlet("/Shoes")
public class ShoesController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ShoesController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page = 1;
        int pageSize = 5;
        String searchName = request.getParameter("searchName");

        ShoesDAO dao = new ShoesDAO();
        List<Shoes> shoes;
        int totalShoes;

        // 處理頁碼參數
        String pageParam = request.getParameter("page");
        if (pageParam != null && !pageParam.isEmpty()) {
            page = Integer.parseInt(pageParam);
        }

        // 確保 page 至少為 1
        if (page < 1) {
            page = 1;
        }

        // 如果有搜尋名稱，則執行搜尋
        if (searchName != null && !searchName.isEmpty()) {
            shoes = dao.searchByNameWithPagination(searchName, page, pageSize); // 新增分頁的搜尋
            totalShoes = dao.countShoesBySearchName(searchName); // 計算符合搜尋條件的商品數量
        } else {
            // 沒有搜尋條件，顯示全部商品
            shoes = dao.getPagedShoes(page, pageSize);
            totalShoes = dao.countShoes();
        }

        // 計算總頁數
        int totalPages = (int) Math.ceil((double) totalShoes / pageSize);

        // 確保頁碼始終顯示 5 個
        int startPage, endPage;
        if (totalPages <= 5) {
            startPage = 1;
            endPage = totalPages;
        } else {
            startPage = Math.max(1, page - 2);
            endPage = Math.min(totalPages, page + 2);
            
            // 確保始終顯示 5 個頁碼
            if (endPage - startPage < 4) {
                if (startPage == 1) {
                    endPage = startPage + 4;
                } else if (endPage == totalPages) {
                    startPage = endPage - 4;
                }
            }
        }

        // 將數據傳遞到 JSP
        request.setAttribute("Shoes", shoes);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("searchName", searchName); // 傳遞 searchName 參數
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);

        request.getRequestDispatcher("ViewShoes.jsp").forward(request, response);
    }



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // doGet(request, response);
    }
}

