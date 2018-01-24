package com.bw.service;

import java.util.Map;

public interface JedisService {
	//string 
	public String get(String key);
	public String set(String key,String value);
	//hashmap
	public long hSet(String key,String field,String value);
	public String hGet(String key,String field);
	public Map<String,String> hGetAll(String key);
	public long hDel(String key,String field);
}
