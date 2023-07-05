/*
 *     DuyDuc94
 */
package model;

import dal.ProductDAO;

public class Category {

    private int ID;
    private String Name;

    public Category() {
    }

    public Category(int ID, String Name) {
        this.ID = ID;
        this.Name = Name;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }
    
    public int getQuantity(String name){
        ProductDAO proDAO = new ProductDAO();
        return proDAO.getProducts(name).size();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Category{");
        sb.append("ID=").append(ID);
        sb.append(", Name=").append(Name);
        sb.append('}');
        return sb.toString();
    }
}