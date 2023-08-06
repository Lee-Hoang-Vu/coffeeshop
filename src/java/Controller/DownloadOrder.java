package Controller;

import DAO.DBContext;
import java.io.IOException;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.sql.PreparedStatement;
import java.util.HashMap;
import java.util.Map;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class DownloadOrder extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Kết nối cơ sở dữ liệu
            DBContext dao = new DBContext();

            // Truy vấn dữ liệu từ cơ sở dữ liệu
            String sql = "SELECT o.order_id, o.order_name, os.OrderStatus_name, o.order_date, o.notes, o.order_address, o.order_phone, SUM(od.order_price * od.quantity) AS amount, o.user_id\n"
                    + "FROM [Order] o \n"
                    + "INNER JOIN OrderStatus os ON o.orderStatus_id = os.OrderStatus_id\n"
                    + "INNER JOIN OrderDetail od ON o.order_id = od.order_id\n"
                    + "INNER JOIN Product p ON od.product_id = p.product_id\n"
                    + "WHERE os.OrderStatus_id = 2\n"
                    + "GROUP BY o.order_id, o.order_name, os.OrderStatus_name, o.order_date, o.notes, o.order_address, o.order_phone, o.user_id\n"
                    + "ORDER BY o.order_date DESC";

            try ( PreparedStatement statement = dao.connection.prepareStatement(sql)) {
                ResultSet resultSet = statement.executeQuery();

                // Tạo workbook Excel
                Workbook workbook = new XSSFWorkbook();
                Sheet sheet = workbook.createSheet("Order");
                int rowIdx = 0;

                // Tạo hàng tiêu đề
                Row headerRow = sheet.createRow(rowIdx++);
                headerRow.createCell(0).setCellValue("Order ID");
                headerRow.createCell(1).setCellValue("Order Name");
                headerRow.createCell(2).setCellValue("Status");
                headerRow.createCell(3).setCellValue("Order Date");
                headerRow.createCell(4).setCellValue("Note");
                headerRow.createCell(5).setCellValue("Address");
                headerRow.createCell(6).setCellValue("Phone");
                 headerRow.createCell(7).setCellValue("Amount");

                // Đọc dữ liệu từ ResultSet và điền vào workbook
                while (resultSet.next()) {
                    Row row = sheet.createRow(rowIdx++);
                    row.createCell(0).setCellValue(resultSet.getString("order_id"));
                    row.createCell(1).setCellValue(resultSet.getString("order_name"));
                    row.createCell(2).setCellValue(resultSet.getString("OrderStatus_name"));
                    row.createCell(3).setCellValue(resultSet.getString("order_date"));
                    row.createCell(4).setCellValue(resultSet.getString("notes"));
                    row.createCell(5).setCellValue(resultSet.getString("order_address"));
                    row.createCell(6).setCellValue(resultSet.getString("order_phone"));
                    row.createCell(7).setCellValue(resultSet.getString("amount"));
                }

                resultSet.close();

                // Câu SQL thứ hai
                String sql2 = "SELECT od.detail_id, od.order_id, p.product_name, od.order_price, od.quantity, ps.productSize_name, p.img "
                        + "FROM [OrderDetail] od "
                        + "INNER JOIN Product p ON od.product_id = p.product_id "
                        + "INNER JOIN ProductSize ps ON od.productSize_id = ps.productSize_id "
                        + "INNER JOIN [Order] o on o.order_id = od.order_id where o.orderStatus_id = 2 order by o.order_date desc";

                try ( PreparedStatement statement2 = dao.connection.prepareStatement(sql2)) {
                    ResultSet resultSet2 = statement2.executeQuery();

                    // Tiếp tục tạo sheet thứ hai và điền dữ liệu
                    Sheet sheet2 = workbook.createSheet("OrderDetail");
                    int rowIdx2 = 0;

                    // Tạo hàng tiêu đề cho sheet thứ hai
                    Row headerRow2 = sheet2.createRow(rowIdx2++);
                    headerRow2.createCell(0).setCellValue("Order ID");
                    headerRow2.createCell(1).setCellValue("Product Name");
                    headerRow2.createCell(2).setCellValue("Order Price");
                    headerRow2.createCell(3).setCellValue("Quantity");
                    headerRow2.createCell(4).setCellValue("Product Size");
                    headerRow2.createCell(5).setCellValue("Amount");

                    // Đếm tổng số lượng và tổng giá trị cho mỗi Order ID
                    Map<String, Integer> orderQuantityMap = new HashMap<>();
                    Map<String, Integer> orderAmountMap = new HashMap<>();

                    String currentOrderId = "";
                    int currentQuantity = 0;
                    int currentAmount = 0;
                    Cell currentQuantityCell = null;

                    // Đọc dữ liệu từ ResultSet và điền vào sheet thứ hai
                    while (resultSet2.next()) {
                        String orderId = resultSet2.getString("order_id");
                        if (!orderId.equals(currentOrderId)) {
                            // Thêm dòng thông tin Order
                            Row orderInfoRow = sheet2.createRow(rowIdx2++);
                            orderInfoRow.createCell(0).setCellValue(orderId);
                            orderInfoRow.createCell(1).setCellValue("");
                            orderInfoRow.createCell(2).setCellValue("");
                            orderInfoRow.createCell(3).setCellValue("Quantity");
                            orderInfoRow.createCell(4).setCellValue("");
                            orderInfoRow.createCell(5).setCellValue("");

                            // Cập nhật tổng số lượng và tổng giá vào dòng thông tin đơn hàng trước đó
                            if (currentQuantityCell != null) {
                                currentQuantityCell.setCellValue(currentQuantity);
                            }

                            currentOrderId = orderId;
                            currentQuantity = 0;
                            currentAmount = 0;
                        }

                        // Các dòng tiếp theo vẫn được thêm vào như trước
                        Row row = sheet2.createRow(rowIdx2++);
                        row.createCell(0).setCellValue("");
                        row.createCell(1).setCellValue(resultSet2.getString("product_name"));
                        row.createCell(2).setCellValue(resultSet2.getString("order_price"));
                        int quantity = resultSet2.getInt("quantity");
                        row.createCell(3).setCellValue(quantity);
                        row.createCell(4).setCellValue(resultSet2.getString("productSize_name"));

                        // Tính toán tổng giá và số lượng
                        int orderPrice = resultSet2.getInt("order_price");
                        int amount = quantity * orderPrice;
                        row.createCell(5).setCellValue(amount);

                        // Cập nhật tổng số lượng và tổng giá trị cho Order ID hiện tại
                        currentQuantity += quantity;
                        currentAmount += amount;

                        // Cập nhật tổng số lượng và tổng giá trị cho Order ID trong map
                        orderQuantityMap.put(orderId, orderQuantityMap.getOrDefault(orderId, 0) + quantity);
                        orderAmountMap.put(orderId, orderAmountMap.getOrDefault(orderId, 0) + amount);
                    }

                    // Cập nhật tổng số lượng và tổng giá trị cho dòng thông tin đơn hàng cuối cùng
                    if (currentQuantityCell != null) {
                        currentQuantityCell.setCellValue(currentQuantity);
                    }

                    // Update quantity value for each order ID in the "OrderDetail" sheet
                    for (Row row : sheet2) {
                        Cell orderIdCell = row.getCell(0);
                        if (orderIdCell != null) {
                            String orderId = orderIdCell.getStringCellValue();
                            if (!orderId.isEmpty()) {
                                Integer orderQuantity = orderQuantityMap.get(orderId);
                                if (orderQuantity != null) {
                                    Cell quantityCell = row.createCell(3);
                                    quantityCell.setCellValue(orderQuantity);
                                    currentQuantityCell = quantityCell;
                                }
                            }
                        }
                    }

                    // Tạo các cột tổng số lượng và tổng giá trị cho từng Order ID
                    Row totalRow = sheet2.createRow(rowIdx2++);
                    totalRow.createCell(0).setCellValue("");
                    totalRow.createCell(1).setCellValue("");
                    totalRow.createCell(2).setCellValue("");
                    totalRow.createCell(3).setCellValue("");
                    totalRow.createCell(4).setCellValue("");
                    totalRow.createCell(5).setCellValue("");

                    // Đặt giá trị tổng số lượng và tổng giá trị cho từng Order ID
                    for (Row row : sheet2) {
                        Cell orderIdCell = row.getCell(0);
                        if (orderIdCell != null) {
                            String orderId = orderIdCell.getStringCellValue();
                            if (!orderId.isEmpty()) {
                                Integer orderAmount = orderAmountMap.get(orderId);
                                if (orderAmount != null) {
                                    row.createCell(5).setCellValue(orderAmount);
                                }
                            }
                        }
                    }

                    resultSet2.close();

                    // Gửi file Excel về client
                    response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
                    response.setHeader("Content-Disposition", "attachment; filename=\"OrderData.xlsx\"");

                    workbook.write(response.getOutputStream());
                    workbook.close();
                }
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            response.getWriter().write(ex.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
