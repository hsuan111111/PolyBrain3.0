package feature.item.controller;

import core.util.CommonUtil;
import feature.item.service.ItemService;
import feature.item.service.ItemServiceImpl;
import feature.item.vo.Item;


import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/item/addItem")
public class ItemAddServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ItemService service = new ItemServiceImpl();
    CommonUtil commonUtil = new CommonUtil();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        Item item = CommonUtil.json2Pojo(request, Item.class);
        //如果進來的東西是空的 代表新增失敗
        if (item == null) {
            item = new Item();
            item.setMessage("無商品資訊");
            item.setSuccess(false);
            CommonUtil.writePojo2Json(response, item);
            return;
        }
        //如果商品代碼未產生 代表商品還不存在 進入新增方法
        if (item.getItemNo() == null) {
            System.out.println("新增商品");
            item = service.AddItem(item);
            CommonUtil.writePojo2Json(response, item);
        }
        //如果商品代碼已產生 代表商品已存在 進入修改方法
        if (item.getItemNo() != null) {
//            final HttpSession session = request.getSession();
            System.out.println("修改商品");
            CommonUtil.writePojo2Json(response, service.edit(item));
        }
    }
}