package model;

public class User {
    protected int id;
    protected String name;
    protected String email;
    protected int countryId;

    public User() {
    }

    public User(String name, String email, int countryId) {
        this.name = name;
        this.email = email;
        this.countryId = countryId;
    }

    public User(int id, String name, String email, int countryId) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.countryId = countryId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getCountryId() {
        return countryId;
    }

    public void setCountryId(int countryId) {
        this.countryId = countryId;
    }
}
