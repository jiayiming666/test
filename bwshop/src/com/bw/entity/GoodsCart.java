package com.bw.entity;

public class GoodsCart extends Goods{
	private int id;
	private int uid;
	private int gnum;
	private int gid;
	private double gtotal;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getGnum() {
		return gnum;
	}
	public void setGnum(int gnum) {
		this.gnum = gnum;
	}
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public double getGtotal() {
		return gtotal;
	}
	public void setGtotal(double gtotal) {
		this.gtotal = gtotal;
	}
	@Override
	public String toString() {
		return "GoodsCart [id=" + id + ", uid=" + uid + ", gnum=" + gnum + ", gid=" + gid + ", gtotal=" + gtotal + "]";
	}
}
