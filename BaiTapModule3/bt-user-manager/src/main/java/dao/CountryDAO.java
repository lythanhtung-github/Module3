package dao;

import model.Country;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CountryDAO implements ICountryDAO{
    private String jdbcURL = "jdbc:mysql://localhost:3306/demo_bt_user?useSSL=false";
    private String jdbcCountryname = "root";
    private String jdbcPassword = "Toiphaithanhcong.152";

    private static final String INSERT_COUNTRY_SQL = "INSERT INTO country(name) VALUES (?);";
    private static final String SELECT_COUNTRY_BY_ID = "select * from country where id =?;";
    private static final String SELECT_ALL_COUNTRY = "SELECT * FROM country";
    private static final String DELETE_COUNTRY_SQL = "delete from country where id = ?;";
    private static final String UPDATE_COUNTRY_SQL = "update country set name = ? where id = ?;";

    public CountryDAO() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcCountryname, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void insertCountry(Country Country) throws SQLException {
        System.out.println(INSERT_COUNTRY_SQL);
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_COUNTRY_SQL)) {
            preparedStatement.setString(1, Country.getName());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public Country selectCountry(int id) {
        Country Country = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_COUNTRY_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                Country = new Country(id, name);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return Country;
    }

    public List<Country> selectAllCountry() {
        List<Country> countryList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_COUNTRY);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                countryList.add(new Country(id, name));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return countryList;
    }

    public boolean deleteCountry(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_COUNTRY_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateCountry(Country Country) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_COUNTRY_SQL);) {
            statement.setString(1, Country.getName());
            statement.setInt(2, Country.getId());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
