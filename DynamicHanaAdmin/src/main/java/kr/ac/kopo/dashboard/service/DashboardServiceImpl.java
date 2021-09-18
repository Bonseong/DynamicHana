package kr.ac.kopo.dashboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dashboard.dao.DashboardDAO;
import kr.ac.kopo.dashboard.vo.DashboardVO;

@Service
public class DashboardServiceImpl implements DashboardService{
	
	@Autowired
	private DashboardDAO dashboardDAO;

	public DashboardVO selectTotalMember() {
		DashboardVO totalMember = dashboardDAO.selectTotalMember();
		return totalMember;
	}

	public DashboardVO selectTotalTransaction() {
		DashboardVO totalTransaction = dashboardDAO.selectTotalTransaction();
		return totalTransaction;
	}

	public DashboardVO selectTotalAmount() {
		DashboardVO totalAmount = dashboardDAO.selectTotalAmount();
		return totalAmount;
	}

	public DashboardVO selectTotalCluster() {
		DashboardVO totalCluster = dashboardDAO.selectTotalCluster();
		return totalCluster;
	}

	public List<DashboardVO> selectWeelkyConsumption() {
		
		List<DashboardVO> weelkyConsumption = dashboardDAO.selectWeelkyConsumption();
		return weelkyConsumption;
	}

	public List<DashboardVO> selectMonthlyConsumption() {
		List<DashboardVO> monthlyConsumption = dashboardDAO.selectMonthlyConsumption();
		return monthlyConsumption;
	}

	public List<DashboardVO> selectMemberCluster() {
		List<DashboardVO> memberCluster = dashboardDAO.selectMemberCluster();
		return memberCluster;
	}

	public List<DashboardVO> selectTopTenCard() {
		List<DashboardVO> topTenCard = dashboardDAO.selectTopTenCard();
		return topTenCard;
	}

	public DashboardVO selectConsumptionTimeSlot() {
		DashboardVO consumptionTimeSolt = dashboardDAO.selectConsumptionTimeSlot();
		return consumptionTimeSolt;
	}
	
	
	
	
	
	
	
	
	
	
}
