package BusinessCard;

import java.util.ArrayList;

public class TestData {
	private ArrayList<BusinessCard> bcData;
	private static TestData instance;

	public static TestData getInstance() {
		if (instance == null)
			instance = new TestData();
		return instance;
	}

	public TestData() {
		bcData = new ArrayList<BusinessCard>();
		for (int i = 0; i < 10; i++) {
			bcData.add(new BusinessCard(i, "������", "010-0000-0000", "��", "����", "gmail", "2020-11-19", "ȸ��", "����Ư����", "11111", "000", "000", "����"));
		}
	}

	public ArrayList<BusinessCard> getBcData() {
		return bcData;
	}

	public void setBcData(ArrayList<BusinessCard> bcData) { this.bcData = bcData; } 

	public BusinessCard getOneBC(int id) {
		for(BusinessCard bc:bcData) {
			if(bc.getId() == id) return bc;
		}
		return null;
	}
}