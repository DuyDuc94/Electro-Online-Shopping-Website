/*
 * DuyDuc94
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;
import java.sql.Statement;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;

/**
 * @author duy20
 */
public class OrderDAO extends DBContext {

    public List<Order> getOrdersList(int userID) {
        List<Order> list = new ArrayList<>();
        try {
            String SQL = "select * from [Order] where UserID = ?";
            PreparedStatement ps = con.prepareStatement(SQL);
            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int ID = rs.getInt("ID");
                Date dateOrder = rs.getDate("DateOrder");
                int status = rs.getInt("Status");
                String shippingAddress = rs.getString("ShippingAddress");
                String paymentMethod = rs.getString("PaymentMethod");
                list.add(new Order(ID, userID, dateOrder, status, shippingAddress, paymentMethod));
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public double getTotalPrice(int id) {
        double totalPrice = 0;
        try {
            String SQL = "select * from [Order_Detail] where OrderID = ?";
            PreparedStatement ps = con.prepareStatement(SQL);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                totalPrice += rs.getDouble("Price");
            }
            ps.close();
            rs.close();
            return totalPrice;
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totalPrice;
    }

    public boolean cancelOrder(int orderID) {
        try {
            String SQL = "update [Order] set Status = 1 where ID = ?";
            PreparedStatement ps = con.prepareStatement(SQL);
            ps.setInt(1, orderID);
            ps.executeUpdate();
            ps.close();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("Failed at cancel order with orderID = " + orderID);
        return false;
    }

    public boolean addOrder(int userID, Date dateOrder, int shippingAddressID, String paymentMethod) {
        try {
            String SQL = "insert into [Order] values(?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(SQL, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, userID);
            ps.setDate(2, dateOrder);
            ps.setInt(3, 2);
            AddressDAO addressDAO = new AddressDAO();
            ps.setNString(4, addressDAO.getFullAddress(shippingAddressID).getFullAddress());
            ps.setString(5, paymentMethod);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                int orderID = rs.getInt(1);
                rs.close();
                ps.close();
                Order_DetailDAO orderDetailDAO = new Order_DetailDAO();
                if (orderDetailDAO.addInOrder(orderID, userID)) {
                    return true;
                }
            }
            System.out.println("Failed at add order with userID = " + userID);
            return false;
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("Failed at add order with userID = " + userID);
        return false;
    }

}
