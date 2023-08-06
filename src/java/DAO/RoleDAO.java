package DAO;

import Model.Role;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RoleDAO extends DBContext {

    public List<Role> getAll() {
        List<Role> list = new ArrayList<>();
        String sql = "select * from [Roles]";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                list.add(new Role(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
    
     public ArrayList<Role> getAllById() {
        ArrayList<Role> list = new ArrayList<>();
        String sql = "select * from [Roles]"
                + "WHERE role_id = 2 OR role_id = 3";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                list.add(new Role(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
    
    
    

    // Update role name by Id, set Permissions to role
    public void updateRoleById(int id, String name, List<Integer> permissions) {
        String sql = "update [Roles] set role_name = ? where role_id = ?";
        String sqlDeleteOldPermission = "delete from [RolePermissions] where roleId = ?";
        String sqlUpdateRolePermission = "insert into [RolePermissions] values (?, ?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            PreparedStatement st2 = connection.prepareStatement(sqlDeleteOldPermission);
            PreparedStatement st3 = connection.prepareStatement(sqlUpdateRolePermission);
            st.setString(1, name);
            st.setInt(2, id);
            st2.setInt(1, id);
            st.executeUpdate();
            st2.executeUpdate();

            for (Integer permission : permissions) {
                st3.setInt(1, permission);
                st3.setInt(2, id);

                st3.executeUpdate();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void createRole(String name) {
        String sql = "insert into [Roles] values (?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteRole(int id) {
        String sql = "delete from [Roles] where role_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public boolean isCan(int roleId, int permissionId) {
        String sql = "select * from [RolePermissions] where roleId = ? and permissionId = ?";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, roleId);
            st.setInt(2, permissionId);
            ResultSet rs = st.executeQuery();
            
            if (rs.next()) {
                return true;
            }
        }catch(SQLException e) {
            e.printStackTrace();
        }
        
        return false;
    }
}
