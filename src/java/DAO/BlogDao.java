package DAO;

import Model.Blog;
import Model.User;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class BlogDao extends DBContext {

    public Blog getBlogByBlogId(int blogId) {
        Blog blog = null;
        String sql = "select b.blog_id, b.blog_title, b.blog_image, u.user_name, b.[post date], b.Content\n"
                + "from [blog] b inner join [users] u on u.user_id = b.user_id\n"
                + "where b.blog_id =?   ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, blogId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                blog = new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), new User(rs.getString(4)), rs.getDate(5), rs.getString(6));
                return blog;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Blog> getBlogs() {
        ArrayList<Blog> list = new ArrayList<>();
        String sql = "SELECT b.blog_id, b.blog_title, b.blog_image, u.user_name, b.[post date], b.content  \n"
                + "FROM blog b JOIN Users u ON b.user_id = u.user_id order by b.[post date] desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Blog blog = new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), new User(rs.getString(4)), rs.getDate(5), rs.getString(6));
//                Blog blog = new Blog(blog_id, blog_title, blog_image, user_id, post_date, content);
                list.add(blog);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (list);
    }
    // phan trang trả về danh sách blog trong page

    public List<Blog> getListByPage(List<Blog> list, int start, int end) {
        ArrayList<Blog> listByPage = new ArrayList<>();

        for (int i = start; i < end; i++) {
            listByPage.add(list.get(i));
        }
        return listByPage;
    }

    public ArrayList<Blog> recentBlog() {
        ArrayList<Blog> list = new ArrayList<>();
        String sql = "SELECT TOP (3) b.*,u.*\n"
                + "  \n"
                + "  FROM [Blog] b inner join [Users] u on b.user_id  = u.user_id\n"
                + "  order by [post date] desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Blog(
                        rs.getInt(1), rs.getString(2), rs.getString(3),
                        new User(rs.getString(8)),
                        rs.getDate(5),
                        rs.getString(6)));

            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (list);
    }

    public void addBlog(String title, String img, int userId, String content) {
        String sql = "INSERT INTO Blog "
                + "([blog_title], [blog_image], [user_id], [post date], [content])"
                + " VALUES ( ?, ?, ?, GETDATE(), ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, img);
            ps.setInt(3, userId);
            ps.setString(4, content);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }

    public void updateBlog(String title, String img, String content, int id) {
        String sql = "UPDATE [Blog]\n"
                + " SET [blog_title] = ?, [blog_image] = ?, [content] = ?, [post date]= getDate() \n"
                + " WHERE [blog_id] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, img);
            ps.setString(3, content);
            ps.setInt(4, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void DeleteBlog(int bid) {
        String sql = "  DELETE FROM [Blog] WHERE blog_id =?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, bid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public ArrayList<Blog> searchBlog(String search) {

        ArrayList<Blog> list = new ArrayList<>();
        String sql = "SELECT b.blog_id, b.blog_title, b.blog_image, u.user_name, b.[post date], b.content\n"
                + "FROM Blog b\n"
                + "JOIN Users u ON b.user_id = u.user_id\n"
                + "WHERE blog_title LIKE ?\n"
                + "ORDER BY blog_title ASC;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), new User(rs.getString(4)), rs.getDate(5), rs.getString(6))
                );
            }
        } catch (Exception e) {
        }
        return list;
    }

    public ArrayList<Blog> getBlogByDate(Date fdate, Date sdate) {
        ArrayList<Blog> list = new ArrayList<>();
        String sql = "SELECT b.blog_id, b.blog_title, b.blog_image, u.user_name, b.[post date], b.content\n"
                + "FROM Blog b\n"
                + "JOIN Users u ON b.user_id = u.user_id\n"
                + "WHERE b.[post date] BETWEEN ? AND ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setDate(1, (java.sql.Date) fdate);
            ps.setDate(2, (java.sql.Date) sdate);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                list.add(new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), new User(rs.getString(4)), rs.getDate(5), rs.getString(6)));
            }
        } catch (SQLException e) {

        }
        return list;
    }

//    public static void main(String[] args) {
//        BlogDao bld = new BlogDao();
//        List<Blog> list = bld.getBlogs();
//        System.out.println(list.get(0).getBlog_id());
//    }
}
