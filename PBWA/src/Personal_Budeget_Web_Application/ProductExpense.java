package Personal_Budeget_Web_Application;

public class ProductExpense {
	private int id;
	private String purpose;
	private String category;
	private Double sum;
	private String dfec;

	public ProductExpense() {

	}

	public ProductExpense(int id) {

		this.id = id;
	}

	public ProductExpense(int id, String purpose, String category, Double sum, String dfec) {

		this.id = id;
		this.purpose = purpose;
		this.category = category;
		this.sum = sum;
		this.dfec = dfec;
	}

	public ProductExpense(String purpose, String category, Double sum, String dfec) {

		this.purpose = purpose;
		this.category = category;
		this.sum = sum;
		this.dfec = dfec;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPurpose() {
		return purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Double getSum() {
		return sum;
	}

	public void setSum(Double sum) {
		this.sum = sum;
	}

	public String getDfec() {
		return dfec;
	}

	public void setDfec(String dfec) {
		this.dfec = dfec;
	}

}
