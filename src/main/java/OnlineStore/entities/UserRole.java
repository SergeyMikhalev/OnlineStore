package OnlineStore.entities;

import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;

@Entity
@Table(name = "SecurityRoles")
public class UserRole implements GrantedAuthority {

    // Поля
    @Column(name = "RoleId")
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @Column(name = "RoleName")
    private String rolename;

    // Конструкторы
    public UserRole(String rolename) {
        this.rolename = rolename;
    }

    public UserRole() {}

    // Getters'n'Setters

    public int getId() {
        return id;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    @Override
    public String getAuthority() {
        return rolename;
    }

    // Hascode and Equals

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof UserRole)) return false;

        UserRole userRole = (UserRole) o;

        return id == userRole.id;
    }

    @Override
    public int hashCode() {
        return id;
    }

    //

    @Override
    public String toString() {
        return "UserRole{" +
                "id=" + id +
                ", rolename='" + rolename + '\'' +
                '}';
    }
}
