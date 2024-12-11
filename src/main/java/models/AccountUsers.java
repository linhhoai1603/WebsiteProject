package models;

public class AccountUsers {
    private int id;
    private String username;
    private String password;
    private int role;
    private int locked;
    public AccountUsers() {};
    public AccountUsers(int id, String username, String password, int role, int locked) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.role = role;
        this.locked = locked;
    }
    public int getId() {return id;};
    public void setId(int id) {this.id = id;};
    public String getUsername() {return username;};
    public void setUsername(String username) {this.username = username;};
    public String getPassword() {return password;};
    public void setPassword(String password) {this.password = password;};
    public int getRole() {return role;};
    public void setRole(int role) {this.role = role;};
    public int getLocked() {return locked;};
    public void setLocked(int locked) {this.locked = locked;};

}
