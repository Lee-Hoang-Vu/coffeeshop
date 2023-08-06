/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Objects;

/**
 *
 * @author kienb
 */
public class ProductDTO {
    private Product product;
    private ProductSize productSize;
    private int quantity;

    public ProductDTO() {
    }

    public ProductDTO(Product product, ProductSize productSize) {
        this.product = product;
        this.productSize = productSize;
    }

    public ProductDTO(Product product, ProductSize productSize, int quantity) {
        this.product = product;
        this.productSize = productSize;
        this.quantity = quantity;
    }

    
    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public ProductSize getProductSize() {
        return productSize;
    }

    public void setProductSize(ProductSize productSize) {
        this.productSize = productSize;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 71 * hash + Objects.hashCode(this.product.getId());
        if(this.productSize != null){
            hash = 71 * hash + Objects.hashCode(this.productSize.getId());
        }        
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final ProductDTO other = (ProductDTO) obj;
        if (!Objects.equals(this.product.getId(), other.product.getId())) {
            return false;
        }
        if(this.productSize == null){
            return other.productSize == null;
        }
        if(other.productSize == null){
            return this.productSize == null;
        }
        return Objects.equals(this.productSize.getId(), other.productSize.getId());
    }
    
    
}
