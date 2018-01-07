package OnlineStore.requests;

public class NewProductRequest
{
    private String prodName;
    private String prodDesc;
    private String prodCost;

    public NewProductRequest(String prodName, String prodDesc, String prodCost) {
        this.prodName = prodName;
        this.prodDesc = prodDesc;
        this.prodCost = prodCost;
    }

    public NewProductRequest() {
    }

    //===================================================

    public String getProdName() {
        return prodName;
    }

    public void setProdName(String prodName) {
        this.prodName = prodName;
    }

    public String getProdDesc() {
        return prodDesc;
    }

    public void setProdDesc(String prodDesc) {
        this.prodDesc = prodDesc;
    }

    public String getProdCost() {
        return prodCost;
    }

    public void setProdCost(String prodCost) {
        this.prodCost = prodCost;
    }

    //====================================================


    @Override
    public String toString() {
        return "NewProductRequest{" +
                "prodName='" + prodName + '\'' +
                ", prodDesc='" + prodDesc + '\'' +
                ", prodCost='" + prodCost + '\'' +
                '}';
    }
}
