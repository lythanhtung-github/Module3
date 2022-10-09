package service;

import model.Product;

import java.util.List;

public interface ProductService {
    List<Product> findAll();

    void add(Product newProduct);

    void update(Product newProduct);

    void delete(int id);

    Product findById(int id);
}
