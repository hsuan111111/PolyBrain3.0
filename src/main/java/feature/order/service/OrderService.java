package feature.order.service;

import feature.cart.vo.CartItemImgDTO;
import feature.item.service.ItemServiceImpl;
import feature.item.vo.Item;
import feature.mem.dao.MemDaoImpl;
import feature.order.dao.ItemOrderDAO;
import feature.order.dao.impl.ItemOrderDAOImpl;
import feature.order.vo.ItemOrderDetailVO;
import feature.order.vo.ItemOrderVO;
import feature.order.vo.OrderDetailDTO;

import java.util.ArrayList;
import java.util.List;

public class OrderService {

    private ItemOrderDAOImpl dao;
    private ItemServiceImpl ItemServiceDao;

    public OrderService() {
        dao = new ItemOrderDAOImpl();
    }

    public Integer addOrder(Integer memNo, Integer orderTotal, Integer orderState, String receiverName, String receiverAddress, String receiverPhone, Integer receiverMethod) {
        ItemOrderVO itemOrderVO = new ItemOrderVO();
        itemOrderVO.setMemNo(memNo);
        itemOrderVO.setOrderTotal(orderTotal);
        itemOrderVO.setOrderState(orderState);
        itemOrderVO.setReceiverName(receiverName);
        itemOrderVO.setReceiverAddress(receiverAddress);
        itemOrderVO.setReceiverPhone(receiverPhone);
        itemOrderVO.setReceiverMethod(receiverMethod);

        return dao.insert(itemOrderVO);
    }

    public ItemOrderVO getOneOrder(Integer orderNo) {
        return dao.selectById(orderNo);
    }

    public List<ItemOrderVO> getAll() {
        System.out.println("aaa");
        return dao.selectAll();
    }

    public ItemOrderVO updateBackOrder(ItemOrderVO itemordervo) {

//        OrderService odsvc = new OrderService();
//        System.out.println(itemordervo.getOrderNo());
//        ItemOrderVO itemordervoDB =dao.selectById(itemordervo.getOrderNo());
//        ItemOrderVO itemordervoDB = odsvc.getOneOrder(orderNo);
//        itemordervo.setOrderNo(itemordervo.getOrderNo());
//        itemordervo.setMemNo(itemordervo.getMemNo());
//        itemordervo.setReceiverAddress(itemordervo.getReceiverAddress());
//        itemordervo.setReceiverName(itemordervo.getReceiverName());
//        itemordervo.setReceiverPhone(itemordervo.getReceiverPhone());
//
//        itemordervo.setOrderTotal(itemordervoDB.getOrderTotal());
//        itemordervo.setReceiverMethod(itemordervoDB.getReceiverMethod());
//        itemordervo.setOrderState(itemordervoDB.getOrderState());
//        itemordervo.setTranTime(itemordervoDB.getTranTime());
//        System.out.println("jdbcgood");
        return dao.updateAnOrder(itemordervo);
    }

    public boolean deleteById(Integer orderNo) {
        return dao.deleteById(orderNo) > 0;
    }

    public Integer addAnOrderDetail(List<CartItemImgDTO> cartItemImgDTOList, Integer orderNo) {
        ItemServiceDao = new ItemServiceImpl();
        for (int i = 0; i < cartItemImgDTOList.size(); i++) {


            ItemOrderDetailVO itemOrderDetailVO =
                    new ItemOrderDetailVO(orderNo,
                            cartItemImgDTOList.get(i).getItemNo(),
                            cartItemImgDTOList.get(i).getQuantity(),
                            cartItemImgDTOList.get(i).getItemPrice());
            dao.insertAnDetail(itemOrderDetailVO);

            Item item = new Item();
            item = ItemServiceDao.FindByItemId(cartItemImgDTOList.get(i).getItemNo());
            item.setItemPrice(item.getItemPrice());
            item.setItemProdDescription(item.getItemProdDescription());

            if (cartItemImgDTOList.get(i).getItemQty() - cartItemImgDTOList.get(i).getQuantity() == 0) {
                item.setItemState(2);
            }
            item.setItemQty(cartItemImgDTOList.get(i).getItemQty() - cartItemImgDTOList.get(i).getQuantity());

            ItemServiceDao.edit(item);
            System.out.println("更改商品成功");

        }
        return 1;
    }

    public List<ItemOrderVO> selectFromMemNo(Integer memNo) {
        return dao.selectByMemberNumber(memNo);
    }

    public  List<OrderDetailDTO> selectOrderDetail(Integer orderNo){
        List<Item> itemList = new ArrayList<Item>();
        ItemOrderVO itemOrderVO = dao.selectById(orderNo);
        List<ItemOrderDetailVO> itemOrderDetailVOList = dao.getDetailByOrderNumber(orderNo);
        List<OrderDetailDTO> orderDetailDTOList = new ArrayList<OrderDetailDTO>();

        for (int i =0; i< itemOrderDetailVOList.size(); i++){
            OrderDetailDTO orderDetailDTO = new OrderDetailDTO();
            itemList.add(ItemServiceDao.FindByItemId(itemOrderDetailVOList.get(i).getItemNo()));

            orderDetailDTO.setItemOrderVO(itemOrderVO);
            orderDetailDTO.setItemImg(itemList.get(i).getItemImg().get(0).getItemImg());
            orderDetailDTO.setItemName(itemList.get(i).getItemName());
            orderDetailDTO.setItemSales(orderDetailDTOList.get(i).getItemSales());
            orderDetailDTO.setItemPrice(orderDetailDTOList.get(i).getItemPrice());
            orderDetailDTOList.add(orderDetailDTO);
        }

        return orderDetailDTOList;
    }

}
