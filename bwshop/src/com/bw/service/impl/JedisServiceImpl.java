package com.bw.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bw.service.JedisService;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
@Service
public class JedisServiceImpl implements JedisService {
	@Autowired
	private JedisPool jedisPool;

	@Override
	public String get(String key) {
		Jedis jedis = jedisPool.getResource();
		String str = jedis.get(key);
		jedis.close();
		return str;
	}

	@Override
	public String set(String key, String value) {
		Jedis jedis = jedisPool.getResource();
		String str = jedis.set(key, value);
		jedis.close();
		return str;
	}

	@Override
	public long hSet(String key, String field, String value) {
		Jedis jedis = jedisPool.getResource();
		long str = jedis.hset(key, field, value);
		jedis.close();
		return str;
	}

	@Override
	public String hGet(String key, String field) {
		Jedis jedis = jedisPool.getResource();
		String str = jedis.hget(key, field);
		jedis.close();
		return str;
	}

	@Override
	public Map<String, String> hGetAll(String key) {
		Jedis jedis = jedisPool.getResource();
		Map<String, String> str = jedis.hgetAll(key);
		jedis.close();
		return str;
	}

	@Override
	public long hDel(String key, String field) {
		Jedis jedis = jedisPool.getResource();
		long str = jedis.hdel(key, field);
		jedis.close();
		return str;
	}
}
