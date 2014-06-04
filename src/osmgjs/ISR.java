package osmgjs;

import java.io.Serializable;

public class ISR implements Serializable  {
	private String agentName;
	private int agentNumber;
	private int ezApp;
	private int temp;
	private int queued;
	private int pending;
	private int delivered;
	private int cancelled;
	private int open;
	private String[] isrCustomerInfoList;
	
	
	public String getAgentName() {
		return agentName;
	}
	public void setAgentName(String agentName) {
		this.agentName = agentName;
	}
	public int getAgentNumber() {
		return agentNumber;
	}
	public void setAgentNumber(int agentNumber) {
		this.agentNumber = agentNumber;
	}
	public int getEzApp() {
		return ezApp;
	}
	public void setEzApp(int ezApp) {
		this.ezApp = ezApp;
	}
	public int getTemp() {
		return temp;
	}
	public void setTemp(int temp) {
		this.temp = temp;
	}
	public int getQueued() {
		return queued;
	}
	public void setQueued(int queued) {
		this.queued = queued;
	}
	public int getPending() {
		return pending;
	}
	public void setPending(int pending) {
		this.pending = pending;
	}
	public int getDelivered() {
		return delivered;
	}
	public void setDelivered(int delivered) {
		this.delivered = delivered;
	}
	public int getCancelled() {
		return cancelled;
	}
	public void setCancelled(int cancelled) {
		this.cancelled = cancelled;
	}
	public int getOpen() {
		return open;
	}
	public void setOpen(int open) {
		this.open = open;
	}
	public String[] getIsrCustomerInfoList() {
		return isrCustomerInfoList;
	}
	public void setIsrCustomerInfoList(String[] isrCustomerInfoList) {
		this.isrCustomerInfoList = isrCustomerInfoList;
	}
}