package service;

import model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductServiceImpl implements ProductService{
    private static final List<Product> products;
    static{
        products = new ArrayList<>();
        products.add(new Product(1,"Iphone 11", 100000, 100));
        products.add(new Product(2,"Iphone 12", 200000, 200));
    }

    public List<Product> findAll() {
        return products;
    }

    @Override
    public void add(Product newProduct) {
        products.add(newProduct);
    }

    @Override
    public void update(Product newProduct) {
        for (Product product:products) {
            if(newProduct.getId() == product.getId()){
                product.setName(newProduct.getName());
                product.setPrice(newProduct.getPrice());
                product.setQuantity(newProduct.getQuantity());
            }
        }
    }

    @Override
    public void delete(int id) {
        products.remove(id);
    }

    @Override
    public Product findById(int id) {
        for (Product product:products) {
            if(id == product.getId()){
                return product;
            }
        }
        return null;
    }
}
